import UIKit

//## if else & switch
//**if else**
let todayAQI = 100
if todayAQI <= 100 {
    print("健康")
} else {
    print("不健康")
}
//* 如果空氣品質指標AQI超過100代表不健康

//**if, else if**
let AQI = 27
if (AQI) < 51 {
    print("良好")
} else if AQI < 101 {
    print("普通")
} else if AQI < 151 {
    print("對敏感族群不健康")
} else if AQI < 201 {
    print("對所有族群不健康")
} else if AQI < 301 {
    print("非常不健康")
} else {
    print("危害")
}
//* 這個例子包含了多個判斷0-50, 51-100, 101-150, 151-200, 201-300


//**switch**
//前面的例子，也可以使用switch來表示
switch AQI {
case 0...50:
    print("良好")
case 51...100:
    print("普通")
case 101...150:
    print("對敏感族群不健康")
case 151...200:
    print("對所有族群不健康")
case 201..<301:
    print("非常不健康")
default:
    print("危害") // AQI >= 301
}

//* 使用switch表達，並搭配closed range，0...50代表從0到50 (下限到上限)
//* 在201..<301則是half-open range，代表201到300，不包含301
//* default代表，如果不在前面的case內，則進入此區塊


//## for loop & while
//這邊將介紹基本的for迴圈，並搭配前面提過的range一起使用
//**for loop**
var sum = 0
for i in 1...10 {
    sum += i
}
sum // 55

//**while loop**
var sum2 = 0
var i = 1

while i <= 10 {
    sum2 += i
    i += 1
}
sum2

//**while & repeat**
// repeat不管條件有沒有符合，也至少會執行一次 (類似其他語言中的do while概念)
var sum3 = 55
i = 11
repeat {
    sum3 += i
} while i <= 10
sum3 // 55 + 11 = 66

//* 這邊可以看到，雖然while條件不符合，但是至少跑了一次
//* 因此sum3的結果為55 + 11 = 66



