//
//  TodoListViewModel+Preview.swift
//  PresentationLayer
//
//  Created by Miguel Dönicke on 09.10.22.
//

import Foundation

extension TodoListViewModel {
    static var preview: TodoListViewModel {
        .init(
            getAllTodosUseCase: PreviewGetAllTodosUseCase(),
            addTodoUseCase: PreviewAddTodoUseCase(),
            completeTodoUseCase: PreviewCompleteTodoUseCase()
        )
    }
}
