//
//  SecondCell.swift
//  FourDifferentWays
//
//  Created by Chun-Li Cheng on 2021/12/15.
//

import UIKit

class SecondCell: UITableViewCell, CustomCell {
    func setupCell(with viewModel: RowViewModel) {
        // 擺在這邊可以不用
    }
    
    private var viewModel = SecondCellViewModel()
    
    lazy var leadingTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var trailingImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupInitialView()
        setupConstraint()
        viewModel.fetchSecondCellItem()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        leadingTitleLabel.text = nil
        trailingImgView.image = nil
    }
    
    private func setupInitialView() {
        contentView.addSubview(leadingTitleLabel)
        contentView.addSubview(trailingImgView)
        contentView.backgroundColor = .systemGray4
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            trailingImgView.widthAnchor.constraint(equalToConstant: 44),
            leadingTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            leadingTitleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            trailingImgView.heightAnchor.constraint(equalTo: trailingImgView.widthAnchor),
            trailingImgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            trailingImgView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
//        trailingImgView.sizeToFit()
    }
    
//    func setupCell(with viewModel: RowViewModel) {
//        guard let viewModel = viewModel as? SecondCellViewModel else {
//            return
//        }
//        self.viewModel = viewModel
//        leadingTitleLabel.text = viewModel.sectionTitle
//        trailingImgView.image = UIImage(named: "\(viewModel.rowCount)")
//    }
    
    func setupCell(with viewModel: RowViewModel, at index: Int) {
        guard let viewModel = viewModel as? SecondCellViewModel else {
            return assertionFailure("Expected SecondCellViewModel")
        }
        let modelItem = viewModel.itemAt(index)
        leadingTitleLabel.text = modelItem.name
        trailingImgView.image = UIImage(named: "\(modelItem.picName)")
//        leadingTitleLabel.text = viewModel.sectionTitle
//        trailingImgView.image = UIImage(named: "\(viewModel.rowCount)")
    }
    
    func setupCell(at index: Int) {
        let modelItem = viewModel.cellItems[index]
        leadingTitleLabel.text = modelItem.name
        trailingImgView.image = UIImage(named: "\(modelItem.picName)")
    }
}
