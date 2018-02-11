import UIKit

class GenericTableDelegate<Cell: UITableViewCell>: NSObject, UITableViewDelegate where Cell: ConfigurableCell {

    private let source: GenericTableDataSource<Cell>!

    init(with source: GenericTableDataSource<Cell>) {
        self.source = source
        super.init()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        source.items.value?[indexPath.row].onSelect()
    }
}
