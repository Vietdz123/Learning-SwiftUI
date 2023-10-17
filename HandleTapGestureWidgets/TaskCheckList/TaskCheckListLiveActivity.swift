//
//  TaskCheckListLiveActivity.swift
//  TaskCheckList
//
//  Created by MAC on 17/10/2023.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct TaskCheckListAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct TaskCheckListLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: TaskCheckListAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension TaskCheckListAttributes {
    fileprivate static var preview: TaskCheckListAttributes {
        TaskCheckListAttributes(name: "World")
    }
}

extension TaskCheckListAttributes.ContentState {
    fileprivate static var smiley: TaskCheckListAttributes.ContentState {
        TaskCheckListAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: TaskCheckListAttributes.ContentState {
         TaskCheckListAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: TaskCheckListAttributes.preview) {
   TaskCheckListLiveActivity()
} contentStates: {
    TaskCheckListAttributes.ContentState.smiley
    TaskCheckListAttributes.ContentState.starEyes
}
