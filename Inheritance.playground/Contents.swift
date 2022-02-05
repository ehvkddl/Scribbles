class A {
    var name = "class A"
    
    var description: String {
        return "This class name is \(self.name)"
    }
    func foo() {
        print("\(self.name)'s method foo is called")
    }
}

let a = A()

a.name
a.description
a.foo()

class B: A {
    var prop = "Class B"
    
    func boo() -> String {
        return "Class B prop = \(self.prop)"
    }
}

let b = B()
b.prop
b.boo()
b.name
b.foo()

b.name = "Class C"
b.foo()

class Vehicle {
    var currentSpeed = 0.0
    
    var description: String {
        return "시간당 \(self.currentSpeed)의 속도로 이동하고 있습니다"
    }
    
    func makeNoise() {
        
    }
}

let baseVehicle = Vehicle()
baseVehicle.description

class Bicycle:Vehicle {
    var hasBasket = false
}
