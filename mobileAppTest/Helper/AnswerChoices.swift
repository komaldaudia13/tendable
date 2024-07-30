//
//  AnswerChoices.swift
//  mobileAppTest
//
//  Created by Komal Daudia on 22/07/24.
//

import Foundation
struct AnswerChoices : Codable {
    let id : Int?
    let name : String?
    let score : Double?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case score = "score"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        score = try values.decodeIfPresent(Double.self, forKey: .score)
    }

}
