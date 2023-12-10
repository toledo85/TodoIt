//
//  LinearGradient+Extension.swift
//  TodoIt
//
//  Created by Jorge Luis Toledo on 6/18/23.
//

import SwiftUI

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
