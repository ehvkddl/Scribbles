//init 초기화 메소드
struct Resolution {
    var width = 0
    var height = 0
    
    init(width: Int) {
        self.width = width
    }
}

class VideoMode {
    var resolution = Resolution(width: 2048)
    var interlaced = false
    var frameRate = 0.0
    var name: String?
    
    init(name: String = "") {
        self.name = name
    }
    init(interlaced: Bool) {
        self.interlaced = interlaced
    }
    init(interlaced: Bool, frameRate: Double) {
        self.interlaced = interlaced
        self.frameRate = frameRate
    }
    init(interlaced: Bool, frameRate: Double, name: String) {
        self.interlaced = interlaced
        self.frameRate = frameRate
        self.name = name
    }
}

let reslution = Resolution(width: 4096)
let videoMode = VideoMode(interlaced: true, frameRate: 40.0)

let nameVideoMode = VideoMode(name: "홍길동")
let simpleVideoMode = VideoMode(interlaced: true)
let doubleVideoMode = VideoMode(interlaced: true, frameRate: 40.0)
let tripleVideoMode = VideoMode(interlaced: true, frameRate: 40.0, name: "홍길동")

let defaultVideoMode = VideoMode()


//초기화 구문의 오버라이딩
class Base {
    var baseValue: Double
    
    init() {
        self.baseValue = 0.0
        print("Base Init")
    }
    init(baseValue: Double) {
        self.baseValue = baseValue
    }
}

class ExBase: Base {
    override init() {
        super.init()
        print("ExBase Init")
    }
//    override init(inputValue: Double) {
//        super.init(inputValue: 10.5)
//    }
}

let ex = ExBase()
