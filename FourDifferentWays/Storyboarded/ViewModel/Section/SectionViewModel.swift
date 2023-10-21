//
//  SectionViewModel.swift
//  FourDifferentWays
//
//  Created by Chun-Li Cheng on 2021/12/9.
//

import Foundation
import UIKit

// ViewModel
class SectionViewModel {
    
    var rowViewModels = [RowViewModel]()
    
    init() {
        rowViewModels.append(ImgCellViewModel())
        rowViewModels.append(MenuCellViewModel())
        rowViewModels.append(ImgCellViewModel())
        rowViewModels.append(SwitchCellViewModel())
        rowViewModels.append(UserCellViewModel())
    }
    
//    override init() {
//        super.init()
//        rowViewModels.append(ImgCellViewModel())
//        rowViewModels.append(MenuCellViewModel())
//        rowViewModels.append(ImgCellViewModel())
//        rowViewModels.append(SwitchCellViewModel())
//        rowViewModels.append(UserCellViewModel())
//    }

}
//extension SectionViewModel: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        rowViewModels.count
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cellModel = rowViewModels[indexPath.section]
//        let cellIdentifier = cellModel.type.presentTitle
//        let customCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CustomCell
//        customCell?.setupCell(with: cellModel)
//        return customCell as! UITableViewCell
//    }
//}

// 遵循此協議，建構欄位基本資訊
protocol RowViewModel
//: AnyObject
{
    var type: CustomCellType { get }
    var sectionTitle: String { get }
    var rowCount: Int { get }
}
// 基本資訊預設值
extension RowViewModel {
    var sectionTitle: String {
        return ""
    }
    
    var rowCount: Int {
        return 1
    }
}

// Cell 的類型
enum CustomCellType: String {
    case img
    case menu
    case `switch`
    case user
}
// For indentifier
extension CustomCellType {
    
    var presentTitle: String {
        switch self {
        case .img: return "ImgCell"
        case .menu: return "MenuCell"
        case .`switch`: return "SwitchCell"
        case .user: return "UserCell"
        }
    }
}

// 遵循此協議，實作基本建構方法
protocol CustomCell: AnyObject {
//    func setupCell(with viewModel: RowViewModel, at index: Int)
    // MARK: 必須要擺在這邊，不能使用 extension，方可在 VC 用最簡潔的方式建構 Cell
    func setupCell(with viewModel: RowViewModel)
    func setupCell(with viewModel: RowViewModel, at index: Int)
}

extension CustomCell {
//    func setupCell(with viewModel: RowViewModel, at index: Int) {}
}


