//
//  AsyncImages+BaseURL.swift
//  KueskiMovies
//
//  Created by Alonso Orozco on 11/03/25.
//

import Foundation

extension KueskiAPIClient {
    static var detailedImageUrl: URL {
        guard let imageUrlString = Bundle.main.object(forInfoDictionaryKey: "DETAILED_MOVIE_IMAGE_URL") as? String,
              let imageUrl = URL(string: "https://\(imageUrlString)") else {
            assertionFailure("imageUrl cannot be created or url not defined in Common.xcconfig")
            return URL(string: "https://image.tmdb.org/t/p/w300")!
        }
        return imageUrl
    }
}
