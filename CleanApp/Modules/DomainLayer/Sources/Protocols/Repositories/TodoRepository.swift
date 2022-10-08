//
//  TodoRepository.swift
//  DomainLayer
//
//  Created by Miguel Dönicke on 08.10.22.
//

import Foundation

public protocol TodoRepository {
    func todos() async -> Result<[Todo], Error>
    func complete(id: Int) async -> Result<Todo, Error>
}
