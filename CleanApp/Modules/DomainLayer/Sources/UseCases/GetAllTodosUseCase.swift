//
//  GetAllTodosUseCase.swift
//  DomainLayer
//
//  Created by Miguel Dönicke on 08.10.22.
//

import Foundation

public protocol GetAllTodosUseCase {
    func callAsFunction() async -> Result<[Todo], Error>
}

public class DefaultGetAllTodosUseCase: GetAllTodosUseCase {
    private let repository: TodoRepository

    public init(repository: TodoRepository) {
        self.repository = repository
    }

    public func callAsFunction() async -> Result<[Todo], Error> {
        await repository.todos()
    }
}
