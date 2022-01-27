let v = Int("123")
print(v)

var optInt: Int?
optInt = 3

var optStr: String?
optStr = "Swift"

var optArr: [String]?
optArr = ["C", "JAVA", "Objective-C", "SmallTalk"]

var optDic: [String : Int]?
optDic = ["국어" : 94, "수학":88, "영어":96]

print("옵셔널 자체의 값 : \(optInt)")
print("!로 강제 해제한 값 : \(optInt!)")

Int("123")! + Int("123")!
Int("123")! + 30

//var str = "123"
var str = "Swift"
var intFromStr = Int(str)

if intFromStr != nil {
    print("값이 반환되었습니다. 변환된 값은 \(intFromStr!)입니다")
} else {
    print("값 변환에 실패하였습니다")
}


if let intFromStr2 = Int(str) {
    print("값이 변환되었습니다. 변환된 값은 \(intFromStr2)입니다")
} else {
    print("값 변환에 실패하였습니다")
}

func intStr(str: String) {
    guard let intFromStr3 = Int(str) else {
        print("값 변환에 실패하였습니다")
        return
    }
    print("값이 변환되었습니다. 변환된 값은 \(intFromStr3)입니다")
}
intStr(str: "123")
intStr(str: "Swift")

var capital = ["KR" : "Seoul", "EN" : "London", "FR" : "Paris"]

print(capital["KR"])
print(capital["KR"]!)

if (capital["KR"] != nil) {
    print(capital["KR"]!)
}

if let val = capital["KR"] {
    print(val)
}

let optInt2 = Int("123")

if ((optInt2!) == 123) {
    print("optInt2 == 123")
} else {
    print("optInt2 != 123")
}

if (optInt2 == 123) {
    print("optInt2 == 123")
} else {
    print("optInt2 != 123")
}

let tempInt = Int("123")

tempInt == 123
tempInt == Optional(123)
tempInt! == 123
tempInt! == Optional(123)

var optValue01 = Optional(123)
var optValue02 : Int? = 123

//묵시적 옵셔널
var str2: String! = "Swift Optional"
print(str2)

//var value01: Int? = 10
//value01 + 5

var value02: Int! = 10
value02 + 5
