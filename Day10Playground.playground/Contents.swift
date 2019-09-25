import UIKit

/*
 Day10 Swift Optional
 */

//## 當Value Type遇到 Optional

// var number1: Optional<Int> = nil
var number1: Int? = nil
number1 // nil
type(of: number1) // Optional<Int>.Type

var name: String? = "mike"
name // Optional("mike")


//## Optional 解開與使用
//接者我們將介紹幾個解開與使用Optional的方法
//**force-unwrap**
//直接使用驚嘆號!強制解開，如果沒有值的話，會爆出錯誤並且App會閃退。
//因此除非很確定有值，或是先用if判斷，不然不建議使用這個方式
let number2: Optional<Int> = 1
let number3 = number2! + 1
number3 // 2

//**Optional Binding**
let luckyNumber: Int? = 7
let minNumber: Int? = Int.min

if let number1 = luckyNumber, let number2 = minNumber {
    print(number1)
    print(number2)
} else {
    print("error")
}

//* 使用if let來解開luckyNumber & minNumber
//* 如果解開失敗，就不會執行{}裡面的程式碼
//* 只有一開始要加上if let，後面直接加上let即可解開多個變數

//**Optional Chaining**
//如果變數有多階層，或是類別中的屬性，可以使用這個方式
let swiftImage = UIImage(named: "IT30_Swift")
let size = swiftImage?.size
size

//* swiftImage的型別為UIImage?
//* 取用size屬性時，如果swiftImage為nil，就不會往後面在取值，會直接回傳nil
//* 因此本例中的size為nil，如果swiftImage不為空時，才會取得size

//**Nil-Coalescing Operator**
class Pet {
    var name: String = ""
    var age: Int = 0
    var hasBreeder: Optional<Bool> = nil
    init(name:String, age: Int, breeder: Bool? = nil) {
        self.name = name
        self.age = age
        self.hasBreeder = breeder
    }
}
let pat1 = Pet(name: "QQ", age: 3, breeder: true)
let hasBreeder = pat1.hasBreeder ?? false

//* 本例中有一個寵物QQ，並有一個主人mike
//* 我們不確定有沒有主人，因此使用兩個問號？？，如果沒有主人預設就給 false

//## Guard with Optional
//這個方式與if let的Optional Binding非常類似，但是有一些差異性，實務上也常常會使用。
//一樣來看看程式碼
func getIT30Status(article: Int, isComplete: Bool?) -> Bool {
    guard let complete = isComplete else {
        return false
    }
    return complete && article > 30
}
let finish = getIT30Status(article: 31, isComplete: true)
finish
//* 可以看到 guard 如果失敗，就會進入else內，可以直接return回傳
//* 使用guard let設定的變數，在同一個scope內都可存取，而if let只有{}大括弧內可存取
