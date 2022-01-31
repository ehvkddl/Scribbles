//메소드와 프로퍼티
struct Resolution {
    var width = 0 //저장 프로퍼티 : 특정 값을 저장하기 위해 클래스나 구조체 내부에 정의된 변수나 상수
    var height = 0 //저장 프로퍼티/
    
    func desc() -> String {
        return "Resolution 구조체"
    }
}

class VideoMode {
    var interlaced = false
    var frameRate = 0.0
    var name : String?

    var res = Resolution()
    
    func desc() -> String {
        return "VideoMode 클래스"
    }
}


//인스턴스
let insRes = Resolution()
let insVMode = VideoMode()

let width = insRes.width
print("insRes 인스턴스의 width 값은 \(width)입니다")

let vMode = VideoMode()
print("vMode 인스턴스의 width 값은 \(vMode.res.width)입니다")

if vMode.name != nil {
    print("\(vMode.name!)")
} else {
    print("이름이 없습니다."                                                      )
}

vMode.name = "Sample"
vMode.res.width = 1280

print("\(vMode.name!) 인스턴스의 width 값은 \(vMode.res.width)입니다")


//초기화
let defaultRes = Resolution(width: 1024, height: 768)
print("width:\(defaultRes.width), height:\(defaultRes.height)")


//구조체의 값 전달 방식 : 복사에 의한 전달
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd //hd의 복사본이 만들어진 다음, 이 복사본이 cinema 변수에 대입
//hd와 cinema는 같은 width와 height 값을 가지고 있지만 실제로는 별개의 인스턴스

cinema.width = 2048
print("cinema 인스턴스의 width 값은 \(cinema.width)입니다")
print("hd 인스턴스의 width 값은 \(hd.width)입니다")


//클래스의 값 전달 방식 : 참조에 의한 전달
let video = VideoMode()
video.name = "Original Video Instance"

print("video 인스턴스의 name 값은 \(video.name!)입니다.")

//video인스턴스 변수를 다른 상수에 할당
let dvd = video
dvd.name = "DVD Video Instance"

print("video 인스턴스의 name 값은 \(video.name!)입니다.")
//변경하지 않았던 video 상수의 프로퍼티에서도 값이 변경

//인스턴스의 값을 함수의 인자값으로 넣어 수정
func changeName(v: VideoMode) {
    v.name = "Function Video Instance"
}

changeName(v: video)
print("video 인스턴스의 name 값은 \(video.name!)입니다.")

//클래스 인스턴스 비교 ( 같은 메모리 공간을 참조하는 인스턴스인지 비교)
//VideoMode 클래스의 인스턴스가 생성된 다음 video 상수에 참조, 이 값이 다시 dvd에 참조되었으므로 두 상수는 동일한 클래스 인스턴스를 참조
if (video === dvd) {
    print("video와 dvd는 동일한 VideoMode 인스턴스를 참조하고 있군요.")
} else {
    print("video와 dvd는 서로 다른 VideoMode 인스턴스를 참조하고 있군요.")
}

//ds에 참조 할당된 인스턴스는 vs에 참조 할당된 인스턴스가 아닌 새롭게 생성된 인스턴스 (동일한 타입의 인스턴스이지만 같은 메모리 주소를 참조하는 것은 아님)
let vs = VideoMode()
let ds = VideoMode()

if (vs === ds) {
    print("vs와 ds는 동일한 VideoMode 인스턴스를 참조하고 있습니다.")
} else {
    print("vs와 ds는 서로 다른 VideoMode 인스턴스를 참조하고 있습니다.")
}
