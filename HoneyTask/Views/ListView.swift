//
//  HomeView.swift
//  HoneyTask
//
//  Created by Gökberk Ali Kulaç on 11.03.2023.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            //Top
            VStack(alignment: .leading,spacing: 10){
                Text("Welcome To Honey Task")
                    .font(.callout)
                Text("Manage Your Life")
                    .font(.title2)
                    .bold()
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.vertical)
            
            //List Arranger Components
            ListArrangerSection()
                .padding(.top,5)
            
            
            //Task View List Will Come Here Later
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(TaskViewModel())
    }
}
