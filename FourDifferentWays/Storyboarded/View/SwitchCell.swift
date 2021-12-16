//
//  SwitchCell.swift
//  FourDifferentWays
//
//  Created by Chun-Li Cheng on 2021/12/9.
//

import UIKit

class SwitchCell: UITableViewCell, CustomCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var trailingSwitch: UISwitch!
//    private var viewModel = SwitchCellViewModel()
    
//    func setupCell() {
//        titleLabel.text = viewModel.titleText
//    }
    
    func setupCell(with viewModel: RowViewModel) {
        guard let viewModel = viewModel as? SwitchCellViewModel else {
            return
        }
//        self.viewModel = viewModel
        titleLabel.text = viewModel.titleText
    }

}
