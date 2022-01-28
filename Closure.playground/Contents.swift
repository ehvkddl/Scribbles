//클로저 표현식을 인자값으로 넘기지않고 직접 실행하는 법
//1. 일급 함수로서의 특성을 활용하여 상수나 변수에 클로저 표현식을 할당
let f = { () -> Void in
    print("클로저가 실행됩니다")
}
f()

//2. 상수 f 생략
({ () -> Void in
    print("클로저가 실행됩니다")
})()



//매개변수가 있는 형태의 클로저 표현식
//1번 방법
let c = { (s1: Int, s2: String) -> Void in
    print("s1:\(s1), s2:\(s2)")
}
c(1, "closure")

//2번 방법
({ (s1: Int, s2: String) -> Void in
    print("s1:\(s1), s2:\(s2)")
})(5, "closure")



//클로저 표현식과 경량 문법
var value = [1, 9, 5, 7, 3, 2]

func order(s1: Int, s2: Int) -> Bool {
    if s1 > s2 {
        return true
    } else {
        return false
    }
}
value.sort(by: order)

//order -> 클로저 표현식
value.sort(by: {
    (s1: Int, s2: Int) -> Bool in
    if s1 > s2 {
        return true
    } else {
        return false
    }
})
//간결하게1
value.sort(by: { (s1: Int, s2: Int) -> Bool in
    return s1 > s2
})
//간결하게2
value.sort(by: { (s1: Int, s2: Int) -> Bool in return s1 > s2})



//클로저 표현식 -> 반환값 타입 생략 가능
//{ (s1: Int, s2: Int) in
//    return s1 > s2
//}
value.sort(by: { (s1: Int, s2: Int) in return s1 > s2})
print(value)

//클로저 표현식 -> 매개변수의 타입 정의 생략 가능
value.sort(by: { s1, s2 in return s1 < s2 })
print(value)
//매개변수 생략, in 키워드 생략, return 구문 생략
value.sort(by: { $0 > $1 })

//연산자 함수 : 연산자만을 사용하여 의미하는 바를 정확히 나타낼 수 있을 때 사용
value.sort(by: > )



//트레일링 클로저
//인자값이 하나일 때
value.sort { (s1, s2) in
    return s1 > s2
}
value.sort { $0 > $1 }

//인자값이 여러 개일 때
func divide(base: Int, success s: () -> Void) -> Int {
    defer {
        s()
    }
    return 100 / base
}
divide(base: 100) { () in
    print("연산이 성공했습니다")
}

//트레일링 클로저 문법은 마지막 인자값에만 적용 가능
func divide2(base: Int, success s: () -> Void, fail f: () -> Void) -> Int {
    guard base != 0 else {
        f()
        return 0
    }
    defer {
        s()
    }
    return 100 / base
}

divide2(base: 100, success: { () in
    print("연산이 성공했습니다.")
}) { () in
    print("연산에 실패했습니다.")
}



//@escaping 속성
func callback(fn: @escaping () -> Void) {
    let f = fn
    f()
}
callback {
    print("Closure가 실행되었습니다.")
}



//@autoclosure 속성
func condition(stmt: @autoclosure () -> Bool) {
    if stmt() == true {
        print("결과가 참입니다.")
    } else {
        print("결과가 거짓입니다.")
    }
}
condition(stmt: ( 4 > 2 ))

//지연된 실행
var arrs = [String]()

func addVars(fn: @autoclosure () -> Void) {
    arrs = Array(repeating: "", count: 3)
    fn()
}
//오류 - addVars함수가 실행되기 전까지 배열의 인덱스는 0인데 1번위치에 "KR"을 입력하려고 해서
//arrs.insert("KR", at: 1)

//addVars함수 실행 후에 클로저 실행되어 배열의 인덱스가 확장된 뒤에 insert 구문 실행
addVars(fn: arrs.insert("KR", at: 1))
print(arrs)
