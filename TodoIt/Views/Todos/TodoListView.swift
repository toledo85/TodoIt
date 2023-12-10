//
//  TodoListView.swift
//  TodoIt
//
//  Created by Jorge Luis Toledo on 6/17/23.
//

import SwiftUI

struct TodoListView: View {
    @EnvironmentObject var todoViewModel: TodoViewModel
    @State private var isPresented = false
    @State private var selectedValue = Todo.Filter.all
    @State private var searchInputFiled = ""
    @State private var selectedTodo: Int? = nil
    @FocusState private var searchIsFocused: Bool
    
    var addTodoButton: some View {
        Button {
            isPresented = true
        } label: {
            Image(systemName: "plus")
        }.buttonStyle(NeuButtonStyle(shape: Circle()))
    }
    
    var filteredTodos: [Todo] {
        return if searchInputFiled.isEmpty  {
            todoViewModel.todos.filter(byState: selectedValue)
        } else {
            todoViewModel.todos.filter(byState: selectedValue).filter {
                $0.title.localizedCaseInsensitiveContains(searchInputFiled)
            }
        }
    }
        
    var body: some View {
        ZStack {
            BackgroundView()
        
            VStack {
                HStack {
                    Spacer()
                    
                    addTodoButton
                    
                    Spacer().frame(width: 10)
                    
                    LogoutButtonView()
                    
                    Spacer().frame(width: 10)
                }
                
                Picker("Select your student", selection: $selectedValue) {
                    ForEach(Todo.Filter.allCases, id: \.self) {
                        Text($0.rawValue)
                            .tag($0)
                    }
                }
                .pickerStyle(.segmented)
                .tint(.lightEnd)
                .padding()
                
                TextField("Search", text: $searchInputFiled)
                    .focused($searchIsFocused)
                    .autocapitalization(.none)
                    .padding(10)
                    .background(Color.darkEnd, in: RoundedRectangle(cornerRadius: 10))
                    .scrollDismissesKeyboard(.interactively)
                    .padding()
                
                ScrollView {
                    LazyVStack {
                        ForEach(filteredTodos) { todo in
                            TodoListItemView(todo: todo).onTapGesture {
                                withAnimation {
                                    selectedTodo = selectedTodo == todo.id ? nil : todo.id
                                }
                            }
                        }
                    }
                }
                .onTapGesture {
                    searchIsFocused = false
                }
                .refreshable {
                    todoViewModel.fetch()
                }
                .sheet(isPresented: $isPresented) {
                    CreateTodoView()
                }
            }
        }
        .onAppear {
            todoViewModel.fetch()
            
            UISegmentedControl.appearance().selectedSegmentTintColor = .uiLightEnd
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
            .environmentObject(TodoViewModel())
    }
}
