//
//  Todo+Mock.swift
//  PresentationLayerTests
//
//  Created by Miguel Dönicke on 09.10.22.
//

import DomainLayer
import Foundation

private var todos = [Todo]()

extension Todo {
    static func mock(completed: Bool = false) -> Todo {
        let id = todos.count + 1
        return .init(id: id, title: "Mock #\(id)", completed: completed)
    }
}
