//
//  InspectionResponse.swift
//  mobileAppTest
//
//  Created by Komal Daudia on 22/07/24.
//

import Foundation
struct InspectionResponse : Codable {
    let inspectionTypes : [InspectionTypes]?

    enum CodingKeys: String, CodingKey {

        case inspectionTypes = "inspectionTypes"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        inspectionTypes = try values.decodeIfPresent([InspectionTypes].self, forKey: .inspectionTypes)
    }

}
