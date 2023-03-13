//
//  ContentView.swift
//  HoneyTask
//
//  Created by Gökberk Ali Kulaç on 11.03.2023.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        ListView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TaskViewModel())
    }
}
