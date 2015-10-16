// pre document-like look doporučujem zapnúť markup (menu Editor -> Show Rendered Markup)

/*:
# Swift 2.0 prišiel s vylepšením pre 'error handling'.
*/

//: 1. zadefinuj custom error type (enum)
enum ConvertStringToIntError: ErrorType {
    case InvalidArgument(String)
}

//: 2. implementuj func s _throws_.
//: Poznámka: všimni si tu použitie '_defer_' a '_guard let_'

func convertStringToInt(input: String) throws -> Int {
    defer {
        print("defer block is executed always when error is thrown")
    }
    
    guard let retVal = Int(input) else {
        throw ConvertStringToIntError.InvalidArgument("\(input) is not an integer representation")
    }
    return retVal
}

//: 3. volaj func v _do - catch_ bloku s kľúčovým slovom _try_
do {
    let val = try convertStringToInt("abc")
} catch let error {
    print(error)
}
