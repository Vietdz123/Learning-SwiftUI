//
//  TestFile.swift
//  Learning-SwiftUI
//
//  Created by Tiến Việt Trịnh on 12/10/2023.
//

import SwiftUI


protocol ItemStoring {
    associatedtype DataType

    var items: [DataType] { get set}
    mutating func add(item: DataType)
}

extension ItemStoring {
    mutating func add(item: DataType) {
        items.append(item)
    }
}

struct NameDatabase: ItemStoring {
    var items = [String]()
}

struct ValueDatabase: ItemStoring {
    var items = [Int]()
}


protocol P {
    associatedtype Value

    var value: Value { get }

    init(value: Value)
}

struct S1 : P {
    init(value: Int) {
        self.value = value
        self.data = "Hello"
    }
    
    var value: Int
    var data: String
}

struct S2: P {
    var value: String
}

func foo<T: P>(value: T.Value) -> T {
    return T(value: value)
}


//func bar(_ x: Int) -> some P {
//    if x > 10 {
//        return S1(value: 12)
//    } else {
//        return S2(value: "Hello")
//    }
//}


