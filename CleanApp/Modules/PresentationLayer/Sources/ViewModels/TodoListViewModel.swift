//
//  TodoListViewModel.swift
//  PresentationLayer
//
//  Created by Miguel Dönicke on 09.10.22.
//

import DomainLayer
import Foundation

public class TodoListViewModel: ObservableObject {
    private let getAllTodosUseCase: GetAllTodosUseCase
    private let addTodoUseCase: AddTodoUseCase
    private let completeTodoUseCase: CompleteTodoUseCase

    @Published public var newTodoText = ""
    @Published public private(set) var todos = [Todo]()
    @Published public private(set) var addNewTodoIsDisabled = false

    public init(
        getAllTodosUseCase: GetAllTodosUseCase,
        addTodoUseCase: AddTodoUseCase,
        completeTodoUseCase: CompleteTodoUseCase
    ) {
        self.getAllTodosUseCase = getAllTodosUseCase
        self.addTodoUseCase = addTodoUseCase
        self.completeTodoUseCase = completeTodoUseCase
    }

    @MainActor
    @Sendable
    public func loadTodos() async {
        _ = await getAllTodosUseCase.execute()
            .map {
                self.todos = $0
            }
    }

    @MainActor
    public func addTodo() async {
        defer {
            addNewTodoIsDisabled = false
        }

        addNewTodoIsDisabled = true

        let todo = Todo(title: newTodoText)
        let result = await addTodoUseCase.execute(todo: todo)
        if case .success(let newTodo) = result {
            todos.append(newTodo)
            newTodoText = ""
        } else {
            fatalError("FIX ME :D")
        }
    }

    @MainActor
    public func completeTodo(id: Int) async {
        let result = await completeTodoUseCase.execute(id: id)
        if case .success(let completedTodo) = result,
           let index = todos.firstIndex(where: { $0.id == completedTodo.id }) {
            todos.remove(at: index)
            todos.insert(completedTodo, at: index)
        } else {
            fatalError("FIX ME :D")
        }
    }
}
