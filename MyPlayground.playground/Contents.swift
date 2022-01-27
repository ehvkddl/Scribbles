import UIKit

for i in 0...5 {
    i
    print("출력값은 \(i)입니다")
}

var value = 1
value += 1
value += 2

let frame = CGRect(x: 100, y: 100, width: 200, height: 100)
let view = UILabel(frame: frame)

view.backgroundColor = UIColor.red
view.textAlignment = .center
view.text = "Hello, World!!!"

Int.max
Int.min

var temper1 = 3
var temper2 : Float = 3
print(temper1, temper2)


var stmt = "귀여운 도희의 키는"
var height = 152

var heightStmt = stmt + String(height)

let name = "김도희"
let year = "1998"
let month = "10"
let day = "10"

let profile = "\(name)는 \(year)년 \(month)월 \(day)일에 태어났습니다."
print(profile)
