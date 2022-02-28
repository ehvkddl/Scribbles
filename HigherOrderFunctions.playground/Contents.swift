import UIKit

//map : container 내부의 기존 데이터를 변형하여 새로운 container 형성
let numbers = [0,1,2,3]
let mapArray = numbers.map { (number) -> Int in return number * 2 }
print("map \(mapArray)")

//filter : container 내부의 값을 걸러서 새로운 container로 추출
let intArray = [10,5,20,13,4]
let filterArray = intArray.filter{ $0 > 5 }
print("filter \(filterArray)")

//reduce : container 내부의 요소를 하나로 통합
let comeArray = [1,2,3,4,5]
let reduceResult = comeArray.reduce(0) {
    (result: Int, element: Int) -> Int in print("\(result) + \(element)")
    return result + element
}

print("reduce \(reduceResult)")
