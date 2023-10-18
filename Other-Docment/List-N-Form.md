# List and Form

# I. List

```swift
struct ListView: View {
    var nameSections = ["Section A", "Section B", "Section C"]
    var nameItems = ["Vietdz", "Long Ot", "Duc Anh"]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(nameSections, id: \.self) { section in
                    Section(section) {
                        ForEach(nameItems, id: \.self) { name in
                           Text(name)
                       }
                   }
               }
           }.navigationTitle("Menu")
        }

    }
}
```

Output:

![](images/list.png)

Từ `List`, ta chia thành các `section`, trong mỗi `section` ta có các `Text`, nên kết quả thu được như trên.

# II. Form

`Form is one of a container view in SwiftUI that is designed for grouping controls used for modifying data entry.` `Form` hoạt động tương tự như `List` như nhóm các `Section` như List.

- Ở đây ta còn biết thêm `Toggle, LabeledContent và Picker`:

```swift
enum AutoJoinHotspotOption: String, CaseIterable, Identifiable {
    var id: Self {
        return self
    }
    
    case never
    case askToJoin
    case automatic
}

struct SettingView: View {
    @State private var nameDevice: String = ""
    @State private var isWifiEnabled: Bool = false
    @State private var joinType: AutoJoinHotspotOption = .askToJoin
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name Device", text: $nameDevice)
                    LabeledContent("IOS Version", value: "16.5")
                        .padding([.top, .trailing, .leading], 20)
                        .padding([.bottom], 30)
                    
                } header: {
                    Text("About").foregroundColor(.blue)
                }
                .background(.orange)
                
                Section {
                    Toggle("Wifi", isOn: $isWifiEnabled)
                    Picker("Auto say siuuu", selection: $joinType) {
                        ForEach(AutoJoinHotspotOption.allCases) { state in
                            Text(state.rawValue).foregroundColor(.red).background(.blue)
                        }
                    }.padding().background(.blue)
                } header: {
                    Text("Internet").foregroundColor(.red).background(.clear)
                }
                .padding([.leading], -12)
                .background(.red)
                

            }.navigationBarTitle("isWifiOn")
            
        }
    }
}
```

Output:

![](images/form.png)

# III. Reference

1. [How to use SwiftUI Form](https://sarunw.com/posts/swiftui-form/)