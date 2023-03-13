//
//  FormView.swift
//  HoneyTask
//
//  Created by Gökberk Ali Kulaç on 11.03.2023.
//

import SwiftUI

struct FormView: View {
    @EnvironmentObject var taskViewModel : TaskViewModel
    @State private var taskDetailString : String = ""
    @Environment(\.self) var env
    
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
            HStack{
                Text("Assign Task")
                    .font(.title2)
                    .foregroundColor(Color.theme.red)
                    .bold()
                
                Spacer()
                Button {
                    taskViewModel.addTask(context: env.managedObjectContext )
                } label: {
                    Text("Save")
                        .padding(.horizontal,15)
                        .padding(.vertical,5)
                        .foregroundColor(Color.theme.red)
                        .background{
                            Capsule()
                                .fill(Color.black)
                        }
                }
            }
            
            Text("Customize your individual task in order to better task management. You can start with task title and chose your task deadline and give some importance and details.")
                .bold()
                .foregroundColor(Color.theme.red)
                .font(.footnote)
                .frame(maxWidth: .infinity,alignment: .leading)
        }
    }
    
    var taskColorSegment : some View{
        VStack(alignment:.leading){
            Text("Task Color")
                .font(.footnote)
                .foregroundColor(Color.theme.red)
            
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
                .foregroundColor(Color.theme.red)
            
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
                .foregroundColor(Color.theme.red)
            
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
                .foregroundColor(Color.theme.red)
            
            HStack(spacing: 20){
                ForEach(taskTypes,id: \.self) { type in
                    Text(type)
                        .foregroundColor(type == "Casual" ? Color.type.casual :  type == "İmportant" ? Color.type.important : Color.type.critical)
                        .padding(.vertical,10)
                        .frame(maxWidth: .infinity)
                        .background {
                            if taskViewModel.taskType == type {
                                Capsule()
                                    .fill(Color.theme.accent)
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
        VStack(alignment:.leading){
            Text("Task Detail")
                .font(.footnote)
                .foregroundColor(Color.theme.red)
            
            TextEditor(text: $taskDetailString)
                .foregroundColor(Color.theme.accent)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.theme.red, lineWidth: 1)
                )
        }
    }
    
}


struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
            .environmentObject(TaskViewModel()  )
    }
}
