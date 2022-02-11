import UIKit
//Extension : 이미 존재하는 클래스나 구조체, 열거형 등의 객체에 새로운 기능을 추가하여 확장해주는 구문

//익스텐션과 연산 프로퍼티
extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var description : String {
        return "\(self)km는 \(self.km)m, \(self)cm는 \(self.cm)m, \(self)mm는 \(self.mm)m입니다."
    }
}

print(2.km)
print(5.5.cm)
print(125.mm)
print(7.0.description)

let distance = 42.0.km + 195.m
print("마라톤의 총 거리는 \(distance)m입니다.")


//익스텐션과 메소드
extension Int {
    func repeatRun(task: () -> Void) {
        for _ in 0 ..< self {
            task()
        }
    }
}
let d = 3
d.repeatRun(task: {
    print("반갑습니다!")
})
//트레일링 클로저 사용
d.repeatRun {
    print("closure: 반갑습니다!")
}

extension Int {
    mutating func square() {
        self = self * self
    }
}

var value = 3
value.square()


//익스텐션을 활용한 코드 정리
//익스텐션으로 정의한 메소드는 원래의 객체에 추가되지만, 점프바에서 기존의 클래스 정의와 구분되어 별도의 그룹으로 표시됨

//public class DataSync {
//    public func save(_ value: Any, forKey: String) { ... }
//    public func load(_ key: String) -> Any { ... }
//    public func remove(_ key: String) { ... }
//}
//extension DataSync {
//    public func stringToDate(_ value: String) -> Date { ... }
//    public func dateToString(_ value: Date) -> String { }
//}
