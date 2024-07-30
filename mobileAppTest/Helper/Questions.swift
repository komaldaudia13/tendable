//
//  Questions.swift
//  mobileAppTest
//
//  Created by Komal Daudia on 22/07/24.
//

import Foundation
struct Questions : Codable {
    let id : Int?
    let name : String?
    let answerChoices : [AnswerChoices]?
    let selectedAnswerChoiceId : Int?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case answerChoices = "answerChoices"
        case selectedAnswerChoiceId = "selectedAnswerChoiceId"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        answerChoices = try values.decodeIfPresent([AnswerChoices].self, forKey: .answerChoices)
        selectedAnswerChoiceId = try values.decodeIfPresent(Int.self, forKey: .selectedAnswerChoiceId)
    }

}
