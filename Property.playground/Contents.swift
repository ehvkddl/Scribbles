//클래스의 저장 프로퍼티
//첫번째 해결책 : 초기화 구문을 작성하고, 그 안에서 초기값을 할당
class User {
    var name: String
    
    init() {
        self.name = ""
    }
}

//두번째 해결책 : 프로퍼티를 옵셔널 타입으로 바꿔줌
//기본 옵셔널 타입
class User2 {
    var name: String?
}
//묵시적 옵셔널 해제 타입 ( 프로퍼티 값이 nil이 되지 않을 자신이 있다면 사용)
class User3 {
    var name: String!
}

//세번째 해결책 : 프로퍼티에 초기값을 할당
class User4 {
    var name: String = ""
}


//구조체에서 저장 프로퍼티
struct FixedLengthRange {
    var startValue: Int //시작값
    let length: Int //값의 범위
}

//가변 길이 범위 구조체
struct FlexibleLengthRange {
    let startValue: Int //시작값
    var length: Int //값의 범위
}

//아래 구조체 인스턴스는 정수값 0,1,2를 의미
var rangeOfFixedIntegers = FixedLengthRange(startValue: 0, length: 3)
//시작값을 변경하면 객체 인스턴스는 정수값 4,5,6을 의미
rangeOfFixedIntegers.startValue = 4

//아래 구조체 인스턴스는 정수값 0,1,2를 의미
var rangeOfFlexibleIntegers = FlexibleLengthRange(startValue: 0, length: 3)
//범위값을 변경하면 객체 인스턴스는 정수값 0,1,2,3,4를 의미
rangeOfFlexibleIntegers.length = 5


//지연 저장 프로퍼티
class OnCreate {
    init() {
        print("OnCreate!!")
    }
}

class LazyTest {
    var base = 0
    lazy var late = OnCreate()
    
    init() {
        print("Lazy Test")
    }
}

let lz = LazyTest()
lz.late


//클로저를 이용한 저장 프로퍼티 초기화
class PropertyInit {
    //저장 프로퍼티 - 인스턴스 생성 시 최초 한 번만 실행
    var value01: String! = {
        print("value01 execute")
        return "value01"
    }()
    let value02: String! = {
        print("value02 execute")
        return "value02"
    }()
    lazy var value03: String! = {
        print("value03 execute")
        return "value03"
    }()
}

let s = PropertyInit()

s.value01
s.value02
//실행 결과 없음 - 저장 프로퍼티에 정의된 클로저 구문이 더 이상 재실행되지 않음

let s1 = PropertyInit()
s1.value03
s1.value03 //실행결과 없음(저장프로퍼티 - 최초에 값이 평과되고나면 이후로는 값이 재평가되지 않음)
