//
//  Todo+Mock.swift
//  DomainLayerTests
//
//  Created by Miguel Dönicke on 08.10.22.
//

import DomainLayer
import Foundation

private var todos = [Todo]()

extension Todo {
    static func mock() -> Todo {
        let id = todos.count + 1
        return .init(id: id, title: "Mock #\(id)")
    }
}
