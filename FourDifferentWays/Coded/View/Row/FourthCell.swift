//
//  FourthCell.swift
//  FourDifferentWays
//
//  Created by Chun-Li Cheng on 2021/12/15.
//

import UIKit

class FourthCell: UITableViewCell, CustomCell {
    func setupCell(with viewModel: RowViewModel) {
        // 擺在這邊可以不用
    }
    
//    var viewModel: FourthCellViewModel?
    
    lazy var titleLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    lazy var trailingLabel: UILabel = {
        let tl = UILabel()
        tl.translatesAutoresizingMaskIntoConstraints = false
        return tl
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
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
        titleLabel.text = nil
        trailingLabel.text = nil
    }
    
    func setupInitialView() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(trailingLabel)
        contentView.backgroundColor = .systemGray4
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo:
                contentView.leadingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            trailingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            trailingLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func setupCell(with viewModel: RowViewModel, at index: Int) {
        guard let viewModel = viewModel as? FourthCellViewModel else {
            return assertionFailure("Expected FourthCellViewModel")
        }
//        self.viewModel = viewModel
        let modelItem = viewModel.itemAt(index)
        titleLabel.text = modelItem.title
        trailingLabel.text = modelItem.titleTitle
        trailingLabel.textColor = .white
//        titleLabel.text = viewModel.title
//        trailingLabel.text = viewModel.titleTitle
    }

}
