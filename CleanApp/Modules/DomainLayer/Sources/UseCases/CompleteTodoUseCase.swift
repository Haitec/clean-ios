//
//  CompleteTodoUseCase.swift
//  DomainLayer
//
//  Created by Miguel Dönicke on 08.10.22.
//

import Foundation

public class CompleteTodoUseCase {
    private let repository: TodoRepository

    public init(repository: TodoRepository) {
        self.repository = repository
    }

    public func execute(id: Int) async -> Result<Todo, Error> {
        await repository.complete(id: id)
    }
}
