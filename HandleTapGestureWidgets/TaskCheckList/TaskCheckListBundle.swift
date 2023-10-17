//
//  TaskCheckListBundle.swift
//  TaskCheckList
//
//  Created by MAC on 17/10/2023.
//

import WidgetKit
import SwiftUI

@main
struct TaskCheckListBundle: WidgetBundle {
    var body: some Widget {
        TaskCheckList()
        TaskCheckListLiveActivity()
    }
}
