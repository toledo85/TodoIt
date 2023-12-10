//
//  Array+Todo.swift
//  TodoIt
//
//  Created by Jorge Luis Toledo on 6/18/23.
//

import Foundation

extension [Todo] {
    func filter(byState value: Todo.Filter) -> [Todo] {
        return switch value {
            case .all: self
            case .undone: self.filter { !$0.isDone }
            case .done: self.filter { $0.isDone }
        }
    }
}
