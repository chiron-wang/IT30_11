import UIKit

/*
 Day12 集合與列舉
 */

//## Array
//https://developer.apple.com/documentation/swift/array

//> 看官方文件中Array<Element>可以知道，其實中Element是個泛型，可以放入內建型別(Int, String)，或是自訂的型別(class...)

// 現在我們來看看程式碼
//var names: Array<String> = ["mike", "peter", "bonnie"]
var names: [String] = ["mike", "peter", "bonnie"]

// 取出第一筆資料
names[0]

// error: Execution
//names[3]

// 取出總數量
names.count // 3

//## Dictionary
// 建立一個字典儲存考試成績
var classScores:[String : [Int]] = [
    "mike": [80, 90, 100],
    "peter": [90, 90, 90],
    "bonnie": [100, 100, 100]
]

// 更新字典的值
classScores.updateValue([100, 100, 100], forKey: "peter")
classScores["mike"] = [100, 100, 100]

// 取出字典的值
for (name, scores) in classScores {
    print("\(name)的成績： 國文: \(scores[0]), 英文: \(scores[1]), 數學: \(scores[2])")
}
/*
 mike的成績： 國文: 100, 英文: 100, 數學: 100
 bonnie的成績： 國文: 100, 英文: 100, 數學: 100
 peter的成績： 國文: 100, 英文: 100, 數學: 100
 */

//* 我們宣告一個字典，用來存放考試分數
//* 並使用for loop來取出每個人的分數
//* 而value的型別為[Int]整數陣列
//* 這邊要注意key是不可重複的，不然會報錯
//* 更多Dictionary用法，請參考ref4官方文件

//## Tuple
// Tuple可以在一個變數中，用來存放不同型別的值，如果搭配function來使用，也可以達成多回傳值的效果
// 現在我們來看看官方文件上的例子
var someTuple = (top: 10, bottom: 12)  // someTuple is of type (top: Int, bottom: Int)
someTuple = (top: 4, bottom: 42) // OK: names match
someTuple = (9, 99)              // OK: names are inferred
//someTuple = (left: 5, right: 5)  // Error: names don't match
type(of: someTuple)

// 取出Tuple的內容
let top = someTuple.top // 9
let bottom = someTuple.1 // 99


//* someTuple = (left: 5, right: 5) 會報錯，是因為型別不符合
//* someTuple的型別為(top: Int, bottom: Int)
//* 而(top: 10, bottom: 12)包含名稱的Tuple，top & bottom 名稱也包含在型別內

//接者看一個比較簡單的例子
var mikeTuple = (18, 180, 58)
// 取值的方式就是依序 Tuple.0, Tuple.1, Tuple.2
let mikeAge = mikeTuple.0 // 18歲
let mikeHeight = mikeTuple.1 // 身高180
let mikeWeight = mikeTuple.2 // 體重58

//## Set
//與Array非常類似，可以存放同一類型(型別)的資料，但是每個值都是唯一，不可重複。
//例如要存放撲克牌1-52，不重複的牌卡，就可以使用Set
// 一樣來看看程式碼
// 設定第一個Set
var primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101]

// 取出Set的內容
let firstPrime = primes[0] // 2

// 取出Set的數量
var primeCount = primes.count // 26

// 清空所有Set的內容
primes.removeAll()
primeCount = primes.count // 0

//## 列舉enum
// 定義一個enum
enum cloudService: CaseIterable {
    case aws, azure, gcp, none
}

// 取出enum的值
var amazon = cloudService.aws
var microsoft = cloudService.azure
var google = cloudService.gcp

// 也可以搭配switch使用
let cloud1 = cloudService.aws
switch cloud1 {
case .aws:
    print("use \(amazon)")
case .azure:
    print("use \(microsoft)")
case .gcp:
    print("use \(google)")
default:
    print("no use")
}
// use aws

// 取出所有列舉的內容，搭配CaseIterable
for cloud in cloudService.allCases {
    print(cloud)
}
// aws, azure, gcp, none

//* 定義了一個enum裡面有四個值
//* enum與switch可以做很好的搭配
//* 如果要巡覽所有enum的值，可以搭配CaseIterable這個protocol

