enum Direction {
    case north
    case south
    case east, west
}

let N = Direction.north
let S = Direction.south
let E = Direction.east
let W = Direction.west

//열거형 이용하여 변수 정의
var directionToHead = Direction.west
//타입 어노테이션 사용하여 열거형 변수 정의
var directionToHead2: Direction = Direction.west

//변수의 값 변경 (이미 변수가 열거형으로 정의되고 난 뒤)
//directionToHead 변수가 Direction 타입으로 정의되어있다는 것을 컴파일러가 알고 있음
directionToHead = .east

//타입 어노테이션을 사용하는 경우에는 변수의 선언 부분
var directionToHead3: Direction = .east


//switch 구문과 열거형
var directionToHead4 = Direction.west

switch directionToHead4 {
case Direction.north :
    print("북쪽입니다")
case Direction.south :
    print("남쪽입니다")
case Direction.east :
    print("동쪽입니다")
case Direction.west :
    print("서쪽입니다")
}

//타입명 생략하여 간소화
switch directionToHead4 {
case .north :
    print("북쪽입니다")
case .south :
    print("남쪽입니다")
case .east :
    print("동쪽입니다")
case .west :
    print("서쪽입니다")
}



//멤버와 값의 분리
enum HTTPCode: Int {
    case OK = 200
    case NOT_MODIFY = 304
    case INCORRECT_PAGE = 404
    case SERVER_ERROR = 500
    
    //연산 프로퍼티
    var value: String {
        return "HTTPCode number is \(self.rawValue)"
    }
    
    //연산 메소드
    func getDescription() -> String {
        switch self {
        case .OK :
            return "응답이 성공했습니다. HTTP코드는 \(self.rawValue)입니다."
        case .NOT_MODIFY :
            return "변경된 내역이 없습니다. HTTP코드는 \(self.rawValue)입니다."
        case .INCORRECT_PAGE :
            return "존재하지 않는 페이지입니다. HTTP 코드는 \(self.rawValue)입니다."
        case .SERVER_ERROR :
            return "서버 오류입니다. HTTP 코드는 \(self.rawValue)입니다."
        }
    }
    
    //타입 메소드
    static func getName() -> String {
        return "This Enumeration is HTTPCode"
    }
}

HTTPCode.OK.rawValue
HTTPCode.NOT_MODIFY.rawValue
HTTPCode.INCORRECT_PAGE.rawValue
HTTPCode.SERVER_ERROR.rawValue

//스위프트는 문자열, 정수, 실수 기타 다른 자료형까지 모두 멤버에 할당하여 사용할 수 있음
//자동 할당 기능도 지원함
enum Rank: Int {
    case one = 1
    case two, three, four, five
}

Rank.one.rawValue
Rank.two.rawValue
Rank.three.rawValue
Rank.four.rawValue
Rank.five.rawValue

//연관 값 : 사용하는 시점에서 멤버에 보조 값을 설정
enum ImageFormat {
    case JPEG
    case PNG(Bool) //투명한 PNG/불투명 PNG
    case GIF(Int, Bool) //사용된 컬러수, 애니메이션 여부
}

var newImage = ImageFormat.PNG(true)
newImage = .GIF(256, false)


//열거형은 클래스나 구조체처럼 내부에 연산 프로퍼티와 메소드를 정의할 수 있음
var response = HTTPCode.OK
response = .NOT_MODIFY

print(response.value)
print(response.getDescription())

print(HTTPCode.getName()) //getName()은 타입 메소드이므로 열거형 타입 자체에서 호출
