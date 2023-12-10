//
//  TodoListItemView.swift
//  TodoIt
//
//  Created by Jorge Luis Toledo on 6/17/23.
//

import SwiftUI

struct TodoListItemView: View {
    @EnvironmentObject var todoViewModel: TodoViewModel
    var todo: Todo
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(todo.title)
                    .font(.title.weight(.light))
                
                Text(todo.content)
            }
            
            Spacer()
            
            Toggle(isOn: .constant(todo.isDone)) {
                Text("")
            }.toggleStyle(NeuToggleStyle(action: {
                let newTodo = Todo(id: todo.id, title: todo.title, content: todo.content, isDone: !todo.isDone)
                
                todoViewModel.update(newTodo)
            }))
        }
        .padding()
        
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(LinearGradient(.darkStart, .darkEnd))
                .shadow(color: .darkEnd.opacity(0.7), radius: 10, x: 10, y: 10)
                .shadow(color: .darkStart.opacity(0.7), radius: 10, x: -5, y: -5)
        )
        .padding()
    }
}

struct TodoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListItemView(todo: .sampleItem)
    }
}
