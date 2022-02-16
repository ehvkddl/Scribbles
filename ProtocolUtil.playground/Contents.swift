import Foundation

//확장 구문과 프로토콜
class Man {
    var name: String?
    
    init(name: String = "홍길동") {
        self.name = name
    }
}

protocol Job {
    func doWork()
}

extension Man: Job {
    func doWork() {
        print("\(self.name!)님이 일을 합니다")
    }
}

//let man = Man()
let man = Man(name: "개발자")
man.doWork()



//프로토콜의 상속 : 클래스처럼 상속 가능, 다중 상속도 가능
protocol A {
    func doA()
}
protocol B {
    func doB()
}
protocol C : A, B {
    func doC()
}

//프로토콜 C를 구현하는 클래스나 구조체 등의 객체들은 A, B, C의 명세를 모두 구현해야 함
class ABC: C {
    func doA() {
    }
    func doB() {
    }
    func doC() {
    }
}

//정의된 클래스 ABC는 다음과 같은 프로토콜을 타입으로 갖는 상수/변수에 할당될 수 있음. 선언된 타입에 따라서 사용할 수 있는 메소드의 범위 제한
let abc: C = ABC()
//사용할 수 있는 메소드 : abc.doA(), abc.doB(), abc.doC()
let a: A = ABC()
//사용할 수 있는 메소드 : a.doA()
let ab: A & B = ABC()
//사용할 수 있는 메소드 : ab.doA(), ab.doB()
let abc2: A & B & C = ABC()
//사용할 수 있는 메소드 : abc2.doA(), abc2.doB(), abc3.doC()

//프로토콜 C는 상위 프로토콜인 A,B의 기능들은 고스란히 가지고 있음 따라서 상위 프로토콜 타입으로 선언된 변수/상수나 함수의 인자값으로 사용될 수 있음.
func foo(abc: C) { }
foo(abc: ABC())

func boo(abc: A & B) { }
boo(abc: ABC())

//실제로 할당된 인스턴스가 주어진 비교 대상 조건을 모두 만족
abc is C
abc is A & B
abc is A
abc is B
a is C
a is B
ab is C
abc2 is A & B & C

//as 연산자 사용법
protocol Machine {
    func join()
}

protocol Wheel: Machine{
    func lotate()
    
    init(name: String, currentSpeed: Double)
}

class Vehicle {
    var currentSpeed = 0.0
    var name = ""
    
    init(name: String, currentSpeed: Double) {
        self.name = name
        self.currentSpeed = currentSpeed
    }
}

//Car 클래스 : Vehicle, Wheel, Machine을 모두 상속받거나 구현 -> 각 타입으로 캐스팅 모두 가능
class Car: Vehicle, Wheel {
    required override init(name: String, currentSpeed: Double = 0.0) {
        super.init(name: name, currentSpeed: currentSpeed)
    }
    
    func join() {
        //join parts
    }
    func lotate() {
        print("\(self.name)의 바퀴가 회전합니다.")
    }
}

//Carpet클래스 : Vehicle, Machine을 상속받고 구현
class Carpet: Vehicle, Machine {
    func join() {
        //join parts
    }
}

var translist = [Vehicle]()
translist.append(Car(name: "자동차", currentSpeed: 10.0))
translist.append(Carpet(name: "양탄자", currentSpeed: 15.0))

for trans in translist {
    if let obj = trans as? Wheel {
        obj.lotate()
    } else {
        print("\(trans.name)의 하위 타입 변환이 실패했습니다.")
    }
}


//클래스 전용 프로토콜 : 때로는 클래스만 구현할 수 있도록 제한된 프로토콜을 정의해야 함
protocol SomeClassOnlyProtocol: class, Wheel, Machine {
    
}


//optional 키워드
@objc
protocol MsgDelegate {
    @objc optional func onReceive(new:Int)
}

class MsgCenter {
    var delegate: MsgDelegate?
    var newMsg: Int = 0
    
    func msgCheck() {
        if newMsg > 0 {
            self.delegate?.onReceive?(new: self.newMsg)
            self.newMsg = 0
        }
    }
}

class Watch: MsgDelegate {
    var msgCenter: MsgCenter?
    
    init(msgCenter: MsgCenter) {
        self.msgCenter = msgCenter
    }
    func onReceive(new: Int) {
        print("\(new) 건의 메시지가 도착했습니다.")
    }
}
