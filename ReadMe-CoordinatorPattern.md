# An Introduction to Coordinator pattern in SwiftUI

Ta biết rằng rằng`SwiftUI` là là `declarative framework`, vì vậy nó có các `State`, vì vậy sẽ có vài giới hạn trong framework khi ta cần transition từ screen 1 tới 2,3,... Trong `NavigationView` của `SwiftUI`, chúng ta thiếu mất các hàm thực thi như `poping to root, popping one step back,...` 
- Ta lấy ví dụ khi muốn navigate giữa 2 screen, lúc này Screen2 phải caamf `Navigation State` của screen 1 như sau:

```swift
struct MapView: View {
    
    @State var showCity: Bool = false
    
    var body: some View {
        NavigationView {
            NavigationLink("Go to the city", isActive: $showCity) {
                CityView(isActive: $showCity)
            }
        }
    }
}

struct CityView: View {
    
    @Binding var isActive: Bool
    
    var body: some View {
        VStack {
            Text("Istanbul")
            Button("Back") {
                isActive = false
            }
        }.navigationBarHidden(true)
    }
}
```

- Ta có `@State var showCity` được gọi là `Navigation State`. Ở đây có 1 vấn đề, sẽ thế nào khi chúng ta có 10 screens với từng đó các `State`, và làm thế nào `pop to root`. Vì vậy để giải quyết vấn đề này, ở `IOS 16.0` thì `NavigationView` đã bị khai tử, và Apple giới thiệu `NavigationStack`.

- So sánh `NavigationStack` và `UINavigationController` thì `NavigationStack` chỉ hỗ trợ `IOS 16+`, trong khi `UINavigationController` hỗ trợ `IOS 2+`. Vì vậy ta cần sử dụng `UINavigationController`

# I. Implementation for Coordinators in SwiftUI

`The Coordinator - Navigation System` phải là các `State` mà được thay đổi mởi 1 function. `State Manager` có thể là 1 function để trigger 1 `one-shot value`. `One-shot` là 1 giá trị hoặc 1 tín hiệu mà xảy ra duy nhất 1 lần trong 1 thời điểm và tạo ra các hiệu ứng phụ. Ta lấy ví dụ như toán tử `=` là 1 `one-shot value/signal`. Nó sẽ tính toán sau đó tạo giá trị mới. Ta cũng có thể các function như `present/push` trong UIKit là `one-shot`, function take a single Object và tạo ra hiệu ứng phụ là vòng đời của ứng dụng.

- Trong `coordinator pattern`, `one-shot values` được gọi là `Routes`, và chúng ta lưu chúng trong `enum`. `Coordinator function` sẽ sử dụng `Routes`, và mỗi `Route` sẽ có định tuyến theo yêu câu.
- Trong 1 ứng dụng đơn giản, một `Route` nên có ít nhất một `Transition Style` và `DestinationView`, để chúng ta có thể nhận ra giá trị của `Route` cũng như 


# V. Reference

1. [An Introduction to Coordinator pattern in SwiftUI](https://betterprogramming.pub/an-introduction-to-coordinator-pattern-in-swiftui-38e5b02f031f)