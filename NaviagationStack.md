# NavigationStack and Form

# I. Navigation Stack

`Navigation in SwiftUI is a powerful tool for creating complex and dynamic user interfaces.`

`Navaigation` ngày trước được sử dụng bởi `NavigationView`, nhưng mà nó được deprecated bởi IOS16 và nó được chia làm 2 container: `NavigationStack` và `NavigationSplitView`.

- `NavigationStack`: được sử dụng khi ta cần set 1 new view stacking trên 1 view trước đó.
- `NavigationSplitView`: được sử dụng khi ta cần tạo 1 column dựa trên navigation. Vì vậy, `screen` sẽ được chia làm các cột, nơi mỗi cột là 1 subview của `NavigationSplitView`.

| NavigationStack | NavigationSplitView |
 :--------: |  :--------: | 
| ![](gif/navi_stack.gif) | ![](gif/navi_split.gif) |


# II. Reference

1. [Mastering NavigationStack in SwiftUI. Navigator Pattern.](https://swiftwithmajid.com/2022/06/15/mastering-navigationstack-in-swiftui-navigator-pattern/)
2. [How to create views in a loop using ForEach](https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-views-in-a-loop-using-foreach)