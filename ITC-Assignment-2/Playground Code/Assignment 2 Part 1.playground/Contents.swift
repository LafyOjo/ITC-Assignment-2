import UIKit

var greeting = "Hello, playground"

public class Car {
    private var numOfDoors:Int
    private var model:String
    private var type:String // i.e Saloon, Sedan
    private var numOfWheel:Int
    private var price:Double
    private var fuel:Float
    private var driveTimer: DispatchSourceTimer?
    
    // Tuple for car dimensions (length, width, height)
    public var dimensions: (length: Float, width: Float, height: Float)
    
    // Dictionary for extra properties
    public var extraProperties: [String: String]
    
    init(numOfDoors:Int, model:String, type:String, numOfWheel:Int, price:Double, fuel:Float, dimensions: (length: Float, width: Float, height: Float), extraProperties: [String: String] = [:]) {
        self.numOfDoors = numOfDoors
        self.model = model
        self.type = type
        self.numOfWheel = numOfWheel
        self.price = price
        self.fuel = fuel
        self.dimensions = dimensions
        self.extraProperties = extraProperties
    }
    
    public func getNumOfDoors() -> Int {
        return self.numOfDoors
    }
    
    public func getModel() -> String {
        return self.model
    }
    
    public func getType() -> String {
        return self.type
    }
    
    public func getNumOfWheel() -> Int {
        return self.numOfWheel
    }
    
    public func getPrice() -> Double {
        return self.price
    }
    
    public func getFuel() -> Float {
        return self.fuel
    }
    
    public func setNumOfDoors(num:Int) {
        self.numOfDoors = num
    }
    
    public func setModel(mod:String) {
        self.model = mod
    }
    
    public func setType(tn:String) {
        self.type = tn
    }
    
    public func setNumOfWheel(wheel:Int) {
        self.numOfWheel = wheel
    }
    
    public func setPrice(pay:Double) {
        self.price = pay
    }
    
    public func setFuel(oil:Float) {
        self.fuel = oil
    }
    
    public func drive() {
        print("We are going for a drive now, the fuel is at: \(self.fuel)")
        driveTimer?.cancel() //cancel any existing timer
        driveTimer = DispatchSource.makeTimerSource(queue: DispatchQueue.global())
        
        driveTimer?.schedule(deadline: .now(), repeating: .seconds(1))
        
        driveTimer?.setEventHandler{ [weak self] in
            guard let self = self else { return }
            self.fuel -= 0.3
            
            DispatchQueue.main.async {
                print("Current fuel status: \(self.fuel)")
            }
            
            if self.fuel <= 0 {
                self.driveTimer?.cancel()
                self.fuel = 0
                print("Out of fuel")
            }
        }
        driveTimer?.resume()
    }
    
    public func stopDriving() {
        driveTimer?.cancel()
        driveTimer = nil
    }
}

public class ElectricCar: Car {
    private var batteryCapacity: Float
    
    init(numOfDoors: Int, model: String, type: String, numOfWheel: Int, price: Double, batteryCapacity: Float, dimensions: (length: Float, width: Float, height: Float), extraProperties: [String : String] = [:]) {
        self.batteryCapacity = batteryCapacity
        super.init(numOfDoors: numOfDoors, model: model, type: type, numOfWheel: numOfWheel, price: price, fuel: 0, dimensions: dimensions, extraProperties: extraProperties)
    }
    
    public func getBatteryCapacity() -> Float {
        return self.batteryCapacity
    }
    
    public func setBatteryCapacity(capacity: Float) {
        self.batteryCapacity = capacity
    }
}

let car = Car(numOfDoors: 4, model: "Model X", type: "Sedan", numOfWheel: 4, price: 40000, fuel: 100, dimensions: (length: 200, width: 80, height: 60), extraProperties: ["color": "blue", "interior": "leather"])

let electricCar = ElectricCar(numOfDoors: 4, model: "Model S", type: "Sedan", numOfWheel: 4, price: 60000, batteryCapacity: 100, dimensions: (length: 210, width: 85, height: 65), extraProperties: ["color": "red", "interior": "vegan leather"])

car.drive()
