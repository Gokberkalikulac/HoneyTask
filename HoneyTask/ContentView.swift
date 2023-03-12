//
//  ContentView.swift
//  HoneyTask
//
//  Created by Gökberk Ali Kulaç on 11.03.2023.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        NavigationStack{
            TabView{
                ListView()
                    .navigationTitle("Honey Task")
                    .navigationBarTitleDisplayMode(.inline)
                    .tabItem {
                        Label("List", systemImage: "list.dash")
                            
                    }
                FormView()
                    .tabItem {
                        Label("Form", systemImage: "square.and.pencil")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TaskViewModel())
    }
}
