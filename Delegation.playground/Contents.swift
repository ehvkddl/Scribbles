protocol FuelPumpDelegate {
    func lackFuel()
    func fullFuel()
}

class FuelPump {
    var maxGage: Double = 100.0
    var delegate: FuelPumpDelegate? = nil
    
    var fuelGage: Double {
        didSet {
            if oldValue < 10 {
                self.delegate?.lackFuel()
            } else if oldValue == self.maxGage {
                self.delegate?.fullFuel()
            }
        }
    }
    
    init(fuelGage: Double = 0) {
        self.fuelGage = fuelGage
    }
    
    func startPump() {
        while (true) {
            if (self.fuelGage > 0) {
                self.jetFuel()
            } else {
                break
            }
        }
    }
    func jetFuel() {
        self.fuelGage -= 1
    }
}

class Car: FuelPumpDelegate {
    var fuelPump = FuelPump(fuelGage: 100)
    
    init() {
        self.fuelPump.delegate = self
    }
    func lackFuel() {
        //연료를 보충한다.
    }
    func fullFuel() {
        //연료 보충을 중단한다.
    }
    func start() {
        fuelPump.startPump()
    }
}
