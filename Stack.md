# Stack

![](images/stack_overview.png)

Việc sử dụng `stacks` trong SwiftUI cho phép ta sắp xếp multipke views vào bên trong trong 1 view. Có 3 loaị stack ta thường sử dụng:

- `VStack - Vertical Stack`: Cho phép ta hiển thị các views từ top tới bottom.
- `HStack - Horizontal stack`: Cho phép ta hiển thị views từ trái sang phải
- `ZStack - Depth-based stack`: Cho phép ta hiển thị views từ back-to-front

![](images/stack.png)

# I. VStack

Như đã nói `VStack` sắp xếp các views từ top tới bottom của 1 list. Có 2 thuộc tính ta thường sử dụng đó là `Alignment` và `Spacing`.

`Aligment`:
- `.leading` — align views to the left (LTR)
- `.center` — align them in the middle (default)
- `.trailing` — align views to the right (LTR)

```swift
struct VStackView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Vietdz jkashdljkfh. hlsdhfjashdlh h skh. jhfkj láhd. jksdh fkjsdhfk. hsdkjfhsdklj h hkjsldfhsakjd hksl hk hskdj fhksalh jkshd h kjh kjfdshjf hsjdh jksdhf jlkshd fl h kjsdhk j hskjh fkjsdh kj hkjsh fjkh kjsh kjsh kjshd fjkhsđfh álkhj khskj hfskjdhf kjsahflkj áhdkj hsjk fhkasjhf kjashf kjshdjk hsdkj hskj hj hsdkjh kkfjhsdh jk hjk hsjkdhf kjh kjh jkshd jksh")
            Image("naruto")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 200)
                .border(.red, width: 8)
            Text("Hello world!, dsjakljdslkjdaslkjdkal dlkasjd lkjdlkasjl j jlkadjl kjlk. jdaslkj lkasjd lkasj lk jlk j lkjd lk j. jkldjaslkjs hâhhahaahahaah 121 231. 213. 13. 1. 21. 21. 1111111 flksjdfsdkjfl. jfdslkj. jkldfj jfjf kdjflk jslkdj. jfsdlkjf lksj lkjs")
        }
//        .frame(width: 400, height: 400)
        .background(.purple)
    }
}
```

Output:

![](images/vstack_not_set_frame.png)

Trong ví dụ trên, ta chưa xét `frame` cho `VStack`, nên frame của `VStack` sẽ cứ giãn cho đến khi chứa hết text vì frame của nó được khởi tạo với `width và height là infinity`. Tuy nhiên trong trường hợp ta xét frame cho `VStack`, thì các `subView` bên trong `VStack` sẽ phải tự điều chỉnh sao cho phù hợp.

```swift
struct VStackView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 35) {
            Text("Vietdz jkashdljkfh. hlsdhfjashdlh h skh. jhfkj láhd. jksdh fkjsdhfk. hsdkjfhsdklj h hkjsldfhsakjd hksl hk hskdj fhksalh jkshd h kjh kjfdshjf hsjdh jksdhf jlkshd fl h kjsdhk j hskjh fkjsdh kj hkjsh fjkh kjsh kjsh kjshd fjkhsđfh álkhj khskj hfskjdhf kjsahflkj áhdkj hsjk fhkasjhf kjashf kjshdjk hsdkj hskj hj hsdkjh kkfjhsdh jk hjk hsjkdhf kjh kjh jkshd jksh end1")
                .fixedSize(horizontal: false, vertical: true)
            //                .lineLimit(10)
            Image("naruto")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 200)
                .border(.red, width: 8)
            Text("Hello world!, dsjakljdslkjdaslkjdkal dlkasjd lkjdlkasjl j jlkadjl kjlk. jdaslkj lkasjd lkasj lk jlk j lkjd lk j. jkldjaslkjs hâhhahaahahaah 121 231. 213. 13. 1. 21. 21. 1111111 flksjdfsdkjfl. jfdslkj. jkldfj jfjf kdjflk jslkdj. jfsdlkjf lksj lkjs end2")                .fixedSize(horizontal: false, vertical: true)
            
        }
        .frame(width: 400, height: 400)
        .background(.purple)
    }
}
```

Output:

![](images/stack_tràn.png)

Ta thấy ở ví dụ trên, ta đã xét lần lượt `fixedSize` cho 2 `text` và xét cụ thể frame cho `Image`, vì vậy content bên trong sẽ bị tràn đều về 2 đầu.

Giả sử ta ko xét frame cho `Image` là `.frame(width: 300, height: 200)` thì sẽ thu được output sau đây:

![](images/vstack_not_set_frame_image.png)

Ta thấy `VStack` sẽ cố để content chỉ ở bên trong bằng cách thay đổi size bên trong. Chú ý rằng đây cũng là tính chất chung của `stack`.

# II. HStack

Như đã nói `HStack` sắp xếp các views từ left tới right của 1 list. Có 2 thuộc tính ta thường sử dụng đó là `Alignment` và `Spacing`.

```swift
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
```

Output:

![](images/hstack_not_set_frame.png)

# III. ZStack

`Allows overlapping its child views on top of each other. i.e. shows views in a back-to-front list.`

```swift
struct ZStackView: View {
    var body: some View {
        ZStack {
            Image("naruto")
            Text("Vietdz 123")
        }
    }
}
```

![](images/zstack.png)

VD2:

![](images/hstack_baseline.png)

# III. Reference

1. [Stack](https://blog.devgenius.io/stacks-in-swiftui-de8951c3011b)