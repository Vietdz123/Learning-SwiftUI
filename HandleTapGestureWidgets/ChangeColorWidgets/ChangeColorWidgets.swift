//
//  ChangeColorWidgets.swift
//  ChangeColorWidgets
//
//  Created by MAC on 17/10/2023.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> TapMeWidgetEntry {
        TapMeWidgetEntry(date: Date(), backgroundColor: .blue, deepLinkCommand: command(for: .blue))
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> TapMeWidgetEntry {
        TapMeWidgetEntry(date: Date(), backgroundColor: .blue, deepLinkCommand: command(for: .blue))
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<TapMeWidgetEntry> {

        let backgroud = configuration.backgroudColor.color
        
        let command = command(for: configuration.backgroudColor)
        
        let entry = TapMeWidgetEntry(
            date: Date(),
            backgroundColor: backgroud,
            deepLinkCommand: command
        )

        return Timeline(entries: [entry], policy: .atEnd)
    }
}

struct TapMeWidgetEntry: TimelineEntry {
    let date: Date
    let backgroundColor: Color
    let deepLinkCommand: String
}

struct ChangeColorWidgetsEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text("Time:")
            Text(entry.date, style: .time)

            Text("Favorite Emoji:")
        }
    }
}

struct ChangeColorWidgets: Widget {
    let kind: String = "ChangeColorWidgets"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            ChangeColorWidgetsEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
    }
}


#Preview(as: .systemSmall) {
    ChangeColorWidgets()
} timeline: {
    TapMeWidgetEntry(date: Date(), backgroundColor: .blue, deepLinkCommand: command(for: .blue))
}

private func command(for bgColor: BgColor) -> String {
    switch bgColor {
    case .blue:
        return "show-blue"
    case .green:
        return "show-green"
    case .red:
        return "show-red"
    case .orange:
        return "show-orange"
    }
}
