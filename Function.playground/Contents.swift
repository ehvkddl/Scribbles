func printHello() {
    print("안녕하세요")
}

func sayHello() -> String {
    let returnValue = "안녕하세요"
    return returnValue
}

func printHelloWithName(name: String) {
    print("\(name)님, 안녕하세요")
}

func sayHelloWithName(name: String) -> String {
    let returnValue = "\(name)님, 안녕하세요"
    return returnValue
}

func hello(name: String?) {
    guard let _name = name else {
        return
    }
    print("\(_name)님, 안녕하세요")
}

hello(name: "kim do hee")

printHello()

let inputName = "홍길동"
printHelloWithName(name: inputName)
printHelloWithName(name: "홍길동")

func incrementBy(amount: Int, numberOfTimes: Int) {
    var count = 0
    count = amount * numberOfTimes
}
incrementBy(amount: 5, numberOfTimes: 2)

func getIndvInfo() -> (Int, String) {
    let height = 100
    let name = "꼼꼼한 재은씨"
    
    return (height, name)
}
print(getIndvInfo())

func getUserInfo() -> (Int, Character, String) {
    let gender: Character = "M"
    let height = 180
    let name = "꼼꼼한 재은씨"
    
    return (height, gender, name)
}
var uInfo = getUserInfo()
print(uInfo)
uInfo.0
uInfo.1
uInfo.2

var (a,b,c) = getUserInfo()
a
b
c

var (height, _, name) = getUserInfo()

func getUserInfo2() -> (h: Int, g: Character, n: String) {
    let gender: Character = "M"
    let height = 180
    let name = "꼼꼼한 재은씨"
    
    return (height, gender, name)
}
var result = getUserInfo2()
result.h
result.g
result.n


typealias infoResult = (Int, Character, String)

func getUserInfo3() -> infoResult {
    let gender: Character = "M"
    let height = 180
    let name = "꼼꼼한 재은씨"
    
    return (height, gender, name)
}

let info = getUserInfo3()
info.0
info.1
info.2

//일반 함수 (외부 매개변수 X)
func printHello2(name: String, msg: String) {
    print("\(name)님, \(msg)")
}
printHello2(name: "홍길동", msg: "안녕하세요")

//외부 매개변수 지정
func printHello3(to name: String, welcomeMessage msg: String) {
    print("\(name)님, \(msg)")
}
printHello3(to: "홍길동", welcomeMessage: "안녕하세요!!")


//가변인자
func avg(score: Int...) -> Double {
    var total = 0
    for r in score {
        total += r
    }
    return (Double(total) / Double(score.count))
}
print(avg(score: 10,20,30,40))


//기본값을 갖는 매개변수
func echo(message: String, newline: Bool = true) {
    if newline == true {
        print(message, true)
    } else {
        print(message, false)
    }
}

echo(message: "안녕하세요")
echo(message: "안녕하세요", newline: true)
echo(message: "안녕하세요", newline: false)


//매개변수의 수정
func descAge(name: String, _ paramAge: Int) -> String {
    var name = name
    var paramAge = paramAge
    
    name = name + "씨"
    paramAge += 1
    return "\(name)의 내년 나이는 \(paramAge)세입니다"
}
print(descAge(name: "김도희", 25))


//InOut 매개변수
var cnt = 30

func autoIncrement(value: Int) -> Int {
    var value = value
    value += 1
    
    return value
}
print(autoIncrement(value: cnt))
print(cnt)
print()
func foo(paramCount: inout Int) -> Int {
    paramCount += 1
    return paramCount
}

var count = 30
print(foo(paramCount: &count))
print(count)


//변수의 생존범위와 주기
var count2 = 30
func foo2() -> Int {
    count2 += 1
    return count
}
foo2()

//일급 객체로서의 함수
//fn1이라는 상수에 함수의 결과값 할당
func foo3(base: Int) -> String {
    return "결과값은 \(base + 1)입니다"
}
let fn1 = foo3(base: 5)

//변수에 함수를 할당
let fn2 = foo3
print(fn2(5))

func foo4(base: Int) -> String {
    print("함수 foo가 실행됩니다")
    return "결과값은 \(base + 1)입니다"
}

let fn3 = foo4(base: 5)
let fn4 = foo4


//함수의 반환 타입으로 함수 사용가능
func desc() -> String {
    return "this is desc()"
}

func pass() -> () -> String {
    return desc
}

let p = pass()
print(p())

//계산기
func plus(a: Int, b: Int) -> Int {
    return a + b
}
func minus(a: Int, b: Int) -> Int {
    return a - b
}
func times(a: Int, b: Int) -> Int {
    return a * b
}
func divide(a: Int, b: Int) -> Int {
    guard b != 0 else {
        return 0
    }
    return a / b
}

func calc(_ operand: String) -> (Int, Int) -> Int {
    switch operand{
    case "+" :
        return plus
    case "-" :
        return minus
    case "*" :
        return times
    case "/" :
        return divide
    default :
        return plus
    }
}

let r = calc("+")
print(r(3,4))

print(calc("+")(3,4))

let r2 = calc("-")
print(r2(3,4))


//함수의 인자값으로 함수 사용
func incr(param: Int) -> Int {
    return param + 1
}
func broker(base: Int, function fn: (Int) -> Int) -> Int {
    return fn(base)
}
print(broker(base: 3, function: incr))



//콜백함수
func successThrough() {
    print("연산 처리가 성공했습니다.")
}
func failThrough() {
    print("처리 과정에 오류가 발생하였습니다.")
}
func divide(base: Int, success sCallBack: () -> Void, fail fCallBack: () -> Void) -> Int {
    guard base != 0 else {
        fCallBack()
        return 0
    }
    
    defer {
        sCallBack()
    }
    return 100 / base
}
print(divide(base: 30, success: successThrough, fail: failThrough))

//익명함수
divide(base: 30, success: { () -> Void in print("연산 처리가 성공했습니다.")}, fail: { () -> Void in print("연산 처리가 실패했습니다.")})

//함수의 중첩
//외부함수
func outer(base: Int) -> String {
    //내부함수
    func inner(inc: Int) -> String {
        return "\(inc)를 반환합니다"
    }
    let result = inner(inc: base + 1)
    return result
}
print(outer(base: 3))

//외부함수
func outer(param: Int) -> (Int) -> String {
    //내부함수
    func inner(inc: Int) -> String {
        return "\(inc)를 리턴합니다"
    }
    return inner
}

let fn5 = outer(param: 3)
let fn6 = fn5(30)

//내부 함수에 외부 함수의 지역 상수, 지역 변수가 참조
func basic(param: Int) -> (Int)->Int {
    let value = param + 20
    
    func append(add: Int) -> Int {
        return value + add
    }
    return append
}
let result2 = basic(param: 10)
result2(10)

