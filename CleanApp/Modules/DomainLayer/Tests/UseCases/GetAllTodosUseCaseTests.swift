//
//  DefaultGetAllTodosUseCaseTests.swift
//  DomainLayerTests
//
//  Created by Miguel Dönicke on 08.10.22.
//

import DomainLayer
import XCTest

final class DefaultGetAllTodosUseCaseTests: XCTestCase {
    func testExecute() async throws {
        // Arrange
        let expected = [Todo.mock()]
        let repository = MockTodoRepository(todosResult: .success(expected))
        let sut = DefaultGetAllTodosUseCase(repository: repository)

        // Act
        let result = try await sut().get()

        // Assert
        XCTAssertEqual(result, expected)
    }
}
