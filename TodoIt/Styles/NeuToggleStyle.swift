//
//  NeuToggleStyle.swift
//  TodoIt
//
//  Created by Jorge Luis Toledo on 6/18/23.
//

import SwiftUI

struct NeuToggleStyle: ToggleStyle {
    var isDisabled = false
    var action: () -> Void
    
    func makeBody(configuration: Configuration) -> some View {
        Button(action: action, label: {
            ZStack {
                configuration.label
                    .padding(30)
                    .contentShape(Circle())
                
                if configuration.isOn {
                    Image(systemName: "checkmark")
                        .font(.largeTitle.bold())
                        .foregroundColor(.darkEnd)
                }
            }
        }).background(
            ControlBackgroundView(isHighlighted: configuration.isOn, isDisabled: isDisabled, shape: Circle())
        )
    }
}

struct NeuToggleStyle_Previews: PreviewProvider {
    static var previews: some View {
        Toggle(isOn: .constant(true)) {
            Image(systemName: "heart.fill")
                // .foregroundColor(isToggled ? .white : .darkEnd)
                .foregroundColor(.white)
        }.toggleStyle(NeuToggleStyle(action: {}))
    }
}
