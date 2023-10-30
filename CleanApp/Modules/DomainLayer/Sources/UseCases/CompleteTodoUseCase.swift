//
//  CompleteTodoUseCase.swift
//  DomainLayer
//
//  Created by Miguel Dönicke on 08.10.22.
//

import Foundation

public protocol CompleteTodoUseCase {
    func callAsFunction(id: Int) async -> Result<Todo, Error>
}

public class DefaultCompleteTodoUseCase: CompleteTodoUseCase {
    private let repository: TodoRepository

    public init(repository: TodoRepository) {
        self.repository = repository
    }

    public func callAsFunction(id: Int) async -> Result<Todo, Error> {
        await repository.complete(id: id)
    }
}
