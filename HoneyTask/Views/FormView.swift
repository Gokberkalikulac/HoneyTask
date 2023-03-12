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
    @State private var taskDetailString : String = ""
    
    let colors = ["Yellow","Red","Blue","Purple","Orange","Green"]
    let taskTypes = ["Casual","İmportant","Critical"]
    @Namespace var animation
    
    var body: some View {
        VStack(alignment: .leading){
            header
                .padding()
            taskColorSegment
                .padding()
            taskTitle
                .padding()
            taskDeadline
                .padding()
            taskType
                .padding()
            taskDetail
                .padding()
            Spacer()
        }
    }
}

extension FormView {
    var header : some View {
        VStack(spacing:20){
            Text("Assign Task")
                .font(.title2)
                .foregroundColor(Color.type.important)
                .bold()
                .frame(maxWidth: .infinity)
            
            Text("Customize your individual color etc...")
                .bold()
                .foregroundColor(Color.type.important)
                .font(.footnote)
                .frame(maxWidth: .infinity,alignment: .leading)
        }
    }
    
    var taskColorSegment : some View{
        VStack(alignment:.leading){
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
        }
        .frame(maxWidth: .infinity,alignment: .leading)
    }
    
    var taskTitle : some View {
        VStack(alignment:.leading,spacing: 10){
            Text("Task Title")
                .font(.footnote)
                .foregroundColor(Color.theme.accent)
            
            TextField("Title:", text: $taskViewModel.taskTitle)
                .foregroundColor(Color.theme.accent)
                .frame(maxWidth: .infinity)
                .padding(.top,10)
                .textFieldStyle(.roundedBorder)
        }
    }
    
    var taskDeadline : some View{
        VStack(alignment:.leading,spacing: 10){
            Text("Task Deadline ")
                .font(.footnote)
                .foregroundColor(Color.theme.accent)
            
            Text(taskViewModel.taskDeadline.formatted(date:.abbreviated, time: .omitted) + " -- " + taskViewModel.taskDeadline.formatted(date: .omitted, time: .shortened))
                .foregroundColor(Color.theme.secondaryText)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.top,10)
                .textFieldStyle(.roundedBorder)
                .overlay(alignment: .bottomTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "calendar")
                            .foregroundColor(Color.theme.accent)
                    }
                    
                }
        }
    }
    
    var taskType : some View {
        VStack(alignment:.leading,spacing: 10){
            Text("Task Type")
                .font(.footnote)
                .foregroundColor(Color.theme.accent)
            
            HStack(spacing: 20){
                ForEach(taskTypes,id: \.self) { type in
                    Text(type)
                        .foregroundColor(type == "Casual" ? Color.type.casual :  type == "İmportant" ? Color.type.important : Color.type.critical)
                        .padding(.vertical,10)
                        .frame(maxWidth: .infinity)
                        .background {
                            if taskViewModel.taskType == type {
                                Capsule()
                                    .fill(.black)
                                    .matchedGeometryEffect(id: "Type", in:animation)
                            }else{
                                Capsule()
                                    .strokeBorder(.black)
                            }
                        }
                        .contentShape(Capsule())
                        .onTapGesture {
                            withAnimation{taskViewModel.taskType = type}
                        }
                }
            }
            
        }
    }
    
    var taskDetail : some View {
        VStack(alignment:.leading,spacing: 10){
            Text("Task Detail")
                .font(.footnote)
                .foregroundColor(Color.theme.accent)
            
            TextEditor(text: $taskDetailString)
                .foregroundColor(Color.theme.green)
                .padding(.horizontal)
                .navigationTitle("About you")
        }
    }
}


struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
            .environmentObject(TaskViewModel()  )
    }
}
