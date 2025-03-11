//
//  LocalizedKey.swift
//  KueskiMovies
//
//  Created by Alonso Orozco on 11/03/25.
//

import Foundation

@dynamicMemberLookup
enum LocalizedKey {
    
    // MARK: - MovieList Strings
    enum MovieList: String, Localizable {
        case title = "movieList.title"
        case loading = "movieList.loading"
        case error = "movieList.errorTitle"
    }
    
    subscript(dynamicMember key: String) -> String {
        NSLocalizedString(key, comment: "")
    }
}
