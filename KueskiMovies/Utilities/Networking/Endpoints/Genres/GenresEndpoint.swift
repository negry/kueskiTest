//
//  GenresMoviesEndpoint.swift
//  KueskiMovies
//
//  Created by Alonso Orozco on 11/03/25.
//

import Foundation

enum GenresEndpoint: KueskiAuthenticatedEndpointProtocol {
    case allMoviesGenres
    
    var path: String {
        switch self {
        case .allMoviesGenres:
            return "/3/genre/movie/list"
        }
    }

    var method: String {
        switch self {
        case .allMoviesGenres:
            return "GET"
        }
    }

    var headers: [String: String]? {
        switch self {
        case .allMoviesGenres:
            return [
                "Authorization": bearerToken,
                "Content-Type": "application/json"
            ]
        }
    }

    var queryItems: [URLQueryItem]? {
        switch self {
        case .allMoviesGenres:
            return [
                URLQueryItem(name: "language", value: "en"),
            ]
        }
    }

    var body: Data? {
        return nil
    }
}
