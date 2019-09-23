import UIKit

/*
 Day6 Swift 布林與字串
 */

// 宣告 Bool變數
var swiftIsCool:Bool = true
var completeIT30IsEasy = false

var IT30WithSwift = swiftIsCool || completeIT30IsEasy

// 宣告 String變數
let name = "Mike"

// 多行字串
let multiline = """
swift is cool.
swift is fast.
IT30 is not easy.
"""

// 字串的幾個常用方法

// string interpolation
let launguage = "swift"
let content = "\(launguage) is very cool."

// 取出每一個字元
for character in content {
    print(character)
}

// 計算字元總量
let count = content.count // 19

// 字串的大小寫轉換
let lowerContent = content.lowercased()
let upperContent = content.uppercased()
