//
//  WeatherView.swift
//  WallPaper
//
//  Created by MAC on 20/10/2023.
//

import SwiftUI
import WidgetKit

struct WeatherView: View {
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack {
                LinearGradient(colors: [.blue, .white],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .ignoresSafeArea()
                
                VStack(alignment: .center, spacing: 10) {
                    Text("Cupertino, CA")
                        .foregroundColor(.white)
                        .font(.system(size: 32, weight: .medium))
                        .padding(.bottom, 0)
                    
                    Image(systemName: "cloud.sun.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 180, height: 180)
                        .padding(.bottom, 20)
                    
                    Text("76 Độ")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                    
                    HStack {
                        WeatherDayView(dayOfweek: "Mon",
                                       imageName: "cloud.sun.fill",
                                       temperature: 20)
                        
                        Spacer()
                        
                        WeatherDayView(dayOfweek: "Tues",
                                       imageName: "cloud.sun.fill",
                                       temperature: 16)
                        
                        Spacer()
                        
                        WeatherDayView(dayOfweek: "Wed",
                                       imageName: "cloud.sun.fill",
                                       temperature: 18)
                        
                        Spacer()
                        
                        WeatherDayView(dayOfweek: "Fri",
                                       imageName: "cloud.sun.fill",
                                       temperature: 20)
                        
                        Spacer()
                        
                        WeatherDayView(dayOfweek: "Thur",
                                       imageName: "cloud.sun.fill",
                                       temperature: 25)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                    .padding(.bottom, 10)
                    .border(.red)
                    
                    Button(action: {
                        print("DEBUG: siuuu")
                    }, label: {
                        Text("Change Day Time")
                            .font(.title)
                    })
                    .frame(width: geometry.size.width / 2, height: 50)
                    .background(.white)
                    .cornerRadius(16)
                    
                }

                Spacer()
            }
            .onAppear {
                print("DEBUG: siuuu")
                WidgetCenter.shared.reloadAllTimelines()
//                FileService.shared.writeToSource(with: "Anime",
//                                                 with: "luffy",
//                                                 widgetType: .backgroud, familySize: .medium)
//                
//                FileService.shared.writeToSource(with: "Anime",
//                                                 with: "sakura",
//                                                 widgetType: .backgroud, familySize: .medium)
//                
//                FileService.shared.writeToSource(with: "Anime",
//                                                 with: "sasuke",
//                                                 widgetType: .backgroud, familySize: .medium)
//                
//                FileService.shared.writeToSource(with: "Anime",
//                                                 with: "sanji",
//                                                 widgetType: .backgroud, familySize: .medium)
//                
//                FileService.shared.writeToSource(with: "Anime",
//                                                 with: "m1",
//                                                 widgetType: .backgroud, familySize: .small)
//                
//                FileService.shared.writeToSource(with: "Anime",
//                                                 with: "m2",
//                                                 widgetType: .backgroud, familySize: .small)
//                
//                FileService.shared.writeToSource(with: "Anime",
//                                                 with: "m3",
//                                                 widgetType: .backgroud, familySize: .small)
//                
//                FileService.shared.writeToSource(with: "Mèo",
//                                                 with: "1",
//                                                 widgetType: .backgroud, familySize: .medium)
//                
//                FileService.shared.writeToSource(with: "Mèo",
//                                                 with: "2",
//                                                 widgetType: .backgroud, familySize: .medium)
//                
//                FileService.shared.writeToSource(with: "Mèo",
//                                                 with: "3",
//                                                 widgetType: .backgroud, familySize: .medium)
//                
//                FileService.shared.writeToSource(with: "Mèo",
//                                                 with: "4",
//                                                 widgetType: .backgroud, familySize: .medium)
//                
//                FileService.shared.writeToSource(with: "Mèo",
//                                                 with: "5",
//                                                 widgetType: .backgroud, familySize: .medium)
//                
//                FileService.shared.writeToSource(with: "Mèo",
//                                                 with: "6",
//                                                 widgetType: .backgroud, familySize: .medium)
//                
//                FileService.shared.writeToSource(with: "Mèo",
//                                                 with: "7",
//                                                 widgetType: .backgroud, familySize: .medium)
//                
//                FileService.shared.writeToSource(with: "Checklist",
//                                                 with: "anya",
//                                                 widgetType: .checkList, familySize: .medium)
//                
//                FileService.shared.writeToSource(with: "Checklist",
//                                                 with: "m1",
//                                                 widgetType: .checkList, familySize: .small)
                
        
            }
        })
        
    }
}



struct WeatherDayView: View {
    
    var dayOfweek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(alignment: .center, spacing: 50.0) {
            
            Text(dayOfweek)
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.white)
                .lineLimit(1)
                .multilineTextAlignment(.trailing)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
            
            Text("\(temperature) *")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
                .lineLimit(2)
                .multilineTextAlignment(.center)
            
        }
    }
}

#Preview(body: {
    WeatherView()
})
