//
//  LocalTodoRepository.swift
//  DataLayer
//
//  Created by Miguel Dönicke on 08.10.22.
//

import DomainLayer
import Foundation

public class LocalTodoRepository: TodoRepository {
    public enum Error: Swift.Error, Equatable {
        case notFound
    }

    private var todos: [Todo]

    public init() {
        self.todos = []
    }

    public func todos() async -> Result<[Todo], Swift.Error> {
        .success(todos)
    }

    @discardableResult
    public func complete(id: Int) async -> Result<Todo, Swift.Error> {
        if var todo = todos.first(where: { $0.id == id }) {
            todo.completed = true
            return .success(todo)
        } else {
            return .failure(Error.notFound)
        }
    }

    @discardableResult
    public func add(todo: Todo) async -> Result<Todo, Swift.Error> {
        var newTodo = todo
        newTodo.id = todos.count + 1
        todos.append(newTodo)
        return .success(newTodo)
    }
}
