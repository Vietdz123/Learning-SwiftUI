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
    var btnCLModel: ButtonCheckListModel
    
    var body: some View {
        ZStack {
            
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .frame(maxWidth: size.width, maxHeight: size.height)
                .ignoresSafeArea()
            
            VStack(content: {
                
                HStack(content: {
                    DayView(model: WeekendDayModel(day: .monday), btnCLModel: btnCLModel)
                    DayView(model: WeekendDayModel(day: .tuesday), btnCLModel: btnCLModel)
                    DayView(model: WeekendDayModel(day: .wednesday), btnCLModel: btnCLModel)
                    DayView(model: WeekendDayModel(day: .thursday), btnCLModel: btnCLModel)
                })
                
                HStack(content: {
                    DayView(model: WeekendDayModel(day: .friday), btnCLModel: btnCLModel)
                    DayView(model: WeekendDayModel(day: .saturday), btnCLModel: btnCLModel)
                    DayView(model: WeekendDayModel(day: .sunday), btnCLModel: btnCLModel)
                })
                
            })
            
        }
    }
}

struct DayView: View {
    
    var model: WeekendDayModel
    var btnCLModel: ButtonCheckListModel
    
    var body: some View {
        VStack(content: {
            Button(intent: ToggleButtonIntent(id: model.day.rawValue)) {
                Image(uiImage:  ImageDataViewModel.shared.dateCheckList[model.day.rawValue].isChecked ?
                      btnCLModel.checkImage : btnCLModel.uncheckImage)
                .resizable()
                .frame(width: 60, height: 35)
            }
            
            Text(model.day.nameDay)
                .foregroundColor(ImageDataViewModel.shared.dateCheckList[model.day.rawValue].isChecked ?
                    .yellow : .white)
        })

    }
}


