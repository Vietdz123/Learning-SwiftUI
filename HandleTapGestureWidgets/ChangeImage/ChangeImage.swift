//
//  ChangeImage.swift
//  ChangeImage
//
//  Created by MAC on 17/10/2023.
//

import WidgetKit
import SwiftUI

struct BackgroundEntry: TimelineEntry {
    let date: Date = .now
    let size: CGSize
    let backgroundModel: BackgroundModel
}

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> BackgroundEntry {
        let image = BackgroudDataModel.shared.image
        let entry = BackgroundEntry(size: context.displaySize, backgroundModel: image)
        
        return entry
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> BackgroundEntry {
        let image = BackgroudDataModel.shared.image
        let entry = BackgroundEntry(size: context.displaySize, backgroundModel: image)
        
        return entry
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<BackgroundEntry> {
        
        BackgroudDataModel.shared.images = FileServiceWidget.shared.readAllImages().map { image in
            return BackgroundModel(image: image)
        }
        
        let image = BackgroudDataModel.shared.image
        let entry = BackgroundEntry(size: context.displaySize, backgroundModel: image)

        return Timeline(entries: [entry], policy: .atEnd)
    }
}

struct ChangeImageEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Button(intent: ChangeBackgroundIntent()) {
                Image(uiImage: entry.backgroundModel.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: entry.size.width, height: entry.size.height)
            }
            

        }
    }
}

struct ChangeImage: Widget {
    let kind: String = "ChangeImage"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            ChangeImageEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
    }
}

