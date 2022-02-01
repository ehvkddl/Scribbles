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
s1.value03 //실행결과 없음(저장프로퍼티 - 최초에 값이 평가되고나면 이후로는 값이 재평가되지 않음)



//연산 프로퍼티
import Foundation

//나이 계산
struct UserInfo {
    //저장 프로퍼티
    var birth: Int!
    //연산 프로퍼티 : 올해가 몇년도인지 계산
    var thisYear: Int! {
        get {
            let df = DateFormatter()
            df.dateFormat = "yyyy"
            return Int(df.string(from: Date()))
        }
    }
    //연산 프로퍼티 : 나이 구하기 (올해 - 태어난 연도 + 1)
    var age: Int {
        get {
            return (self.thisYear - self.birth) + 1
        }
    }
}

let info = UserInfo(birth: 1980)
print(info.age)


//사각형의 중심 좌표 계산
//struct Rect {
//    //사각형의 왼쪽 상단 좌표
//    var originX: Double = 0.0, originY: Double = 0.0
//    //가로 세로 길이
//    var sizeWidth: Double = 0.0, sizeHeight: Double = 0.0
//    //사각형의 X좌표 중심
//    var centerX: Double {
//        get {
//            return self.originX + (sizeWidth / 2)
//        }
//        set(newCenterX) {
//            originX = newCenterX - (sizeWidth / 2)
//        }
//    }
//    var centerY: Double {
//        get {
//            return self.originY + (self.sizeHeight / 2)
//        }
//        set(newCenterY) {
//            originY = newCenterY - (self.sizeHeight / 2)
//        }
//    }
//}
//
//var square = Rect(originX: 0.0, originY: 0.0, sizeWidth: 10.0, sizeHeight: 10.0)
//print("square.centerX = \(square.centerX), square.centerY = \(square.centerY)")


struct Position {
    var x: Double = 0.0
    var y: Double = 0.0
}
struct RectSize {
    var width: Double = 0.0
    var height: Double = 0.0
}

struct Rect {
    //사각형의 왼쪽 상단 좌표
    var origin = Position()
    //가로 세로 길이
    var size = RectSize()
    //사각형의 X좌표 중심
    var center: Position {
        get {
            let centerX = self.origin.x + (self.size.width / 2)
            let centerY = self.origin.y + (self.size.height / 2)
            return Position(x: centerX, y: centerY)
        }
        set(newCenter) {
            self.origin.x = newCenter.x - (size.width / 2)
            self.origin.y = newCenter.y - (size.height / 2)
        }
    }
}
let p = Position(x: 0.0, y: 0.0)
let rs = RectSize(width: 10.0, height: 10.0)

var square = Rect(origin: p, size: rs)
print("square.centerX = \(square.center.x), square.centerY = \(square.center.y)")

square.center = Position(x: 20.0, y: 20.0)
print("square.centerX = \(square.origin.x), square.centerY = \(square.origin.y)")


//프로퍼티 옵저버
struct Job {
    var income: Int = 0 {
        willSet(newIncome) {
            print("이번 달 월급은 \(newIncome)입니다.")
        }
        didSet {
            if income > oldValue {
                print("월급이 \(income - oldValue)원 증가하셨네요. 소득세가 상향조정될 예정입니다.")
            } else {
                print("저런, 월급이 삭감되었군요. 그래도 소득세는 깍아드리지 않아요.")
            }
        }
    }
}
var job = Job(income: 1000000)
job.income = 2000000
job.income = 1500000


//타입 프로퍼티
struct Foo {
    //타입 저장 프로퍼티
    static var sFoo = "구조체 타입 프로퍼티값"
    
    //타입 연산 프로퍼티
    static var cFoo: Int {
        return 1
    }
}

class Boo {
    //타입 저장 프로퍼티
    static var sFoo = "클래스 타입 프로퍼티값"
    
    //타입 연산 프로퍼티
    static var cFoo: Int {
        return 10
    }
    
    //재정의가 가능한 타입 연산 프로퍼티
    class var oFoo: Int {
        return 100
    }
}

//타입 프로퍼티들은 별도의 인스턴스 생성 없이 사용 가능
print(Foo.sFoo)
Foo.sFoo = "새로운 값"
print(Foo.sFoo)

print(Boo.sFoo)
print(Boo.cFoo)
