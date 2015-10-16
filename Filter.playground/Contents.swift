// pre document-like look doporučujem zapnúť markup (menu Editor -> Show Rendered Markup)

/*:
# _filter()_
## Swift Array implementuje _filter()_ funkciu:
- má jeden argument _'includeElement'_ typu *(T) -> Bool* (argument je closure)
- vracia pole [T]
- symbolický zápis: *filter<T>(includeElement: (T)->Bool) -> [T]*
- filtruje pole na iné pole podľa podmienky, ktorá je definovaná v closure, podmienka sa aplikuje na každý prvok poľa
- je to tzv. ['higher-order function'](https://en.wikipedia.org/wiki/Higher-order_function)
*/

//: príklad s filtrom pozitívnych čísiel:
let positiveNumbers = [2, 4, -10, 0, 15, -2].filter{ $0 > 0 }
positiveNumbers

//: ## Demonštrácia použitia na viacerých príkladoch s funkciami

//:### problem: write func which can be passed into filter((Int) -> Bool)

//: 1. simple
func isPositive(value: Int) -> Bool {
    return value > 0
}
[2, 4, -10, 0, 15, -2].filter(isPositive)

//: 2. what if func passed into filter needs two args (isMultiple(value, multiplier))
// - write func returning func
func isMultiple(multiplier: Int) -> (Int -> Bool) {
    func isMultipleRet(value: Int) -> Bool {
        return value % multiplier == 0
    }
    return isMultipleRet
}
[2, -6, 8, 3, 15, 11, 24].filter(isMultiple(2))

//: 3. more compact and swifty solution
// - closure
func isMultiple_closure(multiplier: Int) -> (Int -> Bool) {
    return { value in
        value % multiplier == 0
    }
}
[2, -6, 8, 3, 15, 11, 24].filter(isMultiple_closure(2))

//: 4. [currying](https://en.wikipedia.org/wiki/Currying)
// - the solution above can be even more compact
func isMultiple_currying(multiplier: Int )(value: Int) -> Bool {
    return value % multiplier == 0
}
[2, -6, 8, 3, 15, 11, 24].filter(isMultiple_currying(2))

//:### problem: combine isPositive and isMultiple so that it can be passed into filter()

//: 1. trivial and less elegant and efficient is calling filter twice
[-4,-2,0,4,7,-8,3].filter(isPositive).filter(isMultiple(2))

//: 2. to get numbers which are either positive or even we can use closure combining both functions (plus currying)
[-4,-2,0,4,7,-8,3].filter { value in isPositive(value) || isMultiple(2)(value) }

//: 3. more elegent way would be:
//: (code view)[-4,-2,0,4,7,-8,3].filter(isPositive || isMultiple(2))
// solution: override &&, || operators so they supports taking Int -> Bool functions as a parameter:
func || (lhs: Int->Bool, rhs: Int->Bool) -> (Int->Bool) {
    return { (value: Int) -> Bool in
        return lhs(value) || rhs(value)
    }
}
// in && we use implicit parameters
func && (lhs: Int->Bool, rhs: Int->Bool) -> (Int->Bool) {
    return { lhs($0) && rhs($0) }
}
// and negating the function
prefix func ! (f: Int->Bool) -> (Int->Bool) {
    return { value in !f(value) }
}
// test: return non-positive and multiples of 3
[-4,-2,0,4,7,-8,3].filter( !isPositive || isMultiple(3) )

// One could even declare those shorthand aliases for negative and odd/even filters:
let isZero = { value in value == 0 }
let isPositiveOrZero = isPositive || isZero
let isNegative = !isPositive && !isZero
let isNegativeOrZero = !isPositive
let isEven = isMultiple(2)
let isOdd = !isEven


