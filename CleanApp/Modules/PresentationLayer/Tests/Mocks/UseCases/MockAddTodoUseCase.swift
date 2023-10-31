//
//  MockAddTodoUseCase.swift
//  PresentationLayerTests
//
//  Created by Miguel Dönicke on 09.10.22.
//

import DomainLayer
import Foundation

final class MockAddTodoUseCase: AddTodoUseCase {
    private(set) var executeCalled = false
    var result: Result<Todo, Error>

    init(result: Result<Todo, Error>) {
        self.result = result
    }

    func callAsFunction(todo: Todo) async -> Result<Todo, Error> {
        executeCalled = true
        return result
    }
}
