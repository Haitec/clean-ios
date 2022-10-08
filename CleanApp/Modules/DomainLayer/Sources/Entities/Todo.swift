//
//  Todo.swift
//  DomainLayer
//
//  Created by Miguel Dönicke on 08.10.22.
//

import Foundation

public struct Todo: Equatable {
    public var id: Int?
    public var title: String
    public var completed: Bool

    public init(id: Int? = nil, title: String, completed: Bool = false) {
        self.id = id
        self.title = title
        self.completed = completed
    }
}
