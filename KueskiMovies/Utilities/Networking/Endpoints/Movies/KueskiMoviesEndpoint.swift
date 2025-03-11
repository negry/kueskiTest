//
//  KueskiMoviesEndpoint.swift
//  KueskiMovies
//
//  Created by Alonso Orozco on 10/03/25.
//

import Foundation

/// If we need to encapsulate different kind of endpoints like user profile
/// we can create a different enum inside Endpoints folder to modularize each kind of endpoints
enum KueskiMoviesEndpoint: KueskiAuthenticatedEndpointProtocol {
    case discoverMovies(page: Int)

    var path: String {
        switch self {
        case .discoverMovies:
            return "/3/discover/movie"
        }
    }

    var method: String {
        switch self {
        case .discoverMovies:
            return "GET"
        }
    }

    var headers: [String: String]? {
        switch self {
        case .discoverMovies:
            return [
                "Authorization": bearerToken,
                "Content-Type": "application/json"
            ]
        }
    }

    var queryItems: [URLQueryItem]? {
        switch self {
        case .discoverMovies(let page):
            return [
                URLQueryItem(name: "include_adult", value: "false"),
                URLQueryItem(name: "include_video", value: "false"),
                URLQueryItem(name: "language", value: "en-US"),
                URLQueryItem(name: "page", value: "\(page)"),
                URLQueryItem(name: "sort_by", value: "popularity.desc")
            ]
        }
    }

    var body: Data? {
        return nil
    }
}
