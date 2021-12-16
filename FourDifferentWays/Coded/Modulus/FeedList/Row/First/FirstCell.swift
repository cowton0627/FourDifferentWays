//
//  FirstCell.swift
//  FourDifferentWays
//
//  Created by Chun-Li Cheng on 2021/12/14.
//

import UIKit

class FirstCell: UITableViewCell {
    lazy var imgView: UIImageView = {
        let imgV = UIImageView()
        imgV.translatesAutoresizingMaskIntoConstraints = false
        return imgV
    }()
    
    lazy var titleLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    override init(style: CellStyle, reuseIdentifier: String?) {
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
        contentView.addSubview(imgView)
        contentView.addSubview(titleLabel)
        contentView.backgroundColor = .systemGray4
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            imgView.widthAnchor.constraint(equalToConstant: 44),
            imgView.heightAnchor.constraint(equalTo: imgView.widthAnchor),
            imgView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            imgView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        
        
        
        ])
        
    }
    
    
}
