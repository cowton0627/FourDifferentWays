//
//  SecondCell.swift
//  FourDifferentWays
//
//  Created by Chun-Li Cheng on 2021/12/15.
//

import UIKit

class SecondCell: UITableViewCell {
    lazy var titleLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    lazy var trailingImgView: UIImageView = {
        let imgV = UIImageView()
        imgV.translatesAutoresizingMaskIntoConstraints = false
        return imgV
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
        contentView.addSubview(trailingImgView)
        contentView.backgroundColor = .systemGray4
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            trailingImgView.widthAnchor.constraint(equalToConstant: 44),
            trailingImgView.heightAnchor.constraint(equalTo: trailingImgView.widthAnchor),
            trailingImgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            trailingImgView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
        ])
        trailingImgView.sizeToFit()
    }
}
