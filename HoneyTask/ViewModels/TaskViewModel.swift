//
//  TaskViewModel.swift
//  HoneyTask
//
//  Created by Gökberk Ali Kulaç on 11.03.2023.
//

import Foundation

class TaskViewModel: ObservableObject {
    @Published var currentSection :String = "Today"
    
    //Form Properties
    @Published var taskTitle : String = ""
    @Published var taskColor : String = "Yellow"
    @Published var taskDeadline : Date = Date()
    @Published var taskType : String = "Basic"
}
