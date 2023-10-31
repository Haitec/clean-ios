//
//  PreviewGetAllTodosUseCase.swift
//  PresentationLayer
//
//  Created by Miguel Dönicke on 09.10.22.
//

import DomainLayer
import Foundation

final class PreviewGetAllTodosUseCase: GetAllTodosUseCase {
    func callAsFunction() async -> Result<[Todo], Error> {
        .success([
            .init(id: 1, title: "Preview #1", completed: false),
            .init(id: 2, title: "Preview #2", completed: true),
            .init(id: 3, title: "Preview #3", completed: false)
        ])
    }
}

extension GetAllTodosUseCase {
    static var preview: GetAllTodosUseCase {
        PreviewGetAllTodosUseCase()
    }
}
