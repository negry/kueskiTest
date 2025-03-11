//
//  KueskiEndpointProtocol.swift
//  KueskiMovies
//
//  Created by Alonso Orozco on 10/03/25.
//

import Foundation

/// This can be conformed by any Endpoint we need to define in order to always conforme this parameters and create the request
protocol KueskiEndpointProtocol {
    var path: String { get }
    var method: String { get }
    var headers: [String: String]? { get }
    var queryItems: [URLQueryItem]? { get }
    var body: Data? { get }
}
