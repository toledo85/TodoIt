//
//  TodoViewModel.swift
//  TodoIt
//
//  Created by Jorge Luis Toledo on 6/17/23.
//

import SwiftUI
import NetworkUtils

@MainActor 
class TodoViewModel: ObservableObject {
    @Published var todos = [Todo]()
    private let httpClient: HttpClient
    private let endpoint = "\(Constants.baseURL)/todos"
    
    init() {
        let tokenProvider = LocalTokenProvider()
        let httpClient = HttpSignedService(tokenProvider: tokenProvider)
        self.httpClient = httpClient
    }
    
    func fetch() {
        Task {
            do {
                let response: Response<[Todo]> = try await httpClient.getFromJson(to: endpoint)
                todos = response.data ?? []
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func create(newTodo: Todo) {
        Task {
            _ = try? await httpClient.postAsJson(to: endpoint, object: newTodo)
            fetch()
        }
    }
    
    func update(_ updatedTodo: Todo) {
        Task {
            _ = try? await httpClient.put(to: endpoint, object: updatedTodo)
            fetch()
        }
    }
    
    #warning("Does not implemented")
    func delete(at offsets: IndexSet) {
        for index in offsets {
            Task {
                let endpoint = "\(self.endpoint)/\(todos[index].id)"
                _ = try? await httpClient.delete(to: endpoint)
                fetch()
            }
        }
    }
}
