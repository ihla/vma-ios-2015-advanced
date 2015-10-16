// pre document-like look doporučujem zapnúť markup (menu Editor -> Show Rendered Markup)

//: Example of protocol extension with defaut impl

//: in protocol func cannot have a body
protocol DefaultImpl {
    func defaultFunc()
}

//: protocol extension can have default impl of a function
extension DefaultImpl {
    func defaultFunc() {
        print("default impl")
    }
}

//: default impl can be overriden by class impl
class ImplClass: DefaultImpl {
    func defaultFunc() {
        print("overriden impl")
    }
}
let impl = ImplClass()
impl.defaultFunc()

/*:
Protocol extensions allow the specification of constraints on used types. As an example, this allows for the definition of a protocol extension on a CollectionType only when the element of the collection satisfies a requirement:
*/
extension CollectionType where Generator.Element : Equatable {
    // Declaring Generator.Element as Equatable allows to use the == operator inside of indexOf.
    public func indexOf(element: Generator.Element) -> Index? {
        for i in self.indices {
            if self[i] == element {
                return i
            }
        }
        return nil
    }
}
