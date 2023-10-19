//
//  WallpaperWidget.swift
//  WallpaperWidget
//
//  Created by MAC on 19/10/2023.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SourceImageEntry {
        SourceImageEntry(sourceImage: ImageSource(id: "luffy", imageUrl: (FileService.shared.relativePath?.appendingPathComponent("placeHodel.jpeg"))! ), size: context.displaySize)
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SourceImageEntry {
        SourceImageEntry(sourceImage: configuration.imageSrc, size: context.displaySize)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SourceImageEntry> {

        let entry = SourceImageEntry(sourceImage: configuration.imageSrc, size: context.displaySize)
        
        return Timeline(entries: [entry], policy: .never)
    }
}

struct SourceImageEntry: TimelineEntry {
    let date: Date = .now
    let sourceImage: ImageSource
    let size: CGSize
}

struct WallpaperWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Button(intent: ChangeImageIntent()) {
                AsyncImage(url: entry.sourceImage.imageUrl,
                                   content: { image in
                                       image.resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(maxWidth: entry.size.width, maxHeight: entry.size.height)
                                   },
                                   placeholder: {
                                      
                                   }
                               )
            }
        }
    }
}

struct WallpaperWidget: Widget {
    let kind: String = "WallpaperWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            WallpaperWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
    }
}

