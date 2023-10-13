# Why modifier order matters

# I. Content

Ta nhớ rằng với `UIKit`, với các `view` trong `UIKit` như `UILabel, UIButton,...` thì chúng nó đều là các `Class` và là `referece type`. Nghĩa là mỗi khi ta thay đổi các `properties` thì nó sẽ tự động apply cho chính `view đó`. Vì vậy thự tự ta thay đổi các `properties` đa phần đều ko quan trọng. `Tuy nhiêu đó lại là vấn đề trong swiftui`.

- `SwiftUI modifier`:

Điều đầu tiên ta cần phải biết là `SwiftUI framework` phụ thuộc hoanf toàn vào `struct`, và đó là 1 kiểu `value types`. Điều đó có nghĩa là sẽ ko có `reference` tới 1 view trong SwiftUI. Vì vậy khi ta update các properties thì nó sẽ tự `reredenred` lại. Ta có thể hiểu là khi muốn thay đổi 1 ngôi nhà, ta phải đập vỡ nó đi rồi xây lại 1 ngôi nhà mới. Hơi ảo ma nhưng đó là `SwiftUI`.

# II. Reference

1. [Why modifier order matters](https://pedroalvarez-29395.medium.com/swiftui-modifiers-order-matter-mainly-if-you-are-dealing-with-dimensional-ones-35ca382d3f53)
