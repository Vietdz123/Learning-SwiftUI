//
//  WallPaperView.swift
//  WallPaper
//
//  Created by MAC on 23/10/2023.
//

import WidgetKit
import SwiftUI
                
struct SourceImageEntry: TimelineEntry {
    let date: Date = .now
    let image: UIImage
    let size: CGSize
    let type: WDFolderType
    let intent: ConfigurationAppIntent
}

struct WallpaperWidgetEntryView : View {
    
    var entry: SourceImageEntry
    @State var intent = ConfigurationAppIntent()

    var body: some View {
        
        switch entry.type {
        case .backgroud:
            BackgroudView(image: entry.image, size: entry.size, intent: $intent)
        case .checkList:
            CheckListView(image: entry.image, size: entry.size)
        case .placeholder:
            PlaceholderView(size: entry.size)
        }

    }
}