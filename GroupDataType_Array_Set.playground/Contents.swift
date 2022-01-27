var cities = ["Seoul", "New York", "LA", "Santiago"]
let length = cities.count

for i in 0..<length {
    print("\(i)번째 배열 원소는 \(cities[i])입니다")
}

for row in cities {
    print("배열 원소는 \(row)입니다")
}

for row in cities {
    let index = cities.firstIndex(of: row)
    print("\(index!)번째 배열 원소는 \(row)입니다")
}

var list = [String]()

if list.isEmpty {
    print("배열이 비어 있는 상태입니다")
} else {
    print("배열에는 \(list.count)개의 아이템이 저장되어 있습니다")
}

var cities2 = [String]()

cities2.append("Seoul")
cities2.append("New York")
cities2.insert("Tokyo", at:  1)
cities2.append(contentsOf: ["Dubai", "Sydney"])

cities2[2] = "Madrid"
print(cities2)

var cities3 = Array(repeating: "None", count: 3)
print(cities3)

var alphabet = ["a", "b", "c", "d", "e"]

print(alphabet[0...2])
print(alphabet[2...3])
print(alphabet[1..<3])

alphabet[1...2] = ["1", "2", "3"]
print(alphabet)
alphabet[2...4] = ["A"]
print(alphabet)

var genres : Set = ["Classsic", "Rock", "Balad"]

var genres2 : Set<String> = ["Classsic", "Rock", "Balad"]

var genres3 = Set<String>()
genres3.insert("Classic")
genres3.insert("Rock")
genres3.insert("Balad")
print(genres3)

if genres3.isEmpty {
    print("집합이 비어있습니다")
} else {
    print("집합에는 현재 \(genres3.count)개의 아이템이 저장되어 있습니다")
}

for g in genres.sorted() {
    print("\(g)")
}

if let removedItem = genres.remove("Rock") {
    print("아이템 \(removedItem)의 삭제가 완료되었습니다")
} else {
    print("삭제할 값이 집합에 추가되어 있지 않습니다")
}

genres.removeAll()
if genres.isEmpty {
    print("모든 아이템이 삭제되었습니다")
} else {
    print("아직 \(genres.count)개의 아이템이 남아있습니다")
}

var genres4 : Set = ["Classic", "Rock", "Balad"]
if genres4.contains("Rock") {
    print("Rock 아이템이 저장되어 있습니다.")
} else {
    print("Rock 아이템이 저장되어 있지 않습니다.")
}

var oddDigits : Set = [1,3,5,7,9]
let evenDigits : Set = [0,2,4,6,8]
let primeDigits : Set = [2,3,5,7]

print(oddDigits.intersection(evenDigits).sorted())
print(oddDigits.symmetricDifference(primeDigits).sorted())
print(oddDigits.union(evenDigits).sorted())

print(oddDigits.subtract(primeDigits))
print(oddDigits.sorted())

let A : Set = [1,3,5,7,9]
let B : Set = [3,5]
let C : Set = [3,5]
let D : Set = [2,4,6]

B.isSubset(of: A)
A.isSuperset(of: B)
C.isStrictSubset(of: A)
C.isStrictSubset(of: B)
A.isDisjoint(with: D)

var E = [4,2,5,1,7,4,9,11,3,5,4]

let F = Set(E)
E = Array(F).sorted()
print(E)

