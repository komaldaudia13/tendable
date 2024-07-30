//
//  InspectionTypes.swift
//  mobileAppTest
//
//  Created by Komal Daudia on 22/07/24.
//

import Foundation

struct Inspection: Codable {
    let id: Int
    let inspectionType: InspectionTypes
    let area: Areas
    let survey: Survey
    
    enum CodingKeys: String, CodingKey {

        case id = "id"
        case inspectionType = "inspectionType"
        case area = "Areas"
        case survey = "survey"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)!
        inspectionType = try values.decodeIfPresent(InspectionTypes.self, forKey: .inspectionType)!
        area = try values.decodeIfPresent(Areas.self, forKey: .area)!
        survey = try values.decodeIfPresent(Survey.self, forKey: .survey)!
    }
}

struct Survey: Codable {
    let id: Int
    let categories: [Category]
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case categories = "categories"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id) ?? 0
        categories = try values.decodeIfPresent([Category].self, forKey: .categories)!
    }

}

struct InspectionTypes : Codable {
    let id : Int?
    let name : String?
    let access : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case access = "access"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        access = try values.decodeIfPresent(String.self, forKey: .access)
    }

}


