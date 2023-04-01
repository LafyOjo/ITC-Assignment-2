import UIKit

var greeting = "Hello, playground"

protocol VehicleAction {
    
    //Blueprint of methods
    func drive()
    func stopDriving()
    func changeFuelAtStation(topUpRate:Float)
}

extension VehicleAction {
    func wiggle() {
        print("We are wiggling")
    }
}

protocol VehicleInformation {
    
    // Blueprint of property
    var model: String { get set }
    var numOfDoors: Int { get set }
    var type: String { get set }
    var numOfWheel: Int { get set }
    var price: Double { get set }
    var fuel: Float { get set }
    var dimensions: (length: Float, width: Float, height: Float) { get set }
    var extraProperties: [String: String] { get set }
    
    
    // Blueprint of methods
    func getNumOfDoors() -> Int
    func getModel() -> String
    func getType() -> String
    func getNumOfWheel() -> Int
    func getPrice() -> Double
    func getFuel() -> Float
    func setNumOfDoors(num: Int)
    func setModel(name: String)
    func setType(type: String)
    func setNumOfWheel(num: Int)
    func setPrice(price: Double)
    func setFuel(oil: Float)
}

class Car: VehicleAction, VehicleInformation {
    
    var driveTimer: DispatchSourceTimer?
    
    func getNumOfDoors() -> Int {
        return self.numOfDoors
    }
    
    func getModel() -> String {
        return self.model
    }
    
    func getType() -> String {
        return self.type
    }
    
    func getNumOfWheel() -> Int{
        return self.numOfWheel
    }
    
    func getPrice() -> Double {
        return self.price
    }
    
    func getFuel() -> Float {
        return self.fuel
    }
    
    func setNumOfDoors(num: Int) {
        self.numOfDoors = num
    }
    
    func setModel(mode: String) {
        self.model = mode
    }
    
    func setType(type: String) {
        self.type = type
    }
    
    func setNumOfWheel(num: Int) {
        self.numOfWheel = num
    }
    
    func setPrice(price: Double) {
        self.price = price
    }
    
    func setFuel(oil: Float) {
        self.fuel = oil
    }
    
    func setModel(name:String) {
        self.model = name
    }
    
    func setType(tn:String) {
        self.type = tn
    }
    
    func setNumOfWheel(wheel:Int) {
        self.numOfWheel = wheel
    }
    
    func setPrice(pay:Double) {
        self.price = pay
    }
    
    
    
    public var numOfDoors: Int
    public var model: String
    public var type: String
    public var numOfWheel: Int
    public var price: Double
    public var fuel: Float
    public var dimensions: (length: Float, width: Float, height: Float)
    public var extraProperties: [String : String]
    
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
    
    
    
    func drive() {
        print("We are going for a drive now, the fuel is at: \(self.fuel)")
        driveTimer?.cancel() //cancel any existing timer
        driveTimer = DispatchSource.makeTimerSource(queue: DispatchQueue.global())
        
        driveTimer?.schedule(deadline: .now(), repeating: .seconds(1))
        
        driveTimer?.setEventHandler{ [weak self] in
            guard let self = self else { return }
            self.fuel -= 2.442121328132813
            
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
    
    public func changeFuelAtStation(topUpRate:Float) {
        self.fuel = self.getFuel() + topUpRate
    }
    
    public func wiggle() {
        Swift.print("We are wiggling")
    }
    
}
    class ElectricCar: Car {
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
    
    let car = Car(numOfDoors: 4, model: "Model X", type: "Sedan", numOfWheel: 4, price: 40000, fuel: 100, dimensions: (length: 200, width: 80, height: 60), extraProperties: ["color": "blue", "interior": "leather"]);
    
    let electricCar = ElectricCar(numOfDoors: 4, model: "Model S", type: "Sedan", numOfWheel: 4, price: 60000, batteryCapacity: 100, dimensions: (length: 210, width: 85, height: 65), extraProperties: ["color": "red", "interior": "vegan leather"]);
    
    car.drive();
    print(electricCar.extraProperties["color"])

enum RaceTypes {

    case Drift
    case Drag
    case Street
    case HyperCar
    case OffRoad
    case MotorCross
    case Rally
}

enum RaceTyping: String, CaseIterable {

    case Drift = "A highly interactive sport where cars slide"
    case Drag = "A straight line race between multiple cars"
    case Street = "A race where cars race head to head on the street"
    case HyperCar = "A series of high-end vehicle racing"
    case OffRoad = "Where cars take the races to the dirt"
    case MotorCross = "Popular races for bikes"
    case Rally = "Popular off-road racing, drifting in the dirt"
}

print("")
print("")

print(RaceTyping.Drag)
print(RaceTyping.HyperCar)
print(RaceTyping.MotorCross.rawValue)

print("")
print("")

print(RaceTyping.allCases)

print("")
print("")

// Printing all RaceTyping cases
for value in RaceTyping.allCases {
    print(value)
}
print("")
print("")

//printing all values in the 'RaceTyping Enum'
for value in RaceTyping.allCases {
    print(value.rawValue)
}

print("")
print("")

enum Transportation {
    case car(make: String, model:String, year:Int)
    case bicycle(brand: String, type: String)
    case bus(routeNumber: Int, destination: String)
    case segway(batteryPower: Int, model: String)
}

// Creating instances of the associated values
let nmyCar = Transportation.car(make: "Bentley", model: "Ortega", year: 2029)
let myBicycle = Transportation.bicycle(brand: "Morgan Ride", type: "Mountain")
let bus = Transportation.bus(routeNumber: 44, destination: "New Hampton")
let segway = Transportation.segway(batteryPower: 40, model: "Helix-Plus")

func TransportationInfo(_ transportation: Transportation) {
    // the underscore is a wildcard
    
    switch transportation {
    case let .car(make, model, year):
        print("Car: make=\(make), model=\(model), year=\(year)")
    case let .bicycle(brand, type):
        print("Bicycle: brand=\(brand), type=\(type)")
    case let .bus(routeNumber, destination):
        print("Bus: routeNumber=\(routeNumber), destination=\(destination)")
    case let .segway(batteryPower, model):
        print("Segway: batteryPower=\(batteryPower), model=\(model)")
    }
}

print("")
print("")

// enum methods
enum Shape {
    case circle(radius: Double)
    case rectangle(width: Double, height: Double)
    case square(side: Double)
    
    func area() -> Double {
        switch self {
        case let .circle(radius):
            return Double.pi * radius *  radius
        case let .rectangle(width, height):
            return width * height
        case let .square(side):
            return side * side
        }
    }
    
    func perimeter() -> Double {
        switch self {
        case let .circle(radius):
            return 2 * Double.pi * radius
        case let .rectangle(width, height):
            return 2 * (width + height)
        case let .square(side):
            return 4 * side
        }
    }
}

let circle = Shape.circle(radius: 12)
let rectangle = Shape.rectangle(width: 20, height: 40)
let square = Shape.square(side: 4)

print("Circle area: \(circle.area())")
print("rectangle area: \(rectangle.area())")
print("Sqaure area: \(square.area())")
print("")
print("")
print("Circle perimeter: \(circle.perimeter())")
print("Rectangle perimeter: \(rectangle.perimeter())")
print("Square perimeter: \(square.perimeter())")
print("")
print("")

//computed properites
enum Shaper {
    case circle(radius: Double)
    case rectangle(width: Double, height: Double)
    case square(side: Double)
    
    var area: Double {
        switch self {
        case let .circle(radius):
            return Double.pi * radius *  radius
        case let .rectangle(width, height):
            return width * height
        case let .square(side):
            return side * side
        }
    }
    
    var perimeter: Double {
        switch self {
        case let .circle(radius):
            return 2 * Double.pi * radius
        case let .rectangle(width, height):
            return 2 * (width + height)
        case let .square(side):
            return 4 * side
        }
    }
}

let circled = Shaper.circle(radius: 12)
let rectangled = Shaper.rectangle(width: 20, height: 40)
let squared = Shaper.square(side: 4)

print("Circle area: \(circled.area)")
print("rectangle area: \(rectangled.area)")
print("Sqaure area: \(squared.area)")
print("")
print("")
print("Circle perimeter: \(circled.perimeter)")
print("Rectangle perimeter: \(rectangled.perimeter)")
print("Square perimeter: \(squared.perimeter)")
print("")
print("")
