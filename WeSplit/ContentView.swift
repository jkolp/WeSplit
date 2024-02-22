//
//  ContentView.swift
//  WeSplit
//
//  Created by Jasper on 2/22/24.
//

import SwiftUI

struct ContentView: View {
    // body is a computed property syntax
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
