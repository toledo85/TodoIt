//
//  NeuButtonStyle.swift
//  TodoIt
//
//  Created by Jorge Luis Toledo on 6/18/23.
//

import SwiftUI

struct NeuButtonStyle<T: Shape>: ButtonStyle {
    var shape: T
    var isDisabled = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(20)
            .contentShape(Circle())
            .background(
                ControlBackgroundView(isHighlighted: configuration.isPressed, isDisabled: isDisabled, shape: shape)
            )
            .animation(nil, value: configuration.isPressed)
    }
}

struct NeuButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {
            print("Button tapped")
        }, label: {
            Image(systemName: "plus")
                .foregroundColor(.white)
        }).buttonStyle(NeuButtonStyle(shape: Circle(), isDisabled: false))
    }
}
