let a = 1
let b = 5

for row in a...b {
    row
}

for row in a..<b {
    row
}

for row in 1...5 {
    print(row)
}

for row in 1...9 {
    print("2 X \(row) = \(row * 2)")
}

for year  in  1950 ... 2022 {
    print("\(year) 년도")
}

var lang = "swift"
for char in lang {
    print("개별 문자는 \(char)입니다")
}

let size = 5
let padChar = "0"
var keyword = "3"

for _ in 1...size {
    keyword = padChar + keyword
}
print("\(keyword)")

for i in 1..<10 {
    print("----\(i)단----")
    for j in 1..<10 {
        print("\(i) X \(j) = \(i * j)")
    }
}

var n = 2
while n < 1000 {
    n = n * 2
}
print("n = \(n)")

var m = 1024
while m < 1000 {
    m = m * 2
}
print("m = \(m)")

var m2 = 1024
repeat {
    n = n * 2
} while n < 1000
print("n = \(n)")
  
var adult = 19
var age = 21
var gender = "M"

if age < adult {
    if gender == "M" {
        print("남자 미성년자")
    } else {
        print("여자 미성년자")
    }
} else {
    if gender == "M" {
        print("남자 성년자")
    } else {
        print("여자 성년자")
    }
}

var browser = "Safari"
var browserName : String

if (browser == "IE") {
    browserName = "인터넷 익스플로러"
} else if (browser == "FF") {
    browserName = "파이어폭스"
} else if (browser == "Chrome"){
    browserName = "크롬"
} else if (browser == "Opera") {
    browserName = "오페라"
} else if (browser == "Safari") {
    browserName = "사파리"
} else {
    browserName = "알려지지 않은 브라우저"
}
print("사용하고 계신 브라우저는 \(browserName)입니다.")

func divide(base: Int) {
    guard base != 0 else {
        print("연산할 수 없습니다.")
        return
    }
    let result = 100 / base
    print(result)
}

divide(base: 0)
divide(base: 5)

let val = 2

switch val {
case 1 :
    print("일치한 값은 1입니다")
case 2 :
    print("일치한 값은 2입니다")
case 2 :
    print("일치한 값 2가 더 있습니다")
default :
    print("어느 패턴과도 일치하지 않았습니다")
}

let sampleChar : Character = "a"

switch sampleChar {
case "a":
    fallthrough
case "A":
    print("글자는 A 입니다")
default :
    print("일치하는 글자가 없습니다")
}

var passtime = 1957

switch passtime {
case 0..<60 :
    print("방금 작성된 글입니다")
case 60..<3600 :
    print("조금 전 작성된 글입니다")
case 3600..<86400 :
    print("얼마 전 작성된 글입니다")
default :
    print("예전에 작성된 글입니다")
}

var text = "This is a swift book for Apple's programming language"
var result = ""

for char in text{
    if char == " " {
        result.append(Character("_"))
        continue
    } else if char == "o" {
        result.append(Character("O"))
        continue
    }
    result.append(char)
}
print(result)

outer : for i in 1...5 {
    inner : for j in 1...9 {
        if (j==3) {
            break outer
        }
        print("\(i) X \(j) = \(i * j)")
    }
}
