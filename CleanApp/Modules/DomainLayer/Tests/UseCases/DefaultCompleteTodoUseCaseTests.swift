//
//  DefaultCompleteTodoUseCaseTests.swift
//  DomainLayerTests
//
//  Created by Miguel Dönicke on 08.10.22.
//

import DomainLayer
import XCTest

final class DefaultCompleteTodoUseCaseTests: XCTestCase {
    func testExecute() async throws {
        // Arrange
        let expected = Todo.mock()
        let repository = MockTodoRepository(completeResult: .success(expected))
        let sut = DefaultCompleteTodoUseCase(repository: repository)

        // Act
        let result = try await sut(id: expected.id!).get()

        // Assert
        XCTAssertEqual(result, expected)
    }
}
