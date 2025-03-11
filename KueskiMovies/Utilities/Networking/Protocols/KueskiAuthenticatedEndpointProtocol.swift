//
//  KueskiAuthenticatedEndpointProtocol.swift
//  KueskiMovies
//
//  Created by Alonso Orozco on 10/03/25.
//

import Foundation

/// This is because it could be cases where not all endpoints needs authentication so,
/// we create this in order to follow the Interface segregation principle
protocol KueskiAuthenticatedEndpointProtocol: KueskiEndpointProtocol {}

extension KueskiAuthenticatedEndpointProtocol {
    var bearerToken: String {
        guard let token = Bundle.main.object(forInfoDictionaryKey: "BEARER_TOKEN") as? String else {
            fatalError("Bearer token not found in xcconfig")
        }
        return "Bearer \(token)"
    }
}
