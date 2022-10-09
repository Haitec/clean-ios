//
//  DIContainer.swift
//  iOS
//
//  Created by Miguel Dönicke on 09.10.22.
//

import DataLayer
import DomainLayer
import Foundation
import PresentationLayer

final class DIContainer {
    lazy var todoRepository = LocalTodoRepository()
    lazy var getAllTodosUseCase = DefaultGetAllTodosUseCase(repository: todoRepository)
    lazy var addTodoUseCase = DefaultAddTodoUseCase(repository: todoRepository)
    lazy var completeTodoUseCase = DefaultCompleteTodoUseCase(repository: todoRepository)

    func makeTodoListViewModel() -> TodoListViewModel {
        TodoListViewModel(
            getAllTodosUseCase: getAllTodosUseCase,
            addTodoUseCase: addTodoUseCase,
            completeTodoUseCase: completeTodoUseCase
        )
    }
}
