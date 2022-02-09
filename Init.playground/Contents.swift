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
    
    init(interlaced: Bool, frameRate: Double) {
        self.interlaced = interlaced
        self.frameRate
    }
}

let reslution = Resolution(width: 4096)
let videoMode = VideoMode(interlaced: true, frameRate: 40.0)


