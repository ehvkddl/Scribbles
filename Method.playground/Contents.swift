//인스턴스 메소드
struct Resolution {
    var width = 0
    var height = 0
    
    func desc() -> String {
        let desc = "이 해상도는 가로 \(self.width) X \(self.height)로 구성됩니다."
        return desc
    }
    func judge() -> Bool {
        let width = 30
        return self.width == width
    }
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
    
    func desc() -> String {
        if self.name != nil {
            let desc = "이 \(self.name!) 비디오 모드는 \(self.frameRate)의 프레임 비율로 표시됩니다."
            return desc
        } else {
            let desc = "이 비디오 모드는 \(self.frameRate)의 프레임 비율로 표시됩니다."
            return desc
        }
    }
}

class Counter {
    var count = 0
    
    func increment() {
        self.count += 1
    }
    func incrementBy(amount: Int) {
        self.count += amount
    }
    func reset() {
        self.count = 0
    }
}
let counter = Counter() //Counter클래스의 인스턴스 생성
counter.increment() //카운터 값 1 증가
counter.incrementBy(amount: 5) //카운터 값 5만큼 증가
counter.reset() //카운터 값 초기화


//mutating - 구조체나 열거형의 인스턴스 메소드 내부에서 프로퍼티의 값을 수정할 때에는 반드시 메소드의 앞에 mutating키워드를 붙여야 함
struct Point {
    var x = 0.0, y = 0.0
    mutating func moveByX(x deltaX: Double, y deltaY: Double) {
        self.x += deltaX
        self.y += deltaY
    }
}
var point = Point(x: 10.5, y: 12.0)
point.moveByX(x: 3.0, y: 4.5)
print("이제 새로운 좌표는 (\(point.x), \(point.y))입니다")

//클래스의 인스턴스 메소드에서는 프로퍼티를 수정할 때 별도의 키워드를 필요로 하지 않음
class Location {
    var x = 0.0, y = 0.0
    func moveByX(x deltaX: Double, y deltaY: Double) {
        self.x += deltaX
        self.y += deltaY
    }
}
var loc = Location()
loc.x = 10.5
loc.y = 12.0
loc.moveByX(x: 3.0, y: 4.5)

print("이제 새로운 좌표는 (\(loc.x), \(loc.y))입니다")


//타입 메소드
class Foo {
    class func fooTypeMethod() {
        print("Type Method")
    }
}
let f = Foo()
//f.fooTypeMethod() //타입 메소드는 인스턴스에 대해 호출하는 것이 아닌 !!객체 자체!!에 대해서 호출해야함
Foo.fooTypeMethod()
