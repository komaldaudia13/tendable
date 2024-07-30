//
//  CategoryNames.swift
//  mobileAppTest
//
//  Created by Komal Daudia on 22/07/24.
//

import Foundation
struct CategoryNames : Codable {
    let arrCategoryNames : [String]?

    enum CodingKeys: String, CodingKey {
        case arrCategoryNames = "categoryNames"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        arrCategoryNames = try values.decodeIfPresent([String].self, forKey: .arrCategoryNames)
    }

}



