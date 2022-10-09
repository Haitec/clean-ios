//
//  CleanApp.swift
//  iOS
//
//  Created by Miguel Dönicke on 22.10.21.
//

import PresentationLayer
import SwiftUI

@main
struct CleanApp: App {
    let diContainer = DIContainer()

    var body: some Scene {
        WindowGroup {
            TodoListView(viewModel: diContainer.makeTodoListViewModel())
        }
    }
}
