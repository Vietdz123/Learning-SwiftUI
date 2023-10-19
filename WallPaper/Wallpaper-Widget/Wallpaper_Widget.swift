//
//  Wallpaper_Widget.swift
//  Wallpaper-Widget
//
//  Created by MAC on 19/10/2023.


import WidgetKit
import SwiftUI


struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SourceImageEntry {
        SourceImageEntry(sourceImage: ImageSource(id: "luffy", name: Constant.imagePlacehodel), size: context.displaySize)
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SourceImageEntry {
        SourceImageEntry(sourceImage: configuration.imageSrc, size: context.displaySize)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SourceImageEntry> {
        
        ImageDataModel.shared.images = configuration.imageSrc.images

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
        ZStack {
            Image(uiImage: ImageDataModel.shared.currentImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .frame(maxWidth: entry.size.width, maxHeight: entry.size.height)
                .ignoresSafeArea()
            Button(intent: ConfigurationAppIntent()) {
                Text("")
                    .frame(maxWidth: entry.size.width, maxHeight: entry.size.height)
                    .background(Color.clear)
                    
            }.buttonStyle(.plain)
        }

    }
}

struct WallpaperWidget: Widget {
    let kind: String = "WallpaperWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            WallpaperWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }.contentMarginsDisabled()
    }
}

