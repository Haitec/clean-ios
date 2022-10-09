//
//  TodoListViewTests.swift
//  PresentationLayerTests
//
//  Created by Miguel Dönicke on 09.10.22.
//

import XCTest
import PresentationLayer

final class TodoListViewTests: XCTestCase {
    func testTodoListView() throws {
        _ = TodoListView(viewModel: .mock)
    }
}
