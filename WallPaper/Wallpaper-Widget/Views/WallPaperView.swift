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
    let btnChecklistModel: ButtonCheckListModel
}

struct WallpaperWidgetEntryView : View {
    
    var entry: SourceImageEntry

    var body: some View {
 
        switch entry.type {
            
        case .digitalFriend:
            BackgroudView(image: entry.image, size: entry.size)
        case .routineMonitor:
            CheckListView(image: entry.image, size: entry.size, btnCLModel: entry.btnChecklistModel)
        case .placeholder:
            PlaceholderView(size: entry.size)
        }

    }
}
