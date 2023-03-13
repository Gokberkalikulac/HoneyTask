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
            topHeader
                .foregroundColor(Color.theme.red)
            
            //List Arranger Components
            ListArrangerSection()
                .padding(.top,5)
            
            //Task View List Will Come Here Later
        }
        .padding()
    }
}

extension ListView {
    var topHeader : some View {
        HStack{
            VStack(alignment: .leading,spacing: 10){
                Text("Welcome To Honey Task")
                    .font(.callout)
                Text("Manage Your Life")
                    .font(.title2)
                    .bold()
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.vertical)
            
            Button {
                
            } label: {
                Label {
                   Text("Add Task")
                        .font(.subheadline)
                } icon: {
                    Image(systemName: "pencil.circle.fill")
                }
            }
            .padding(.vertical,15)
            .padding(.horizontal)
            .background{
                Capsule()
                    .strokeBorder()
            }            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(TaskViewModel())
    }
}
