//
//  FirstCell.swift
//  FourDifferentWays
//
//  Created by Chun-Li Cheng on 2021/12/14.
//

import UIKit

class FirstCell: UITableViewCell, CustomCell {
    func setupCell(with viewModel: RowViewModel) {
        // 擺在這邊可以不用
    }
    
    private var viewModel = FirstCellViewModel()
    
    lazy var leadingImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    lazy var trailingTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupInitialView()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        leadingImgView.image = nil
        trailingTitleLabel.text = nil
    }
    
    private func setupInitialView() {
        contentView.addSubview(leadingImgView)
        contentView.addSubview(trailingTitleLabel)
        contentView.backgroundColor = .systemGray4
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            leadingImgView.widthAnchor.constraint(equalToConstant: 44),
            leadingImgView.heightAnchor.constraint(equalTo: leadingImgView.widthAnchor),
            leadingImgView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,
                                             constant: 8),
            leadingImgView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            trailingTitleLabel.leadingAnchor.constraint(equalTo: leadingImgView.trailingAnchor,
                                                constant: 16),
            trailingTitleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    /// 第一個 Section 建構用
    func setupCell(with viewModel: RowViewModel, at index: Int) {
        guard let viewModel = viewModel as? FirstCellViewModel else {
            return assertionFailure("Expected FirstCellViewModel")
        }
//        self.viewModel = viewModel
        
//        leadingImgView.image = UIImage(systemName: "\(viewModel.picName)")
//        trailingTitleLabel.text = viewModel.titleText
        
        let modelItem = viewModel.itemAt(index)
        leadingImgView.image = UIImage(systemName: modelItem.picName)
        trailingTitleLabel.text = modelItem.titleText
    }
    
    func setupCell(at index: Int) {
//        guard let viewModel = viewModel as? FirstCellViewModel else {
//            return assertionFailure("Expected FirstCellViewModel")
//        }
        let modelItem = viewModel.itemAt(index)
        leadingImgView.image = UIImage(systemName: modelItem.picName)
        trailingTitleLabel.text = modelItem.titleText
    }
    
    
    /// 第三個 Section 建構用
    func anotherSetupCell(with viewModel: RowViewModel, at index: Int) {
        guard let viewModel = viewModel as? FirstCellViewModel else {
            return assertionFailure("Expected FirstCellViewModel")
        }
        
        let modelItem = viewModel.anotherItemAt(index)
        leadingImgView.image = UIImage(systemName: modelItem.picName)
        trailingTitleLabel.text = modelItem.titleText
    }
    
    func anotherSetupCell(at index: Int) {
        let modelItem = viewModel.anotherItemAt(index)
        leadingImgView.image = UIImage(systemName: modelItem.picName)
        trailingTitleLabel.text = modelItem.titleText
    }
    
}
