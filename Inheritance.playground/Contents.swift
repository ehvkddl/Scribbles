//기본 클래스 = 슈퍼 클래스 = 상위 클래스
class A {
    var name = "Class A"
    
    var description: String {
        return "This class name is \(self.name)"
    }
    
    func foo() {
        print("\(self.name)'s method foo is called")
    }
}

let a = A()

a.name //Class A
a.description //This class name is Class A
a.foo()


//subclassing
//파생 클래스 = 서브 클래스 = 하위 클래스
class B: A {
    var prop = "Class B"
    
    func boo() -> String {
        return "Class B prop = \(self.prop)"
    }
}

let b = B()
b.prop //Class B
b.boo() //Class B prop = Class B

b.name //Class A
b.foo() //Class A's method foo is called

b.name = "Class C"
b.foo() //Class C's method foo is called


//'탈 것'에 대한 기본 클래스
class Vehicle {
    var currentSpeed = 0.0
    
    var description: String {
        return "시간당 \(self.currentSpeed)의 속도로 이동하고 있습니다"
    }
    
    func makeNoise() {
        
    }
}

let baseVehicle = Vehicle()
baseVehicle.description //시간당 0.0의 속도로 이동하고 있습니다

//자전거
class Bicycle: Vehicle {
    var hasBasket = false
}
let bicycle = Bicycle()
bicycle.hasBasket = true

bicycle.currentSpeed = 20.0

print("자전거: \(bicycle.description)")

//2인용 자전거
class Tandem: Bicycle {
    var passengers = 0
}
let tandem = Tandem()

tandem.hasBasket = true
tandem.passengers = 2
tandem.currentSpeed = 14.0

print("Tandem : \(tandem.description)")


//Overriding
//자동차
class Car: Vehicle {
    var gear = 0
    var engineLevel = 0
    
    override var currentSpeed: Double {
        get {
            return Double(self.engineLevel * 50)
        }
        set {
            
        }
    }
    override var description: String {
        get {
            return "Car : engineLevel=\(self.engineLevel), so currentSpeed=\(self.currentSpeed)"
        }
        set {
            print("New Value is \(newValue)")
        }
    }
}

let c = Car()

c.engineLevel = 5
c.currentSpeed
c.description = "New Class Car"

print(c.description)

//프로퍼티 옵저버
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            self.gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

class Bike: Vehicle {
    override func makeNoise() {
        print("빠라빠라빠라밤")
    }
}

let bk = Bike()
bk.makeNoise()


class HybridCar: Car { //오버라이딩된 부모 클래스
    
}
class KickBoard: Vehicle { //오버라이딩되지 않은 부모 클래스
    
}
let h = HybridCar()
print(h.description)

let k = KickBoard()
print(k.description)

