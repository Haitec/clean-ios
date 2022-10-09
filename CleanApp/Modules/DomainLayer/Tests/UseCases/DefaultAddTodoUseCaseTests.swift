//
//  DefaultAddTodoUseCaseTests.swift
//  DomainLayerTests
//
//  Created by Miguel Dönicke on 09.10.22.
//

import DomainLayer
import XCTest

final class DefaultAddTodoUseCaseTests: XCTestCase {
    func testExecute() async throws {
        // Arrange
        let expected = Todo.mock()
        let repository = MockTodoRepository(addResult: .success(expected))
        let sut = DefaultAddTodoUseCase(repository: repository)

        // Act
        let result = try await sut.execute(todo: expected).get()

        // Assert
        XCTAssertEqual(result, expected)
    }
}
