//
//  AddTodoUseCase.swift
//  DomainLayer
//
//  Created by Miguel Dönicke on 09.10.22.
//

import Foundation

public protocol AddTodoUseCase {
    func callAsFunction(todo: Todo) async -> Result<Todo, Error>
}

public class DefaultAddTodoUseCase: AddTodoUseCase {
    private let repository: TodoRepository

    public init(repository: TodoRepository) {
        self.repository = repository
    }

    public func callAsFunction(todo: Todo) async -> Result<Todo, Error> {
        await repository.add(todo: todo)
    }
}
