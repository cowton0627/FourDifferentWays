//
//  UserCell.swift
//  FourDifferentWays
//
//  Created by Chun-Li Cheng on 2021/12/9.
//

import UIKit

class UserCell: UITableViewCell, CustomCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var trailingLabel: UILabel!
//    private var viewModel = UserCellViewModel()
    
//    func setupCell() {
//        titleLabel.text = viewModel.titleText
//        trailingLabel.text = viewModel.trailingText
//    }
    
    func setupCell(with viewModel: RowViewModel) {
        guard let viewModel = viewModel as? UserCellViewModel else {
            return
        }
//        self.viewModel = viewModel
        titleLabel.text = viewModel.titleText
        trailingLabel.text = viewModel.trailingText
    }

}
