import Foundation

protocol ViewCellModelProtocol {
    var model: Any? { get }
    func onSelect()
}
