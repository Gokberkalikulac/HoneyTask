//
//  FormView.swift
//  HoneyTask
//
//  Created by Gökberk Ali Kulaç on 11.03.2023.
//

import SwiftUI

struct FormView: View {
    @EnvironmentObject var taskViewModel : TaskViewModel
    @Environment(\.dismiss) var dismiss
    
    let colors = ["Yellow","Red","Blue","Purple","Orange","Green"]
    var body: some View {
        VStack(spacing: 15) {
            Text("Assign Task")
                .font(.title2)
                .foregroundColor(Color.theme.accent)
                .bold()
                .frame(maxWidth: .infinity)
            
            Text("Customize your individual color etc...")
                .foregroundColor(Color.theme.accent)
                .font(.footnote)
                .frame(maxWidth: .infinity,alignment: .leading)
            
            
            VStack(alignment:.leading,spacing: 10){
                Text("Task Color")
                    .font(.footnote)
                    .foregroundColor(Color.theme.accent)
                
                HStack(spacing:15){
                    ForEach(colors,id: \.self) { color in
                        Circle()
                            .fill(Color(color))
                            .frame(width: 20,height: 20)
                            .background {
                                if taskViewModel.taskColor == color {
                                    Circle()
                                        .strokeBorder(Color.theme.accent)
                                        .padding(-5)
                                    
                                }
                            }
                            .contentShape(Circle())
                            .onTapGesture {
                                taskViewModel.taskColor = color
                            }
                    }
                }
                .padding(.top,10)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.top,20)
            
            Divider()
                .padding(.vertical,15)
            
            
            VStack(alignment:.leading,spacing: 10){
                Text("Task Title ")
                    .font(.footnote)
                    .foregroundColor(Color.theme.accent)
                
                TextField("Title:", text: $taskViewModel.taskTitle)
                    .frame(maxWidth: .infinity)
                    .padding(.top,10)
                    .textFieldStyle(.roundedBorder)
            }
        }
        .frame(maxHeight: .infinity,alignment: .top )
        .padding()
        
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
            .environmentObject(TaskViewModel()  )
    }
}
