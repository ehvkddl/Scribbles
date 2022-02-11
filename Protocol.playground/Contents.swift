//프로토콜 프로퍼티
protocol SomePropertyProtocol {
    var name: String { get set }
    var description: String { get }
}

struct RubyMember: SomePropertyProtocol {
    var name = "홍길동"
    var description: String {
        return "Name : \(self.name)"
    }
}


//프로토콜 메소드
protocol SomeMethodProtocol {
    func execute(cmd: String)
    func showPort(p: Int) -> String
}

struct RubyService: SomeMethodProtocol {
    func execute(cmd: String) {
        if cmd == "start" {
            print("실행합니다")
        }
    }
    
    func showPort(p: Int) -> String {
        return "Port : \(p)"
    }
}

//외부 매개변수명이 포함된 프로토콜 메소드
protocol NewMethodProtocol {
    mutating func execute(cmd command: String, desc: String)
    func showPort(p: Int, memo desc: String) -> String
}

struct RubyNewService: NewMethodProtocol {
    func execute(cmd command: String, desc: String) {
        if command == "start" {
            print("\(desc)를 실행합니다")
        }
    }
    
    func showPort(p: Int, memo desc: String) -> String {
        return "Port : \(p), Memo : \(desc)"
    }
}


//프로토콜에서의 mutating
protocol MService {
    mutating func execute(cmd: String)
    func showPort(p: Int) -> String
}

//구조체
struct RubyMService: MService {
    var paramCommand: String?
    
    mutating func execute(cmd: String) {
        self.paramCommand = cmd
        if cmd == "start" {
            print("실행합니다")
        }
    }
    
    func showPort(p: Int) -> String {
        return "Port : \(p), now command : \(self.paramCommand!)"
    }
}

struct RubyMService2: MService {
    var paramCommand: String?
    
    func execute(cmd: String) { //프로토콜 쪽에서 mutating 키워드가 추가되어 있어도 실제 구현 하는 쪽에서 프로퍼티의 변경이 없다면 mutating을 붙이지 않아도 오류가 나지 않음
        if cmd == "start" {
            print("실행합니다")
        }
    }
    
    func showPort(p: Int) -> String {
        return "Port : \(p), now command : \(self.paramCommand!)"
    }
}

//클래스
class RubyThread: MService {
    var paramCommand: String?
    
    func execute(cmd: String) {
        self.paramCommand = cmd
        
        if cmd == "start" {
            print("실행합니다")
        }
    }
    
    func showPort(p: Int) -> String {
        return "Port : \(p), now command : \(self.paramCommand!)"
    }
}


//프로토콜에서의 static
protocol SomeTypeProperty {
    static var defaultValue: String { get set }
    static func getDefaultValue() -> String
}

struct TypeStruct: SomeTypeProperty {
    static var defaultValue = "default"
    
    static func getDefaultValue() -> String {
        return defaultValue
    }
}

class ValueObject: SomeTypeProperty {
    static var defaultValue = "default"
    
    class func getDefaultValue() -> String {
        return defaultValue
    }
}


//프로토콜과 초기화 메소드
protocol SomeInitProtocol {
    init()
    init(cmd: String)
}
//구조체
struct SInit: SomeInitProtocol {
    var cmd: String
    
    init() {
        self.cmd = "start"
    }
    init(cmd: String) {
        self.cmd = cmd
    }
}
//클래스
class CInit: SomeInitProtocol {
    var cmd: String
    
    required init() {
        self.cmd = "start"
    }
    
    required init(cmd: String) {
        self.cmd = cmd
    }
}


//상속과 프로토콜
protocol Init {
    init()
    func getValue() //일반 메소드
}

class Parent {
    init() {
    }
    func getValue() {
    }
}

class Child: Parent, Init {
    override required init() { //상속을 통해 초기화 메소드를 물려받았어도 구현해야 할 프로토콜 명세에 동일한 초기화 메소드가 선언되어 있다면 이를 다시 구현
    } //클래스가 초기화 구문을 구현하기 위해서 required 키워드 필요, Parent에서 상속받은 init 메소드가 Child에서 재정의되었으므로 override 키워드 필요
    override func getValue() { //required 키워드는 초기화 메소드에만 붙는다
    }
}


//두 개 이상의 프로토콜 구현하는 구조체
struct MultiImplement: NewMethodProtocol, SomeInitProtocol {
    var cmd: String
    
    init() {
        self.cmd = "default"
    }
    
    init(cmd: String) {
        self.cmd = cmd
    }
    
    mutating func execute(cmd: String, desc: String) {
        self.cmd = cmd
        if cmd == "start" {
            print("시작합니다")
        }
    }
    
    func showPort(p: Int, memo desc: String) -> String {
        return "Port : \(p), Memo : \(desc)"
    }
}

//두 개 이상의 프로토콜을 구현하는 클래스
class BaseObject {
    var name: String = "홍길동"
}

class MultiImplWithInherit: BaseObject, SomeMethodProtocol, SomeInitProtocol {
    var cmd: String
    
    override required init() {
        self.cmd = "default"
    }
    
    required init(cmd: String) {
        self.cmd = cmd
    }
    
    func execute(cmd: String) {
        self.cmd = cmd
        if cmd == "start" {
            print("시작합니다")
        }
    }
    
    func showPort(p: Int) -> String {
        return "Port : \(p)"
    }

}



//타입으로서의 프로토콜
//프로토콜 타입으로 정의된 변수나 상수에 할당된 객체는 프로토콜 이외에 구현체에서 추가한 프로퍼티나 메소드들을 컴파일러로부터 은닉해줌
protocol Wheel {
    func spin()
    func hold()
}

class Bicycle: Wheel {
    var moveState = false
    
    func spin() {
        self.pedal()
    }
    func hold() {
        self.pullBreak()
    }
    func pedal() {
        self.moveState = true
    }
    func pullBreak() {
        self.moveState = false
    }
}

let trans = Bicycle() //초기화된 객체를 대입한 상수 trans는 타입 추론에 의하여 Bicycle 타입으로 결정
//상수 trans가 사용할 수 있는 프로퍼티나 메소드
trans.moveState
trans.pedal()
trans.pullBreak()
trans.spin()
trans.hold()

let trans2: Wheel = Bicycle() //Bicycle 클래스는 Wheel 프로토콜을 구현하고 있으므로 타입 어노테이션에 프로토콜 타입을 사용하여 Wheel 타입 상수에 할당 가능
trans2.spin()
trans2.hold()
//trans2.moveState -> 오류!! trans2는 Bicycle 클래스의 인스턴스이지만, 컴파일러가 trans2 상수의 타입을 Wheel 프로토콜로 읽어 들여서 나머지 메소드들은 은닉되어 사용 불가능


//두 프로토콜에서 제공하는 프로퍼티나 메소드, 초기화 구문들을 사용해야 할 때
protocol A {
    func doA()
}
protocol B {
    func doB()
}
class Impl: A, B {
    func doA() {
    }
    func doB() {
    }
    func desc() -> String {
        return "Class instance method"
    }
}

var ipl: A & B = Impl()
ipl.doA()
ipl.doB()
