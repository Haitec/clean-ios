//
//  TodoListViewModelTests.swift
//  PresentationLayerTests
//
//  Created by Miguel Dönicke on 09.10.22.
//

import DomainLayer
import PresentationLayer
import XCTest

final class TodoListViewModelTests: XCTestCase {
    func testOnAppear() async throws {
        // Arrange
        let expected = [
            Todo.mock(completed: false),
            Todo.mock(completed: true),
            Todo.mock(completed: false)
        ]
        let getAllTodosUseCase = MockGetAllTodosUseCase(result: .success(expected))
        let addTodoUseCase = MockAddTodoUseCase(result: .success(expected.last!))
        let completeTodoUseCase = MockCompleteTodoUseCase(result: .success(expected.last!))

        let sut = TodoListViewModel(
            getAllTodosUseCase: getAllTodosUseCase,
            addTodoUseCase: addTodoUseCase,
            completeTodoUseCase: completeTodoUseCase
        )

        // Act
        await sut.loadTodos()

        // Assert
        XCTAssert(getAllTodosUseCase.executeCalled)
        XCTAssertEqual(sut.todos, expected)
    }

    func testAddTodo() async throws {
        // Arrange
        let expected = Todo.mock(completed: false)
        let getAllTodosUseCase = MockGetAllTodosUseCase(result: .success([]))
        let addTodoUseCase = MockAddTodoUseCase(result: .success(expected))
        let completeTodoUseCase = MockCompleteTodoUseCase(result: .success(expected))

        let sut = TodoListViewModel(
            getAllTodosUseCase: getAllTodosUseCase,
            addTodoUseCase: addTodoUseCase,
            completeTodoUseCase: completeTodoUseCase
        )
        sut.newTodoText = expected.title

        // Act
        await sut.addTodo()

        // Assert
        XCTAssert(addTodoUseCase.executeCalled)
        XCTAssertEqual(sut.todos, [expected])
        XCTAssertEqual(sut.newTodoText, "")
    }

    func testCompleteTodo() async throws {
        // Arrange
        let expected = Todo.mock(completed: true)
        let getAllTodosUseCase = MockGetAllTodosUseCase(result: .success([Todo(id: expected.id, title: expected.title)]))
        let addTodoUseCase = MockAddTodoUseCase(result: .success(expected))
        let completeTodoUseCase = MockCompleteTodoUseCase(result: .success(expected))

        let sut = TodoListViewModel(
            getAllTodosUseCase: getAllTodosUseCase,
            addTodoUseCase: addTodoUseCase,
            completeTodoUseCase: completeTodoUseCase
        )

        // Act
        await sut.loadTodos()
        await sut.completeTodo(id: expected.id!)

        // Assert
        XCTAssertEqual(completeTodoUseCase.executeCalledId, expected.id)
        XCTAssertEqual(sut.todos, [expected])
    }
}
