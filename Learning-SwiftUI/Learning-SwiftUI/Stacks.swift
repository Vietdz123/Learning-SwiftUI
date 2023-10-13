//
//  Stacks.swift
//  Learning-SwiftUI
//
//  Created by Tiến Việt Trịnh on 13/10/2023.
//

import SwiftUI

struct VStackView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 35) {
            Text("Vietdz jkashdljkfh. hlsdhfjashdlh h skh. jhfkj láhd. jksdh fkjsdhfk. hsdkjfhsdklj h hkjsldfhsakjd hksl hk hskdj fhksalh jkshd h kjh kjfdshjf hsjdh jksdhf jlkshd fl h kjsdhk j hskjh fkjsdh kj hkjsh fjkh kjsh kjsh kjshd fjkhsđfh álkhj khskj hfskjdhf kjsahflkj áhdkj hsjk fhkasjhf kjashf kjshdjk hsdkj hskj hj hsdkjh kkfjhsdh jk hjk hsjkdhf kjh kjh jkshd jksh end1")
                .fixedSize(horizontal: false, vertical: true)
            //                .lineLimit(10)
            Image("naruto")
                .resizable()
                .scaledToFit()
//                .frame(width: 300, height: 200)
                .border(.red, width: 8)
            Text("Hello world!, dsjakljdslkjdaslkjdkal dlkasjd lkjdlkasjl j jlkadjl kjlk. jdaslkj lkasjd lkasj lk jlk j lkjd lk j. jkldjaslkjs hâhhahaahahaah 121 231. 213. 13. 1. 21. 21. 1111111 flksjdfsdkjfl. jfdslkj. jkldfj jfjf kdjflk jslkdj. jfsdlkjf lksj lkjs end2")                .fixedSize(horizontal: false, vertical: true)
            
        }
        .frame(width: 250, height: 250)
        .background(.purple)
        
    }
}

struct HStackView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 35) {
            Text("Vietdz jkashdljkfh. hlsdhfjashdlh h skh. jhfkj láhd. jksdh fkjsdhfk. hsdkjfhsdklj h hkjsldfhsakjd hksl hk hskdj fhksalh jkshd h kjh kjfdshjf hsjdh jksdhf jlkshd fl h kjsdhk j hskjh fkjsdh kj hkjsh fjkh kjsh kjsh kjshd fjkhsđfh álkhj khskj hfskjdhf kjsahflkj áhdkj hsjk fhkasjhf kjashf kjshdjk hsdkj hskj hj hsdkjh kkfjhsdh jk hjk hsjkdhf kjh kjh jkshd jksh end1")
                .fixedSize(horizontal: false, vertical: true)
            //                .lineLimit(10)
            Image("naruto")
                .resizable()
                .scaledToFit()
                .border(.red, width: 8)
            Text("Hello world!, dsjakljdslkjdaslkjdkal dlkasjd lkjdlkasjl j jlkadjl kjlk. jdaslkj lkasjd lkasj lk jlk j lkjd lk j. jkldjaslkjs hâhhahaahahaah 121 231. 213. 13. 1. 21. 21. 1111111 flksjdfsdkjfl. jfdslkj. jkldfj jfjf kdjflk jslkdj. jfsdlkjf lksj lkjs end2")                .fixedSize(horizontal: false, vertical: true)
            
        }
        .frame(width: 400, height: 400)
        .background(.orange)
    }
}


struct ZStackView: View {
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Rectangle()
                .fill(Color.red)
                .frame(width: 100, height: 50)
            Rectangle()
                .fill(Color.blue)
                .frame(width:50, height: 100)
        }
        .border(Color.green, width: 1)
    }
}
