let tupleValue = ("a", "b", 1, 2.5, true)

print(tupleValue.0)
print(tupleValue.1)
print(tupleValue.2)
print(tupleValue.3)
print(tupleValue.4)

let tupleValue2 : (String, Character, Int, Float, Bool) = ("a", "b", 1, 2.5, true)
let (a,b,c,d,e) = tupleValue2

a
b
c
d
e

print(a)
print(b)
print(c + 2)
print(d * 2)
print(e)

func getTupleValue() -> (String, String, Int) {
    return ("t", "v", 100)
}

let (a1,b1,c1) = getTupleValue()
a1
b1
c1

let (a2,b2,_) = getTupleValue()
a2
b2

var capital = ["KR":"Seoul", "EN":"London", "FR":"Paris"]
capital["KR"]
capital["EN"]
capital["FR"]

var capital2 = Dictionary<String, String>()
var capital3 : [String : String] = Dictionary()

var newCapital : [String : String] = Dictionary()
newCapital["JP"] = "Tokyo"

if newCapital.isEmpty {
    print("딕셔너리가 비어 있는 상태입니다")
} else {
    print("딕셔너리의 크기는 현재 \(newCapital.count)입니다")
}

newCapital.updateValue("Seoul", forKey: "KR")
newCapital.updateValue("London", forKey: "EN")
newCapital.updateValue("Sapporo", forKey: "JP")
newCapital.updateValue("Ottawa", forKey: "CA")
newCapital.updateValue("Beijing", forKey: "CN")

print(newCapital)

newCapital["CN"] = nil
print(newCapital)

//newCapital.removeValue(forKey: "CA")
//print(newCapital)

if let removedValue = newCapital.removeValue(forKey: "CA") {
    print("삭제된 값은 \(removedValue)입니다.")
} else {
    print("아무 것도 삭제되지 않았습니다")
}

for row in newCapital {
    let (key, value) = row
    print("현재 데이터는 \(key) : \(value)입니다")
}

for (key, value) in newCapital {
    print("현재 데이터는 \(key) : \(value)입니다")
}
