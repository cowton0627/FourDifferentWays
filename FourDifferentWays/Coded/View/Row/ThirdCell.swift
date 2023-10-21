//
//  ThirdCell.swift
//  FourDifferentWays
//
//  Created by Chun-Li Cheng on 2021/12/15.
//

import UIKit

class ThirdCell: UITableViewCell, CustomCell {
    func setupCell(with viewModel: RowViewModel) {
        // 擺在這邊可以不用
    }
    
//    var viewModel: ThirdCellViewModel?
    
    lazy var titleLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    lazy var trailingSwitch: UISwitch = {
        let ts = UISwitch()
        ts.translatesAutoresizingMaskIntoConstraints = false
        return ts
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
        trailingSwitch.isOn = true
    }
    
    private func setupInitialView() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(trailingSwitch)
        contentView.backgroundColor = .systemGray4
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo:
                contentView.leadingAnchor,constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            trailingSwitch.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            trailingSwitch.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func setupCell(with viewModel: RowViewModel, at index: Int) {
        guard let viewModel = viewModel as? ThirdCellViewModel else {
            return assertionFailure("Expected ThirdCellViewModel")
        }
        let modelItem = viewModel.itemAt(index)
        titleLabel.text = modelItem.title
        trailingSwitch.isOn = modelItem.isOn
        
//        titleLabel.text = viewModel.title
//        trailingSwitch.isOn = viewModel.isOn
    }
}
