//
//  CacheManager.swift
//  KueskiMovies
//
//  Created by Alonso Orozco on 11/03/25.
//

import Foundation

enum CacheBehavior {
    case sourceOnly
    case firstAvailable
    case cacheOnly
}

final class CacheManager {
    static let shared = CacheManager()
    
    private var cache: [String: Any] = [:]
    
    private init() {}

    func get<T>(forKey key: String,
                behavior: CacheBehavior,
                fetchData: @escaping () async throws -> T) async throws -> T {
        switch behavior {
        case .cacheOnly:
            if let cachedData = cache[key] as? T {
                return cachedData
            } else {
                throw NSError(domain: "CacheError", code: 404, userInfo: [NSLocalizedDescriptionKey: "Data not found in cache"])
            }
            
        case .firstAvailable:
            if let cachedData = cache[key] as? T {
                return cachedData
            } else {
                let data = try await fetchData()
                cache[key] = data
                return data
            }
            
        case .sourceOnly:
            let data = try await fetchData()
            cache[key] = data
            return data
        }
    }
}

