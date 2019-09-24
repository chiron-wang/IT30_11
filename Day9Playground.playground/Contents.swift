import UIKit

/*
 Day9 Swift Closure
 */

//## 無參數與無回傳的Closure
// 定義一個的方法
func sayHi() {
    print("Hi")
}
sayHi()

// closure的寫法
let sayHi2 = {
    () -> () in
    print("Hi")
}
sayHi

let sayHi3 = { print("Hi") }

//* 這邊可以看出此方法中無參數也無回傳
//* 而in關鍵字，精簡的寫法中，也可省略掉，如sayHi3

//## 有參數與回傳值的Closure

// 定義一個帶參數有回傳值的方法
func sayHello(name: String) -> String {
    return "Hello, \(name)."
}
sayHello(name: "mike")

// closure 的寫法
let sayHello2 = {
    (name: String) -> String in
    return "Hello, \(name)."
}
sayHello2("mike")

//## 當Closure遇到func參數
var names = ["mike", "bonnie", "peter"]
//names.sort(by: {
//    (name1: String, name2: String) -> Bool in
//    return name1.count > name2.count
//})

// 更簡潔的寫法
names.sort { (name1, name2) -> Bool in
    return name1.count > name2.count
}
names // ["bonnie", "peter", "mike"]

//* 由於型別String已知，可以省略
//* 如果不想更動原本的array，可以使用Array.sorted()
//* 由於Trailing Closures特性，closure如果是最後一個參數，可以將大括弧{}移動到外面

// 同樣的這個例子也可以縮寫，以下用反排序做示範
names.sort { $0.count < $1.count }
names // ["mike", "peter", "bonnie"]

//* 其中第一個與第二個參數可以省略，並使用$0代表第一個，$1代表第二個參數
//* 同時也可以省略in 關鍵字
