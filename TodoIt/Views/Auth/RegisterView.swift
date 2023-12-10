//
//  RegisterView.swift
//  TodoIt
//
//  Created by Jorge Luis Toledo on 6/17/23.
//

import SwiftUI
import NetworkUtils

struct RegisterView: View {
    @Environment(\.dismiss) var dismiss
    @AppStorage("bearerToken") var token: String?
    @State private var username = ""
    @State private var password = ""
    @State private var isPresented = false
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            FormView(username: $username, password: $password, title: "Register", buttonTitle: "Register", action: register)
        }
        .alert(isPresented: $isPresented) {
            Alert(title: Text("Something went wrong, try again!"))
        }
    }
    
    private func register() {
        Task {
            let user = User(username: username, password: password)
            let endpoint = "\(Constants.baseURL)/auth/register"
            let (data, _) = try await URLSession.shared.postAsJson(to: endpoint, object: user)
           
//            guard let data = try? await HttpManager.shared.sendData(to: url, object: user) else {
//                isPresented = true
//                return
//            }

//            guard let response = try? JSONDecoder().decode(Response<String>.self, from: data) else {
//                isPresented = true
//                return
//            }
//            
//            guard response.success else {
//                isPresented = true
//                return
//            }
            
            login()
        }
    }
    
    private func login() {
        Task {
            let user = User(username: username, password: password)
            let endpoint = "\(Constants.baseURL)/auth/login"
            let (data, _) = try await URLSession.shared.postAsJson(to: endpoint, object: user)
            
            guard let response = try? JSONDecoder().decode(Response<String>.self, from: data) else {
                isPresented = true
                return
            }
            
            if let fetchedToken = response.data {
                token = "bearer \(fetchedToken)"
            }
            
            dismiss()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
