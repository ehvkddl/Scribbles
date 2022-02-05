class Vehicle {
    var currentSpeed = 0.0
    
    func accelerate() {
        self.currentSpeed += 1
    }
}

class Car: Vehicle {
    var gear: Int {
        return Int(self.currentSpeed / 20) + 1
    }
    func wiper() {
        
    }
}
//Car 클래스로 된 인스턴스를 Vehicle 타입의 상수에 할당
let trans: Vehicle = Car() //Vehicle 클래스 타입에 구현되어 있어야 하는 프로퍼티와 메소드가 상속을 통해 모두 구현되어 있으므로 Car 클래스는 형식상 Vehicle 타입으로 간주할 수 있음

//상위 클래스에 해당하는 클래스들은 모두 타입으로 선언 가능
class SUV: Car {
    var fourWheel = false
}
let jeep: Vehicle = SUV()


func move(param: Vehicle) {
    param.accelerate()
}

//상위 클래스를 아이템 타입으로 사용하면 그 하위 클래스들을 모두 저장할 수 있다
var list = [Vehicle]()

list.append(Vehicle())
list.append(Car())
list.append(SUV())



//타입 비교 연산
//인스턴스(또는 변수, 상수) is 비교대상 타입
SUV() is SUV
SUV() is Car
SUV() is Vehicle

Car() is Vehicle
Car() is SUV

//Vehicle 선언, SUV 할당
let myCar: Vehicle = SUV()

if myCar is SUV {
    print("myCar는 SUV 타입입니다.")
} else {
    print("myCar는 SUV 타입이 아닙니다")
}

//Vehicle 선언, Car 할당
let newCar: Vehicle = Car()

if newCar is SUV {
    print("newCar는 SUV 타입입니다")
} else {
    print("newCar는 SUV 타입이 아닙니다")
}



//타입캐스팅 연산
//up casting
let anyCar: Car = SUV()
let anyVehicle = anyCar as Vehicle

//down casting
//1.옵셔널 캐스팅
let anySUV = anyCar as? SUV
if anySUV != nil {
    print("\(anySUV!) 캐스팅이 성공하였습니다")
}
//한줄로
if let anySUV2 = anyCar as? SUV {
    print("\(anySUV2) 캐스팅이 성공하였습니다")
}

//2.강제 캐스팅
let anySUV3 = anyCar as! SUV
print("\(anySUV3) 캐스팅이 성공하였습니다")



//Any, AnyObject
//모든 클래스의 인스턴스는 AnyOvject 클래스 타입으로 선언된 변수나 상수에 할당 가능
var allCar: AnyObject = Car()
allCar = SUV()

//모든 클래스의 인스턴스는 AnyObject 타입으로 선언된 함수나 메소드의 인자값으로 사용 가능
//AnyObject 타입을 반환하는 함수나 메소드는 모든 종류의 클래스를 반환 가능
var list2 = [AnyObject]()
list2.append(Vehicle())
list2.append(Car())
list2.append(SUV())

//AnyObject 타입으로 선언된 값은 타입 캐스팅을 통해 구체적인 타입으로 변환 가능 (특성상 항상 다운 캐스팅만 수행)
// !!실제로 저장된 인스턴스 타입과 관계 없는 타입으로 캐스팅하고자하면 오류가 발생!!
let obj: AnyObject = SUV()

if let suv = obj as? SUV {
    print("\(suv) 캐스팅이 성공하였습니다")
}

var value: Any = "Sample String"
value = 3
value = false
value = [1,3,5,7,9]
value = {
    print("함수가 실행됩니다")
}

func name(_ param: Any) {
    print("\(param)")
}
name(3)
name(false)
name([1,3,5,7,9])
name {
    print(">>>")
}

var rows = [Any]()
rows.append(3)
rows.append(false)
rows.append([1,3,5,7,9])
rows.append {
    print(">>>")
}
print(rows)
