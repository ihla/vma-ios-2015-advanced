// pre document-like look doporučujem zapnúť markup (menu Editor -> Show Rendered Markup)

/*:
# Extensions
## Swift Extensions je spôsob ako rozširovať funkcionalitu existujúcich tried a štruktúr aj bez vlastníctva zdrojového kódu.
*/
//:  Problém: ako realizovať v Swift takýto expresívny zápis?
/*: (code view)
3.times{ print("Huraaa!") }
*/
extension Int {
    func times(closure:()->()) {
        var i = self
        repeat {
            closure()
        } while --i > 0
    }
}
3.times{ print("Huraaa!") }
