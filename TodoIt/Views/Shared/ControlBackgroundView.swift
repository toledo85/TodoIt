//
//  DarkBackgroundView.swift
//  TodoIt
//
//  Created by Jorge Luis Toledo on 6/18/23.
//

import SwiftUI

struct ControlBackgroundView<S: Shape>: View {
    var isHighlighted: Bool
    var isDisabled: Bool
    var shape: S
    
    var body: some View {
        ZStack {
            if isDisabled {
                shape.fill(Color.darkEnd)
            } else if isHighlighted {
                 shape
                    .fill(LinearGradient(.lightEnd, .lightStart))
                    .overlay(shape.stroke(LinearGradient(.lightStart, .lightEnd), lineWidth: 4))
                    .shadow(color: .darkStart, radius: 10, x: 5, y: 5)
                    .shadow(color: .darkEnd, radius: 10, x: -5, y: -5)
            } else {
                shape
                    .fill(LinearGradient(.darkStart, .darkEnd))
                    .overlay(shape.stroke(LinearGradient(.lightStart, .lightEnd), lineWidth: 4))
                    .shadow(color: .darkStart, radius: 10, x: -10, y: -10)
                    .shadow(color: .darkEnd, radius: 10, x: 10, y: 10)
            }
        }
    }
}

struct ControlsBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        ControlBackgroundView(isHighlighted: false, isDisabled: false, shape: Circle())
    }
}
