//
//  FormView.swift
//  TodoIt
//
//  Created by Jorge Luis Toledo on 6/17/23.
//

import SwiftUI

struct FormView: View {
    @Binding var username: String
    @Binding var password: String
    let title: String
    let buttonTitle: String
    let action: () -> Void
    
    var isDisabled: Bool {
        username.isEmpty || password.isEmpty
    }
    
    var body: some View {
        VStack {
            Form {
                Section(title) {
                    TextField("Username", text: $username)
                    TextField("Password", text: $password)
                }.autocapitalization(.none)
            }.frame(height: 150)
                
            Button("Submit", action: action)
                .foregroundColor(.gray)
                .buttonStyle(NeuButtonStyle(shape: Capsule(), isDisabled: isDisabled))
                .disabled(isDisabled)
            
            Spacer()
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView(username: .constant(""), password: .constant(""), title: "Login", buttonTitle: "Submit", action: {})
    }
}
