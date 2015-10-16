// pre document-like look doporučujem zapnúť markup (menu Editor -> Show Rendered Markup)

/*: 
# _map()_
## Trieda Array obsahuje okrem iného aj _map()_ funkciu:
- má jeden argument _'transform'_ typu *(T) -> T* (argument je closure)
- vracia pole [T]
- *map<T>(transform: (T)->T) -> [T]*
- transformuje pole na iné pole podľa 'predpisu', ktorý je definovaný v closure, predpis sa aplikuje na každý prvok poľa
- je to tzv. ['higher-order function'](https://en.wikipedia.org/wiki/Higher-order_function)
*/

//: príklad konverzie [Int] na [String] 
let stringNumbers = [1, 2, 3, 4, 5, 6, 7].map{ "\($0)" }
stringNumbers
//: alebo menej 'swifty' zápis:
[1, 2, 3, 4, 5, 6, 7].map({ num in "\(num)" })
//: a iný 'matematický' príklad
let square = [1, 2, 3, 4, 5, 6, 7].map{ $0 * $0 }
square
