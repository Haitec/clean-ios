//
//  GetAllTodosUseCaseTests.swift
//  DomainLayerTests
//
//  Created by Miguel Dönicke on 08.10.22.
//

import DomainLayer
import XCTest

final class GetAllTodosUseCaseTests: XCTestCase {
    func testExecute() async throws {
        // Arrange
        let expected = [Todo.mock()]
        let repository = MockTodoRepository(todosResult: .success(expected))
        let sut = GetAllTodosUseCase(repository: repository)

        // Act
        let result = try await sut.execute().get()

        // Assert
        XCTAssertEqual(result, expected)
    }
}
