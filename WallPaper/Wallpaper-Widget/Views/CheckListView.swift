//
//  CheckListView.swift
//  WallPaper
//
//  Created by MAC on 23/10/2023.
//

import SwiftUI


struct CheckListView: View {
    
    var image: UIImage
    var size: CGSize
    
    var body: some View {
        ZStack {
            
            Image(uiImage: ImageDataViewModel.shared.currentImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .frame(maxWidth: size.width, maxHeight: size.height)
                .ignoresSafeArea()
            
            VStack(content: {
                
                HStack(content: {
                    DayView(model: WeekendDayModel(day: .monday))
                    DayView(model: WeekendDayModel(day: .tuesday))
                    DayView(model: WeekendDayModel(day: .wednesday))
                    DayView(model: WeekendDayModel(day: .thursday))
                })
                
                HStack(content: {
                    DayView(model: WeekendDayModel(day: .friday))
                    DayView(model: WeekendDayModel(day: .saturday))
                    DayView(model: WeekendDayModel(day: .sunday))
                })
                
            })
            
        }
    }
}

struct DayView: View {
    
    var model: WeekendDayModel
    
    var body: some View {
        VStack(content: {
            Button(intent: ToggleButtonIntent(id: model.day.rawValue)) {
               
                Image(systemName:  ImageDataViewModel.shared.dateCheckList[model.day.rawValue].isChecked ?
                      "person.crop.circle.badge.checkmark" : "person.badge.shield.checkmark")
            }
            
            Text(model.day.nameDay)
                .foregroundColor(ImageDataViewModel.shared.dateCheckList[model.day.rawValue].isChecked ?
                    .yellow : .white)
        })
    }
}


