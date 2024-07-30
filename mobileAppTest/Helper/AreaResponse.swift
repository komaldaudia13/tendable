//
//  AreaResponse.swift
//  mobileAppTest
//
//  Created by Komal Daudia on 22/07/24.
//

import Foundation
struct AreaResponse : Codable {
    let areas : [Areas]?

    enum CodingKeys: String, CodingKey {

        case areas = "areas"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        areas = try values.decodeIfPresent([Areas].self, forKey: .areas)
    }

}
