//
//  Todo.swift
//  TodoIt
//
//  Created by Jorge Luis Toledo on 6/17/23.
//

import Foundation

struct Todo: Identifiable, Codable, Hashable {
    let id: Int
    let title: String
    let content: String
    let isDone: Bool
}

#if DEBUG
extension Todo {
    static let sampleItem = Todo(id: 1, title: "Curabitur blandit tempus porttitor.", content: "Donec id elit non mi porta gravida at eget metus.", isDone: false)
}
#endif

extension Todo {
    enum Filter: String, CaseIterable, Hashable {
        case all = "All"
        case undone = "Undone"
        case done = "Done"
    }
}
