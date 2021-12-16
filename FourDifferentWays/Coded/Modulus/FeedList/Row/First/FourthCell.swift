//
//  FourthCell.swift
//  FourDifferentWays
//
//  Created by Chun-Li Cheng on 2021/12/15.
//

import UIKit

class FourthCell: UITableViewCell {
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
        setupInitialView()
        setupConstraint()
    }
    
    func setupInitialView() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(trailingLabel)
        contentView.backgroundColor = .systemGray4
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            trailingLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            trailingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
            

        ])
    }

}
