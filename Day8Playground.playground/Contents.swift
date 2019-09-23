import UIKit

/*
 Day8 Swift func方法
 */

// 定義第一個方法
func sayHello() {
    print("Hello!")
}

// 定義帶參數的方法
func sayHello(name: String) {
    print("Hello, \(name).")
}

//呼叫方法
sayHello() // Hello!
sayHello(name: "mike") // Hello, mike.

// **外部參數 & 內部參數**
func buy(buyGoods goods: String, price: Int) {
    print("我花了\(price)元，買了一個 \(goods) ")
}
// 我花了30400元，買了一個 iPhone11 256GB
buy(buyGoods: "iPhone11 256GB", price: 30400)

// * buyGoods為外部參數，goods為內部參數
// * 如果沒有定義外部參數，預設與內部參數相同名稱 => price

func add(_ number1: Int, _ number2: Int) {
    print("number1 + number2 = \(number1 + number2)")
}
add(3, 5) // 8
// * 如果呼叫時，不想填參數名，可以使用底線**_**來做外部參數

// ## 有回傳值的方法
func sub(number1: Int, number2: Int) -> Int {
    return number1 - number2
}
sub(number1: 10, number2: 5) // 5
//* 這邊定義了一個有回傳值的sub()方法
//* 回傳的型別為Int

//*實例觀察
