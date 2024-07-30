//
//  InspectionService.swift
//  mobileAppTest
//
//  Created by Komal Daudia on 30/07/24.
//

import Foundation

class InspectionService {
    static let shared = InspectionService()
    private let baseUrl = "http://localhost:5001/api"
    
    private init() {}
    
    func startInspection(completion: @escaping (Result<Inspection, Error>) -> Void) {
        guard let url = URL(string: "\(baseUrl)/inspections/start") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: nil)))
                return
            }
            
            do {
                let inspection = try JSONDecoder().decode(Inspection.self, from: data)
                completion(.success(inspection))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func submitInspection(inspection: Inspection, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let url = URL(string: "\(baseUrl)/inspections/submit") else { return }
        var request =  NSMutableURLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try? JSONEncoder().encode(inspection)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request as URLRequest) { _, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    completion(.success(()))
                } else {
                    completion(.failure(NSError(domain: "", code: httpResponse.statusCode, userInfo: nil)))
                }
            }
        }.resume()
    }
}
