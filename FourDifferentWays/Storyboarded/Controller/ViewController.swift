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
    
//    private let imgCellVM = ImgCellViewModel()
//    private let menuCellVM = MenuCellViewModel()
//    private let switchCellVM = SwitchCellViewModel()
//    private let userCellVM = UserCellViewModel()
//
//    private var rowViewModels = [RowViewModel]()
        
    private var rowViewModels = SectionViewModel().rowViewModels
        
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var chineseZodiacBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBtn()
        
        // fetchCellData 可以在建立 VM 時就 fetch，或等到 VC 要用時才 fetch
//        menuCellVM.fetchCellData()
        
//        rowViewModels.append(imgCellVM)
//        rowViewModels.append(menuCellVM)
//        rowViewModels.append(imgCellVM)
//        rowViewModels.append(switchCellVM)
//        rowViewModels.append(userCellVM)
        
//        tableView.dataSource = menuCellVM
    }
    
    private func setupBtn() {
        chineseZodiacBtn.setImage(UIImage(systemName: "star"), for: .normal)
    }

}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        rowViewModels.count
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        rowViewModels[section].rowCount
    }
    
    func tableView(_ tableView: UITableView,
                   titleForHeaderInSection section: Int) -> String? {
        rowViewModels[section].sectionTitle
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // MARK: 最簡潔的建構 Cell 方式
        let cellModel = rowViewModels[indexPath.section]
        let cellIdentifier = cellModel.type.presentTitle
        let customCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                       for: indexPath) as? CustomCell
        
//        if cellIdentifier == "MenuCell" {
        customCell?.setupCell(with: cellModel, at: indexPath.row)
//        } else {
//            customCell?.setupCell(with: cellModel)
//        }
        return customCell as! UITableViewCell
        
        // MARK: - 若使用上方方法，下方不會執行
        let rowViewModel = rowViewModels[indexPath.section]
        
        switch rowViewModel.type {
        case .img:
            let cell: ImgCell = tableView.dequeueReusableCell(for: indexPath)
            
            switch indexPath.section {
            case 0:
                cell.setupCell(viewModel: rowViewModel, at: indexPath.row)
            case 2:
                cell.anotherSetupCell(viewModel: rowViewModel, at: indexPath.row)
            default: return cell
            }
            
//            cell.setupCell(with: rowViewModel)
            
            return cell
            
        case .menu:
            let cell: MenuCell = tableView.dequeueReusableCell(for: indexPath)
//            if let VM = rowViewModel as? MenuCellViewModel {
//                cell.setupCell(with: VM.cellDatas[indexPath.row])
//            }
            cell.setupCell(with: rowViewModel, at: indexPath.row)

            return cell
        case .switch:
            let cell: SwitchCell = tableView.dequeueReusableCell(for: indexPath)
            cell.setupCell(with: rowViewModel)
            
            return cell
        case .user:
            let cell: UserCell = tableView.dequeueReusableCell(for: indexPath)
            cell.setupCell(with: rowViewModel)
            
            return cell
        }

    }
    
    
}

extension ViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView,
//                   heightForRowAt indexPath: IndexPath) -> CGFloat {
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
//    func tableView(_ tableView: UITableView,
//                   heightForHeaderInSection section: Int) -> CGFloat {
//        switch section {
//        case 0, 1, 2: return 70
//        default: return 70
//        }
//    }
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
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        switch section {
//        case 0, 1, 2: return 70
//        default: return 70
//        }
//    }
}

protocol ReusableView {
    static var reuseIdentifier: String { get }
}

extension ReusableView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableView {}

// 重用 Cell 的擴展
extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to Dequeue Reusable Table View Cell")
        }

        return cell
    }

}

