//
//  Constant.swift
//  mobileAppTest
//
//  Created by Komal Daudia on 22/07/24.
//

import Foundation

//NOT in USE just for future
enum Constant {
    enum API {
        static let stationListURL = "/api/generate_random_inspections/"
        static let startInspectionsURL = "/api/inspections/start"
        static let submitInspectionsURL = "/api/inspections/submit"
        static let genrateRandomInspectionsURL = "/api/generate_random_inspections/"
        static let randomInspectionURL = "/api/random_inspection"
        static let inspectionsURL = "/api/inspections/"
        }
    
    enum xibs {
        static let loginViewControllerXIB = "LoginViewController"
        static let InspectionListViewControllerXIB = "InspectionListViewController"
        static let InspectionDetailViewControllerXIB = "InspectionDetailViewController"

    }
}
