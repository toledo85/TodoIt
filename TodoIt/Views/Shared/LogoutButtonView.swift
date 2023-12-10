//
//  LogoutButtonView.swift
//  TodoIt
//
//  Created by Jorge Luis Toledo on 6/18/23.
//

import SwiftUI

struct LogoutButtonView: View {
    @EnvironmentObject var todoViewModel: TodoViewModel
    @AppStorage("bearerToken") var token: String?
    
    var body: some View {
        Button("Logout") {
            token = nil
            todoViewModel.todos = []
        }.buttonStyle(NeuButtonStyle(shape: Capsule()))
    }
}

struct LogoutButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LogoutButtonView()
    }
}
