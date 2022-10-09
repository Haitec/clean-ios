//
//  MockCompleteTodoUseCase.swift
//  PresentationLayerTests
//
//  Created by Miguel Dönicke on 09.10.22.
//

import DomainLayer
import Foundation

final class MockCompleteTodoUseCase: CompleteTodoUseCase {
    private(set) var executeCalledId: Int?
    var result: Result<Todo, Error>

    init(result: Result<Todo, Error>) {
        self.result = result
    }

    func execute(id: Int) async -> Result<Todo, Error> {
        executeCalledId = id
        return result
    }
}
