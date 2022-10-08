//
//  GetAllTodosUseCase.swift
//  DomainLayer
//
//  Created by Miguel Dönicke on 08.10.22.
//

import Foundation

public class GetAllTodosUseCase {
    private let repository: TodoRepository

    public init(repository: TodoRepository) {
        self.repository = repository
    }

    public func execute() async -> Result<[Todo], Error> {
        await repository.todos()
    }
}
