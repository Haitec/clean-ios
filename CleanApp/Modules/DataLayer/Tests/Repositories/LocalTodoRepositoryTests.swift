//
//  LocalTodoRepositoryTests.swift
//  DataLayerTests
//
//  Created by Miguel Dönicke on 08.10.22.
//

import DataLayer
import DomainLayer
import XCTest

final class LocalTodoRepositoryTests: XCTestCase {
    func testTodos() async throws {
        // Arrange
        let expected = Todo(id: 1, title: "Mock")
        let sut = LocalTodoRepository()
        sut.add(todo: expected)

        // Act
        let result = try await sut.todos().get()

        // Assert
        XCTAssertEqual(result, [expected])
    }

    func testCompleteSuccess() async throws {
        // Arrange
        let expected = Todo(id: 1, title: "Mock", completed: true)
        let sut = LocalTodoRepository()
        sut.add(todo: expected)

        // Act
        let result = try await sut.complete(id: 1).get()

        // Assert
        XCTAssertEqual(result, expected)
    }

    func testCompleteFailure() async throws {
        // Arrange
        let sut = LocalTodoRepository()

        // Act & Assert
        do {
            _ = try await sut.complete(id: 1).get()
        } catch LocalTodoRepository.Error.notFound {
            return
        } catch {
            XCTFail()
        }
    }
}
