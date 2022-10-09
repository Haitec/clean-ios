//
//  TodoListViewModel+Mock.swift
//  PresentationLayerTests
//
//  Created by Miguel Dönicke on 09.10.22.
//

import DomainLayer
import Foundation
import PresentationLayer

extension TodoListViewModel {
    static var mock: TodoListViewModel {
        .init(
            getAllTodosUseCase: MockGetAllTodosUseCase(result: .success([Todo.mock()])),
            addTodoUseCase: MockAddTodoUseCase(result: .success(Todo.mock())),
            completeTodoUseCase: MockCompleteTodoUseCase(result: .success(Todo.mock()))
        )
    }
}
