//: Parking Problem

import UIKit

public class Vehicle {
    let size: Int;
    let licence:String;
    
    public init(size: Int, licence: String){
        self.size = size;
        self.licence = licence;
    }
}

public class Spot {
    let name: String;
    let size: Int;
    
    var vehicle: Vehicle? = nil;
    
    public init(name: String, size: Int){
        self.name = name;
        self.size = size;
    }
    
    public func isOccupied() -> Bool{
        return self.vehicle != nil;
    }
}

public enum ParkingError:ErrorTye {
    case spotNotAvailabe;
    case clearenceNotAvailable;
}

public class ParkingGarage {
    var parkingSpots = [Spot]();
    
    public init(){
        for(i in 0...9) {
            parkingSpots.append(Spot(name: "motorcycle\(i)", size: 1));
            parkingSpots.append(Spot(name: "compact\(i)", size: 3));
            parkingSpots.append(Spot(name: "large\(i)", size: 5));
        }
    }
    
    // Try to park a vehicle in the Garage
    // Gives the spot number if the vehicle can be fitted.
    // Throws error if cannot be fit.
    public parkVehicle(vehicle:Vehicle)-> String thorws{
        //Find a spot fitting the size
    if let spot = self.parkingSpots.findFirst(e-> e.size >= vehicle.size && e.isOccupied){
    spot.vehicle = vehicle;
    return spot.name;
    }
    throw ParkingError.spotNotAvailabe;
    
    
    }
    
}
