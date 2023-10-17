//
//  TaskModel.swift
//  HandleTapGestureWidgets
//
//  Created by MAC on 17/10/2023.
//

import SwiftUI

struct TaskModel: Identifiable {
    var id = UUID().uuidString
    var taskTitle: String
    var completed = false
}

class TaskDataModel {
    static let shared = TaskDataModel()
    
    var task: [TaskModel] = [
        .init(taskTitle: "Record Video"),
        .init(taskTitle: "Edit Video"),
        .init(taskTitle: "Public Video"),
    ]
}
