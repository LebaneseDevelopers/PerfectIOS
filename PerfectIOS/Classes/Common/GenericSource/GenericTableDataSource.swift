import UIKit
import RxCocoa
import Then

class GenericTableDataSource<Cell: UITableViewCell>: NSObject, UITableViewDataSource
where Cell: ConfigurableCell {

    let items: BehaviorRelay<[ViewCellModelProtocol]?>

    init(with items: BehaviorRelay<[ViewCellModelProtocol]?>) {
        self.items = items
        super.init()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.value?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueCell(ofType: Cell.self).then {
            (cell) in
            cell.configure(items.value![indexPath.row])
        }
    }
}
