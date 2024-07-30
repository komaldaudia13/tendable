//
//  InspectionViewModel.swift
//  mobileAppTest
//
//  Created by Komal Daudia on 30/07/24.
//

import Foundation

class InspectionViewModel {
    var inspection: Inspection?
    
    var inspectionStarted: (() -> Void)?
    var inspectionSubmitted: (() -> Void)?
    var showError: ((String) -> Void)?
    
    func startInspection() {
        InspectionService.shared.startInspection { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let inspection):
                    self?.inspection = inspection
                    self?.inspectionStarted?()
                case .failure(let error):
                    self?.showError?(error.localizedDescription)
                }
            }
        }
    }
    
    func submitInspection() {
        guard let inspection = inspection else {
            showError?("No inspection to submit.")
            return
        }
        
        InspectionService.shared.submitInspection(inspection: inspection) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self?.inspectionSubmitted?()
                case .failure(let error):
                    self?.showError?(error.localizedDescription)
                }
            }
        }
    }
    
    func updateAnswer(for questionId: Int, with answerChoiceId: Int) {
        guard let inspection = inspection else { return }
        
        for categoryIndex in inspection.survey.categories.indices {
            for questionIndex in inspection.survey.categories[categoryIndex].questions.indices {
                if inspection.survey.categories[categoryIndex].questions[questionIndex].id == questionId {
                    inspection.survey.categories[categoryIndex].questions[questionIndex].selectedAnswerChoiceId = answerChoiceId
                    break
                }
            }
        }
    }
    
    func calculateScore() -> Float {
        guard let inspection = inspection else { return 0 }
        
        var totalScore: Float = 0
        for category in inspection.survey.categories {
            for question in category.questions {
                if let selectedAnswerChoiceId = question.selectedAnswerChoiceId {
                    if let answerChoice = question.answerChoices.first(where: { $0.id == selectedAnswerChoiceId }) {
                        totalScore += answerChoice.score
                    }
                }
            }
        }
        
        return totalScore
    }
}
