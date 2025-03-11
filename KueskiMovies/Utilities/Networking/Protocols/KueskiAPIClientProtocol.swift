//
//  KueskiAPIClientProtocol.swift
//  KueskiMovies
//
//  Created by Alonso Orozco on 11/03/25.
//

import Foundation

protocol KueskiAPIClientProtocol {
    func fetchRequest<T: Decodable>(for endpoint: KueskiEndpointProtocol) async throws -> T
}

extension KueskiAPIClientProtocol {
    var baseURL: URL {
        guard let baseUrlString = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String,
              let baseUrl = URL(string: "https://\(baseUrlString)") else {
            assertionFailure("baseUrl cannot be created or url not defined in Common.xcconfig")
            return URL(string: "https://api.themoviedb.org")!
        }
        return baseUrl
    }
}
