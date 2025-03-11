//
//  MovieResponse.swift
//  KueskiMovies
//
//  Created by Alonso Orozco on 10/03/25.
//

import Foundation

struct MovieResponse: Decodable {
    let page: Int
    let results: [Movie]
    let totalPages: Int
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct Movie: Decodable {
    let id: Int
    let title: String
    let originalTitle: String
    let overview: String
    let releaseDate: String
    let posterPath: String?
    let backdropPath: String?
    let genreIDs: [Int]
    let popularity: Double
    let voteAverage: Double
    let voteCount: Int
    let originalLanguage: String
    let adult: Bool
    let video: Bool

    enum CodingKeys: String, CodingKey {
        case id, title, overview, popularity, video, adult
        case originalTitle = "original_title"
        case releaseDate = "release_date"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case genreIDs = "genre_ids"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case originalLanguage = "original_language"
    }
}

