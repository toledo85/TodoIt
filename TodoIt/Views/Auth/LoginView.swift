//
//  LoginView.swift
//  TodoIt
//
//  Created by Jorge Luis Toledo on 6/17/23.
//

import SwiftUI
import NetworkUtils

struct LoginView: View {
    @Environment(\.dismiss) var dismiss
    @AppStorage("bearerToken") var token: String?
    @State private var username = ""
    @State private var password = ""
    @State private var isPresented = false
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            FormView(username: $username, password: $password, title: "Login", buttonTitle: "Login", action: login)
        }.alert(isPresented: $isPresented) {
            Alert(title: Text("Something went wrong, try again!"))
        }
    }
    
    func login() {
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
    
    private func perform(request: URLRequest) async throws -> (Data, URLResponse) {
        return try await URLSession.shared.data(for: request)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
