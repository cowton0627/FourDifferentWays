//
//  ViewController.swift
//  FourDifferentWays
//
//  Created by Chun-Li Cheng on 2021/12/9.
//

import UIKit

enum CellType: Int {
    case tbv = 0
    case tvb = 1
}

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var chineseZodiacBtn: UIButton!

//    private let imgCellVM = ImgCellViewModel()
//    private let menuCellVM = MenuCellViewModel()
//    private let switchCellVM = SwitchCellViewModel()
//    private let userCellVM = UserCellViewModel()
//    private var rowVMs = [RowViewModel]()
    
    private var rowVMs = SectionViewModel().rowViewModels
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBtn()
        
        // fetchCellData可以在建立VM時就fetch, 或等到VC要用時才fetch
//        menuCellVM.fetchCellData()
        
//        rowVMs.append(imgCellVM)
//        rowVMs.append(menuCellVM)
//        rowVMs.append(imgCellVM)
//        rowVMs.append(switchCellVM)
//        rowVMs.append(userCellVM)
        
//        tableView.dataSource = menuCellVM
    }
    
    private func setupBtn() {
        chineseZodiacBtn.setImage(UIImage(systemName: "star"), for: .normal)
    }

}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        
        rowVMs.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        rowVMs[section].rowCount
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        rowVMs[section].sectionTitle
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cellModel = rowVMs[indexPath.section]
//        let cellIdentifier = cellModel.type.presentTitle
//        let customCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CustomCell
//        customCell?.setupCell(with: cellModel)
//        return customCell as! UITableViewCell
        
        let rowVM = rowVMs[indexPath.section]
        switch rowVM.type {
        case .img:
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(ImgCell.self)") as? ImgCell else {
//                return UITableViewCell()
//            }
            let cell: ImgCell = tableView.dequeueReusableCell(for: indexPath)
            cell.setupCell(with: rowVM)
            return cell
        case .menu:
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(MenuCell.self)", for: indexPath) as? MenuCell else {
//                return UITableViewCell()
//            }
//            cell.setupCell(with: menuCellVM.cellDatas[indexPath.row])

            let cell: MenuCell = tableView.dequeueReusableCell(for: indexPath)
            if let VM = rowVM as? MenuCellViewModel {
                cell.setupCell(with: VM.cellDatas[indexPath.row])
            }

            return cell
        case .switch:
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(SwitchCell.self)", for: indexPath) as? SwitchCell else {
//                return UITableViewCell()
//            }
            let cell: SwitchCell = tableView.dequeueReusableCell(for: indexPath)
            cell.setupCell(with: rowVM)
            return cell
        case .user:
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(UserCell.self)", for: indexPath) as? UserCell else {
//                return UITableViewCell()
//            }
            let cell: UserCell = tableView.dequeueReusableCell(for: indexPath)
            cell.setupCell(with: rowVM)
            return cell
        }

    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        switch section {
//        case 0:
//            let view = UIView()
//            view.backgroundColor = .red
//            return view
//        case 1, 2: return nil
//        default: return nil
//        }
//    }
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        switch section {
//        case 0:
//            let view = UIView()
//            view.backgroundColor = .red
//            return view
//        case 1, 2: return nil
//        default: return nil
//        }
//    }
    
}

extension ViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        switch section {
//        case 0, 1, 2: return 70
//        default: return 70
//        }
//    }
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        switch section {
//        case 0, 1, 2: return 70
//        default: return 70
//        }
//    }
}

// 重用cell的擴展
protocol ReusableView {
    static var reuseIdentifier: String { get }

}

extension ReusableView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }

}

extension UITableViewCell: ReusableView {}

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to Dequeue Reusable Table View Cell")
        }

        return cell
    }

}

