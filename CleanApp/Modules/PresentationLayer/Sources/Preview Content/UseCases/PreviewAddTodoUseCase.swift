//
//  PreviewAddTodoUseCase.swift
//  PresentationLayer
//
//  Created by Miguel Dönicke on 09.10.22.
//

import DomainLayer
import Foundation

final class PreviewAddTodoUseCase: AddTodoUseCase {
    func callAsFunction(todo: Todo) async -> Result<Todo, Error> {
        fatalError()
    }
}

extension AddTodoUseCase {
    static var preview: PreviewAddTodoUseCase {
        .init()
    }
}
