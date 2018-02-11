import Foundation

public extension NSObject {

    public class var nameOfClass: String {
        return NSStringFromClass(self)
            .components(separatedBy: ".")
            .last!
    }

    public var nameOfClass: String {
        return NSStringFromClass(type(of: self))
            .components(separatedBy: ".")
            .last!
    }
}
