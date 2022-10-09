//
//  TodoListView.swift
//  PresentationLayer
//
//  Created by Miguel Dönicke on 09.10.22.
//

import DomainLayer
import SwiftUI

public struct TodoListView: View {
    @ObservedObject
    public var viewModel: TodoListViewModel

    public var body: some View {
        NavigationView {
            VStack {
                TextField("Add Todo", text: $viewModel.newTodoText)
                    .onSubmit {
                        Task {
                            await viewModel.addTodo()
                        }
                    }
                    .padding()
                    .disabled(viewModel.addNewTodoIsDisabled)

                List(viewModel.todos, id: \.id) { todo in
                    if let id = todo.id {
                        HStack {
                            Image(systemName: todo.completed ? "checkmark.circle" : "circle")
                            Text(todo.title)
                        }
                        .onTapGesture {
                            Task {
                                await viewModel.completeTodo(id: id)
                            }
                        }
                    }
                }
                .listStyle(.plain)
            }
            .task(viewModel.loadTodos)
            .navigationTitle("Todos")
        }
    }

    public init(viewModel: TodoListViewModel) {
        self.viewModel = viewModel
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView(viewModel: .preview)
    }
}
