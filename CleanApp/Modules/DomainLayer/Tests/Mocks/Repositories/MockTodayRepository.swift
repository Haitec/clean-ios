//
//  MockTodoRepository.swift
//  DomainLayerTests
//
//  Created by Miguel Dönicke on 08.10.22.
//

import Foundation
import DomainLayer

struct MockTodoRepository: TodoRepository {
    var todosResult: Result<[Todo], Error>!
    var completeResult: Result<Todo, Error>!

    func todos() async -> Result<[Todo], Error> {
        todosResult
    }

    func complete(id: Int) async -> Result<Todo, Error> {
        completeResult
    }
}
