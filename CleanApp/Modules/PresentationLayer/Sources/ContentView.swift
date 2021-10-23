//
//  ContentView.swift
//  
//
//  Created by Miguel Dönicke on 22.10.21.
//

import DomainLayer
import SwiftUI

public struct ContentView: View {
    public var body: some View {
        Text(Domain().text)
            .padding()
    }

    public init() {}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
