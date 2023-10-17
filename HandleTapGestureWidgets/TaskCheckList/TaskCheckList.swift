//
//  TaskCheckList.swift
//  TaskCheckList
//
//  Created by MAC on 17/10/2023.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> TaskEntry {
        TaskEntry(lastThreeTask: Array(TaskDataModel.shared.task.prefix(3)))
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> TaskEntry {
        TaskEntry(lastThreeTask: Array(TaskDataModel.shared.task.prefix(3)))
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<TaskEntry> {
        
        // Fecth Data
        let latestTask = Array(TaskDataModel.shared.task.prefix(3))

        let entry = TaskEntry(lastThreeTask: latestTask)

        return Timeline(entries: [entry], policy: .atEnd)
    }
}

struct TaskEntry: TimelineEntry {
    let date: Date = .now
    var lastThreeTask: [TaskModel]
}

struct TaskCheckListEntryView : View {
    var entry: TaskEntry

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Task's")
                .fontWeight(.semibold)
                .padding(.bottom, 10)
            
            VStack(alignment: .leading, spacing: 6) {
                if entry.lastThreeTask.isEmpty {
                    Text("No Task's founded")
                        .font(.caption)
                        .foregroundStyle(.gray)
                } else {
                    ForEach(entry.lastThreeTask) { task in
                        HStack(spacing: 6) {
                            Button(intent: ToggleStateIntent(id: task.id)) {
                                Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(.blue)
                            }
        
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(task.taskTitle)
                                    .textScale(.secondary)
                                    .lineLimit(1)
                                    .strikethrough(task.completed, pattern: .solid, color: .primary)
                            }
                            
                            Divider()
                        }
                    }
                }
            }
        }
    }
}

struct TaskCheckList: Widget {
    let kind: String = "TaskCheckList"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            TaskCheckListEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
    }
}


#Preview(as: .systemSmall) {
    TaskCheckList()
} timeline: {
    TaskEntry(lastThreeTask: Array(TaskDataModel.shared.task.prefix(3)))
}
