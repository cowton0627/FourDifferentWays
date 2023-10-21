//
//  ImgCell.swift
//  FourDifferentWays
//
//  Created by Chun-Li Cheng on 2021/12/9.
//

import UIKit

class ImgCell: UITableViewCell, CustomCell {
    func setupCell(with viewModel: RowViewModel, at index: Int) {
        guard let viewModel = viewModel as? ImgCellViewModel else {
            return
        }
        
        if count % 2 == 0 {
            titleImgView.image = viewModel.image
            titleLabel.text = viewModel.text
            count = count + 1
        } else {
            titleImgView.image = viewModel.image2
            titleLabel.text = viewModel.text2
            count = count + 1
        }
    }

//    private var viewModel: ImgCellViewModel?
    private var count = 0
    
    @IBOutlet weak var titleImgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    
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
        
        /*  這僅在兩者不會同時出現時，建構時不打架，
            雖然相當程度地降低程式碼，但卻是投機的做法。
         
            若是每個 Cell 都需要客製化倒不是什麼難事
         */
        if count % 2 == 0 {
            titleImgView.image = viewModel.image
            titleLabel.text = viewModel.text
            count = count + 1
        } else {
            titleImgView.image = viewModel.image2
            titleLabel.text = viewModel.text2
            count = count + 1
        }
    }
    
    func setupCell(viewModel: RowViewModel, at index: Int) {
        guard let viewModel = viewModel as? ImgCellViewModel else {
            return
        }
        let modelItem = viewModel.cellItems[index]
        titleImgView.image = UIImage(systemName: modelItem.picName)
        titleLabel.text = modelItem.titleText
    }

    
    func anotherSetupCell(viewModel: RowViewModel, at index: Int) {
        guard let viewModel = viewModel as? ImgCellViewModel else {
            return
        }
        let modelItem = viewModel.anotherCellItems[index]
        titleImgView.image = UIImage(systemName: modelItem.picName)
        titleLabel.text = modelItem.titleText
    }
}
