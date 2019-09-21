import UIKit

/*
 Day5 Swift 整數與浮點數
*/

// 宣告一個Int
var number1:Int = 88

// 加減乘除
number1 += 1
number1 -= 1
number1 *= 10
number1 /= 10

// 顯示Int
let number2 = number1.description
let number3 = "\(number1)"
print(number2)
print(number3)

// 顯示加上 $錢字號的數字字串
let formatter = NumberFormatter()
formatter.numberStyle = .currency
let number4 = formatter.string(from: NSNumber(value: number1))!
print(number4)

// 浮點數
let number5 = 3.14
let number6:Float = 168.888

// 如果要運算要先轉型
let number7 = number5 - Double(number6)
print(number7)

/* Reference
 ## 參考資料與延伸閱讀
 1. 彼得潘的Swift程式設計入門
 https://www.tenlong.com.tw/products/9789572246573
 
 2.《The Swift Programming Language》正體中文版
 https://tommy60703.gitbooks.io/swift-language-traditional-chinese/content/chapter2/01_The_Basics.html#floating-point_numbers
 
 3. Apple Developer Document
 https://developer.apple.com/documentation/swift/double
*/
