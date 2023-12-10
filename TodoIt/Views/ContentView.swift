//
//  ContentView.swift
//  TodoIt
//
//  Created by Jorge Luis Toledo on 6/17/23.
//

import SwiftUI

enum ModalType: String, Identifiable {
    case register
    case login
    
    var id: String {
        rawValue
    }
}

struct ContentView: View {
    @StateObject var todoViewModel = TodoViewModel()
    @AppStorage("bearerToken") var token: String?
    @State private var modal: ModalType? = nil
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                if let _ = token {
                    TabView {
                        TodoListView().tabItem {
                            Label("Todos", systemImage: "checklist")
                        }
                        
                        if !todoViewModel.todos.isEmpty {
                            TodosProgressView().tabItem {
                                Label("Progress", systemImage: "chart.bar.fill")
                            }
                        }
                        
                        InfoView().tabItem {
                            Label("Info", systemImage: "info.circle.fill")
                        }
                    }
                    .environmentObject(todoViewModel)
                } else {
                    Spacer()
                    
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                        .foregroundColor(.darkEnd)
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Button("Register") {
                            modal = .register
                        }.buttonStyle(NeuButtonStyle(shape: Capsule()))
                        
                        Spacer()
                        
                        Button("Login") {
                            modal = .login
                        }.buttonStyle(NeuButtonStyle(shape: Capsule()))
                        
                        Spacer()
                    }
                    
                    Spacer()
                }
            }
        }
        .sheet(item: $modal, onDismiss: {}, content: { modal in
            switch modal {
                case .register:
                    RegisterView()
                case .login:
                    LoginView()
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
