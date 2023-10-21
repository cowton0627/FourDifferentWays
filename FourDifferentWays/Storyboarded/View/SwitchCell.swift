//
//  SwitchCell.swift
//  FourDifferentWays
//
//  Created by Chun-Li Cheng on 2021/12/9.
//

import UIKit

class SwitchCell: UITableViewCell, CustomCell {
    func setupCell(with viewModel: RowViewModel, at index: Int) {
        guard let viewModel = viewModel as? SwitchCellViewModel else {
            return
        }
        titleLabel.text = viewModel.titleText
        trailingSwitch.isOn = viewModel.isOn
    }
    
    
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
        trailingSwitch.isOn = viewModel.isOn
    }

}
