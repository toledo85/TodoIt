//
//  Color+Extension.swift
//  TodoIt
//
//  Created by Jorge Luis Toledo on 6/18/23.
//

import SwiftUI

extension UIColor {
    static let uiLightEnd = UIColor { traitCollection in
        if traitCollection.userInterfaceStyle == .dark {
            return UIColor(red: 30 / 255, green: 80 / 255, blue:  120 / 255, alpha: 1)
        } else {
            return UIColor(red: 45 / 255, green: 95 / 255, blue:  135 / 255, alpha: 1)
        }
    }
}

extension Color {
    static let darkStart = Color(uiColor: UIColor { traitCollection in
        if traitCollection.userInterfaceStyle == .dark {
            return UIColor(red: 50 / 255, green: 60 / 255, blue:  65 / 255, alpha: 1)
        } else {
            return UIColor(red: 200 / 255, green: 200 / 255, blue:  215 / 255, alpha: 1)
        }
    })
    
    static let darkEnd = Color(uiColor: UIColor { traitCollection in
        if traitCollection.userInterfaceStyle == .dark {
            return UIColor(red: 25 / 255, green: 25 / 255, blue:  30 / 255, alpha: 1)
        } else {
            return UIColor(red: 225 / 255, green: 225 / 255, blue:  235 / 255, alpha: 1)
        }
    })
    
    static let lightStart = Color(uiColor: UIColor { traitCollection in
        if traitCollection.userInterfaceStyle == .dark {
            return UIColor(red: 60 / 255, green: 160 / 255, blue:  240 / 255, alpha: 1)
        } else {
            return UIColor(red: 75 / 255, green: 175 / 255, blue:  255 / 255, alpha: 1)
        }
    })
    
    static var lightEnd: Color {
        Color(uiColor: .uiLightEnd)
    }
}
