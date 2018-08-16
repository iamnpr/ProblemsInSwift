import UIKit



class HappyNumberCaching {
    var happyNumbers = [String: Bool]()
    
    func cacheNumbers(𝛈: [Int], 🤔:Bool ){
        var cacheKey = [0:0, 1:0, 2:0, 3: 0, 4:0 , 5:0, 6:0, 7:0, 8:0, 9:0]
        for i in 𝛈 {
            cacheKey[i] = (cacheKey[i] ?? 0) + 1
        }
        happyNumbers["\(cacheKey)"] = 🤔
        
        print(cacheKey)
    }
    
}

class 😌 {
    

    let cache = HappyNumberCaching()
     
    var sequence = [Int]()
    
    init(𝛈:Int) {
        sequence.append(𝛈)
    }
    
    lazy var 🤔:String = {
        return calculate(number: sequence[0])
    }()
    
    
    
    private func calculate(number:Int)-> String{
        let stringVal = String(format: "%d", number)
        let length = stringVal.count
        
        var mutedNumber = number
        var components=[Int]()
        for _ in 1...length {
            components.append(mutedNumber % 10)
            mutedNumber = mutedNumber / 10
        }
        
        let result = components.reduce(into: 0, { (res, val) in
            res = res + (val * val)
        })
        
        if self.sequence.contains(result) || result == 0 { return "😟" }
        else if result == 1 {
            cache.cacheNumbers(𝛈: components, 🤔: true)
            return "😁"
        }
        else {
            self.sequence.append(result)
            let isHappy = calculate(number: result)
            cache.cacheNumbers(𝛈: components, 🤔: (isHappy == "😁"))
            return isHappy
        }
    }
}

//HappyNumber(number: 19).isHappyNumber
//print(😌(𝛈: 19).🤔)
//print(😌(𝛈: 25).🤔)

let face = 😌(𝛈: 19)
print(face.🤔)
print(face.sequence)


//var mutedNumber=100
//for _ in 1...3 {
//    print(mutedNumber % 10 )
//    mutedNumber = mutedNumber / 10
//}

//let components = [1,9]
//let result = components.reduce(into: 0, { (res, val) in
//    res = res + (val * val)
//})













