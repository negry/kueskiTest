//
//  LocalizableProtocol.swift
//  KueskiMovies
//
//  Created by Alonso Orozco on 11/03/25.
//

import Foundation

protocol Localizable {
    var localized: String { get }
}

extension Localizable where Self: RawRepresentable, Self.RawValue == String {
    var localized: String {
        NSLocalizedString(rawValue, comment: "")
    }
}
