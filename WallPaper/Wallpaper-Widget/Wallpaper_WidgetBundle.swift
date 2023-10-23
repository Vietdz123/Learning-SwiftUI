//
//  Wallpaper_WidgetBundle.swift
//  Wallpaper-Widget
//
//  Created by MAC on 19/10/2023.
//

import WidgetKit
import SwiftUI
//import RealmSwift

@main
struct Wallpaper_WidgetBundle: WidgetBundle {
    var body: some Widget {
        WallpaperWidget()
    }
}

struct WallpaperWidget: Widget {
    let kind: String = "WallpaperWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind,
                               intent: ConfigurationAppIntent.self,
                               provider: Provider()) { entry in
            WallpaperWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
                .onAppear {
//                    WidgetCenter.shared.reloadAllTimelines()
                }
        }.contentMarginsDisabled()
        
    }
}
