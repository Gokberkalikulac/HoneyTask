//
//  TaskViewModel.swift
//  HoneyTask
//
//  Created by Gökberk Ali Kulaç on 11.03.2023.
//

import Foundation
import CoreData

class TaskViewModel: ObservableObject {
    @Published var currentSection :String = "Today"
    
    //Form Properties
    @Published var taskTitle : String = ""
    @Published var taskColor : String = "Yellow"
    @Published var taskDeadline : Date = Date()
    @Published var taskType : String = "Casual"
    @Published var taskDescription : String = ""
    
    func addTask(context:NSManagedObjectContext){
         let task = Task(context: context)
        task.title = taskTitle
        task.color = taskColor
        task.deadline = taskDeadline
        task.type = taskType
        task.taskDescription = taskDescription
        
        do {
            try context.save()
        } catch {
             
        }
    }
}
