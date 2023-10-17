//
//  ChangeImageLiveActivity.swift
//  ChangeImage
//
//  Created by MAC on 17/10/2023.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct ChangeImageAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct ChangeImageLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: ChangeImageAttributes.self) { context in
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

extension ChangeImageAttributes {
    fileprivate static var preview: ChangeImageAttributes {
        ChangeImageAttributes(name: "World")
    }
}

extension ChangeImageAttributes.ContentState {
    fileprivate static var smiley: ChangeImageAttributes.ContentState {
        ChangeImageAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: ChangeImageAttributes.ContentState {
         ChangeImageAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: ChangeImageAttributes.preview) {
   ChangeImageLiveActivity()
} contentStates: {
    ChangeImageAttributes.ContentState.smiley
    ChangeImageAttributes.ContentState.starEyes
}
