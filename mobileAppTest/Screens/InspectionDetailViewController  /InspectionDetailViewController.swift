//
//  InspectionDetailViewController.swift
//  mobileAppTest
//
//  Created by Komal Daudia on 30/07/24.
//

import UIKit

import UIKit

class InspectionDetailViewController: UITableViewController {
    var category: Category?
    var viewModel = InspectionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.showError = { [weak self] message in
            self?.showAlert(message: message)
        }
        
        viewModel.inspectionSubmitted = { [weak self] in
            self?.showAlert(message: "Inspection submitted successfully!")
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return category?.questions.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category?.questions[section].answerChoices.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerChoiceCell", for: indexPath)
        if let question = category?.questions[indexPath.section] {
            let answerChoice = question.answerChoices[indexPath.row]
            cell.textLabel?.text = answerChoice.name
            if question.selectedAnswerChoiceId == answerChoice.id {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let question = category?.questions[indexPath.section] {
            let answerChoice = question.answerChoices[indexPath.row]
            viewModel.updateAnswer(for: question.id, with: answerChoice.id)
            tableView.reloadData()
        }
    }
    
    @IBAction func submitButtonTapped(_ sender: UIBarButtonItem) {
        viewModel.submitInspection()
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

