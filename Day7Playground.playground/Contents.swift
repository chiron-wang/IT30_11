import UIKit

/*
 Day7 Swift 類別與結構
 */

// 類別宣告首字大寫
class Human {
    var name: String
    var age: Int = 18
    // 建構子
    init(name: String) {
        self.name = name
    }
}

// * 可以看到Human這個類別，有兩個屬性name & age
// * 如果沒有給初始值，就必須在init()建構子中初始化

// **接者我們來看看繼承的概念**

class Man : Human {
    var height: Int
    var weight: Int
    
    init(name: String, height: Int, weight: Int) {
        self.height = height
        self.weight = weight
        super.init(name: name)
    }
    
    func play() {
        print("Learn Swift with play playground.")
    }
}

// * 我們有一個繼承Human的Man類別，並加入height & weight 兩個屬性
// * 由於沒有給預設值，所以我們必須在建構子中宣告
// * 最後再用super.init()來呼叫父類別的建構子
// * 這邊要注意子類別的屬性要先初始化後，才能呼叫super.init()，不然會出現如下錯誤
// * 並新增一個play()方法，關於func方法將會在後續文章進一步介紹

/*
 ## 結構 struct
 */

struct Person {
    var name: String
    var age: Int
}
// 自動產生memberwise initializer
let person1 = Person(name: "mike", age: 18)

//struct SuperMan : Person {}

// 由於struct是value type, 因此person2的變更，不會影響person1
var person2 = person1
person2.name = "Peter"
print("person1.name: \(person1.name)")
print("person2.name: \(person2.name)")

// * struct無法被繼承，類別可以
// * struct會自動產生memberwise initializer
// * struct是value type, class 是 reference type
