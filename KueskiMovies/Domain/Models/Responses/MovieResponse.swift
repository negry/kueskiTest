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

extension Movie {
    static var mock: Movie {
        return Movie(
            id: 1,
            title: "The Matrix",
            originalTitle: "The Matrix",
            overview: "A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.",
            releaseDate: "1999-03-31",
            posterPath: "https://image.tmdb.org/t/p/w500/q73kU9kJmAlPlLf7sQU3GJdh5Vo.jpg",
            backdropPath: "https://image.tmdb.org/t/p/w500/q73kU9kJmAlPlLf7sQU3GJdh5Vo.jpg",
            genreIDs: [28, 878],
            popularity: 9.5,
            voteAverage: 8.7,
            voteCount: 1000000,
            originalLanguage: "en",
            adult: false,
            video: false
        )
    }
}

