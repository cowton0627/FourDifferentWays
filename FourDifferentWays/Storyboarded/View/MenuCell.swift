//
//  MenuCell.swift
//  FourDifferentWays
//
//  Created by Chun-Li Cheng on 2021/12/9.
//

import UIKit

class MenuCell: UITableViewCell, CustomCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var trailingImgView: UIImageView!
    private var viewModel = MenuCellViewModel()
//    private var index = 0
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        viewModel.fetchCellData()
    }
    
//    func setupCell(with cellData: MenuItem) {
//        titleLabel.text = cellData.name
//        trailingImgView.image = UIImage(named: cellData.picName)
//    }
    
    
    
    func setupCell(with viewModel: RowViewModel) {
//        guard let viewModel = viewModel as? MenuCellViewModel else {
//            return
//        }
   
//        self.viewModel = viewModel

//        var cellDatas = [MenuItem]()
//        for cellData in viewModel.cellDatas {
//            self.titleLabel.text = cellData.name
//            self.trailingImgView.image = UIImage(named: cellData.picName)
            
//            cellDatas.append(cellData)
//            self.titleLabel.text = cellDatas.first?.name
//            self.trailingImgView.image = UIImage(named: cellDatas.first!.picName)
//            cellDatas.removeFirst()
//            cellDatas.removeLast()
//        }

//        let tableView = superTableView()
//        guard let indexPath = tableView?.indexPath(for: self) else {
//            return
//        }
//        self.titleLabel.text = viewModel.cellDatas[indexPath.row].name
//        self.trailingImgView.image = UIImage(named: viewModel.cellDatas[indexPath.row].picName)
    }
    
    func setupCell(with viewModel: RowViewModel, at index: Int) {
        guard let viewModel = viewModel as? MenuCellViewModel else {
            return
        }
        
        let modelItem = viewModel.itemAt(index)
        titleLabel.text = modelItem.name
        trailingImgView.image = UIImage(named: modelItem.picName)
    }
}

extension  UITableViewCell  {
     // 返回cell所在的UITableView
     func superTableView() -> UITableView? {
         for view in sequence(first:  self.superview, next: { $0?.superview }) {
             if let tableView = view as? UITableView  {
                 return tableView
             }
         }
         return  nil
     }
}
