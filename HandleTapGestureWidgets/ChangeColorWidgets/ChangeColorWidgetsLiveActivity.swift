//
//  ChangeColorWidgetsLiveActivity.swift
//  ChangeColorWidgets
//
//  Created by MAC on 17/10/2023.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct ChangeColorWidgetsAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct ChangeColorWidgetsLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: ChangeColorWidgetsAttributes.self) { context in
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

extension ChangeColorWidgetsAttributes {
    fileprivate static var preview: ChangeColorWidgetsAttributes {
        ChangeColorWidgetsAttributes(name: "World")
    }
}

extension ChangeColorWidgetsAttributes.ContentState {
    fileprivate static var smiley: ChangeColorWidgetsAttributes.ContentState {
        ChangeColorWidgetsAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: ChangeColorWidgetsAttributes.ContentState {
         ChangeColorWidgetsAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: ChangeColorWidgetsAttributes.preview) {
   ChangeColorWidgetsLiveActivity()
} contentStates: {
    ChangeColorWidgetsAttributes.ContentState.smiley
    ChangeColorWidgetsAttributes.ContentState.starEyes
}
