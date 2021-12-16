//
//  ImgCell.swift
//  FourDifferentWays
//
//  Created by Chun-Li Cheng on 2021/12/9.
//

import UIKit

class ImgCell: UITableViewCell, CustomCell {
    @IBOutlet weak var titleImgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
//    private var viewModel: ImgCellViewModel?
    private var count = 0
    
//    func setupViewOne() {
//        titleImgView.image = UIImage(systemName: "signature")
//        titleLabel.text = "星座名"
//    }
//    func setupViewTwo() {
//        titleImgView.image = UIImage(systemName: "rosette")
//        titleLabel.text = "系統設定"
//    }
    
    func setupCell(with viewModel: RowViewModel) {
        guard let viewModel = viewModel as? ImgCellViewModel else {
            return
        }
//        self.viewModel = viewModel
        if count % 2 == 0 {
            titleImgView.image = viewModel.image
            titleLabel.text = viewModel.text
            count = count+1
        } else {
            titleImgView.image = viewModel.image2
            titleLabel.text = viewModel.text2
            count = count+1
        }

    }
}
