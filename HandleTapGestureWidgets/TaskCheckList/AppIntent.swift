//
//  AppIntent.swift
//  TaskCheckList
//
//  Created by MAC on 17/10/2023.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "ConfigurationAppIntent Task Stage"
    static var description = IntentDescription("This is an example widget.")
        
    // An example configurable parameter.
    @Parameter(title: "Favorite Emoji", default: "😃")
    var favoriteEmoji: String
}


struct ToggleStateIntent: AppIntent {
    
    init() {
        
    }
    
    static var title: LocalizedStringResource = "Toggle Task Stage"
    
    @Parameter(title: "Task ID")
    var id: String
    
    init(id: String) {
        self.id = id
    }
    
    func perform() async throws -> some IntentResult & ReturnsValue {
        if let index = TaskDataModel.shared.task.firstIndex(where: { task in
            return task.id == self.id
        }) {
            TaskDataModel.shared.task[index].completed = true
        }
        
        
        
        return .result()
    }
}
