//
//  Text+CustomInitializers.swift
//  KueskiMovies
//
//  Created by Alonso Orozco on 11/03/25.
//

import SwiftUI

extension Text {
    init(_ key: any Localizable) {
        self.init(key.localized)
    }
}
