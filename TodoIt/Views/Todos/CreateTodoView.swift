//
//  CreateTodoView.swift
//  TodoIt
//
//  Created by Jorge Luis Toledo on 6/17/23.
//

import SwiftUI

struct CreateTodoView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var todoViewModel: TodoViewModel
    @State private var title = ""
    @State private var content = ""
    
    var isDisabled: Bool {
        title.isEmpty || content.isEmpty
    }
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                Form {
                    Section("Create todo") {
                        TextField("Title", text: $title)
                        TextField("Content", text: $content)
                    }.autocapitalization(.none)
                }.frame(height: 150)
                    
                Button("Create") {
                    let newTodo = Todo(id: 1, title: title, content: content, isDone: false)
                    todoViewModel.create(newTodo: newTodo)
                    dismiss()
                }.disabled(isDisabled)
                .buttonStyle(NeuButtonStyle(shape: Capsule(), isDisabled: isDisabled))
                
                Spacer()
            }
        }
    }
}

struct CreateTodoView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTodoView(todoViewModel: .init())
    }
}
