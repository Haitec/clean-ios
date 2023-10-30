//
//  PreviewCompleteTodoUseCase.swift
//  PresentationLayer
//
//  Created by Miguel Dönicke on 09.10.22.
//

import DomainLayer
import Foundation

final class PreviewCompleteTodoUseCase: CompleteTodoUseCase {
    func callAsFunction(id: Int) async -> Result<Todo, Error> {
        fatalError()
    }
}

extension CompleteTodoUseCase {
    static var preview: PreviewCompleteTodoUseCase {
        .init()
    }
}
