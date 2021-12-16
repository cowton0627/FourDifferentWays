//
//  CodeViewController.swift
//  FourDifferentWays
//
//  Created by Chun-Li Cheng on 2021/12/13.
//

import UIKit

enum Section {
    case first
}

struct Fruit: Hashable {
    let title: String
}

class NewCell: UITableViewCell {
    
}

class CodeViewController: UIViewController {
    lazy var titleLabel: UILabel = {
        var l = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    lazy var chZodiacButton: UIButton = {
        var b = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    lazy var tableView: UITableView = {
        var table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
//        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        table.register(FirstCell.self, forCellReuseIdentifier: "FirstCell")
//        table.register(UINib(nibName: "\(ThirdTableViewCell.self)", bundle: nil), forCellReuseIdentifier: "ThirdTableViewCell")
        table.register(SecondCell.self, forCellReuseIdentifier: "SecondCell")
        table.register(ThirdCell.self, forCellReuseIdentifier: "ThirdCell")
        table.register(FourthCell.self, forCellReuseIdentifier: "FourthCell")
//        table.register(NewCell.self, forCellReuseIdentifier: "NewCell")
        return table
    }()
    
    var cellDatas = [MenuData]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    var dataSource: UITableViewDiffableDataSource<Section, Fruit>!
    var fruits = [Fruit]()
    override func viewDidLoad() {
        super.viewDidLoad()
//        title = "程式造頁"
        view.backgroundColor = .gray
        tableView.dataSource = self
        tableView.delegate = self
        setTitleLabel()
        setButton()
        setTableView()
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            chZodiacButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            chZodiacButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            chZodiacButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -86),
            chZodiacButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32),
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            tableView.bottomAnchor.constraint(equalTo: chZodiacButton.topAnchor, constant: -8),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
            
        ])
        
//        dataSource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { tableView, indexPath, itemIdentifier in
//            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//            cell.textLabel?.text = itemIdentifier.title
//
//            return cell
//        })
//        title = "My Fruits"
//        navigationItem.rightBarButtonItem = UIBarButtonItem(
//            image: UIImage(systemName: "plus"),
//            style: .done,
//            target: self,
//            action: #selector(didTapAdd))
        fetchSecondCellData()
        
    }
    
    func fetchSecondCellData() {
        guard let url = Bundle.main.url(forResource: "Zodiac", withExtension: "json") else {
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let cellDatas = try JSONDecoder().decode([MenuData].self, from: data)
            self.cellDatas = cellDatas
        }
        catch {
            print(error)
        }
    }

    
//    @objc func didTapAdd() {
//        let actionSheet = UIAlertController(title: "Select fruit", message: nil, preferredStyle: .actionSheet)
//        for x in 0...100 {
//            actionSheet.addAction(UIAlertAction(title: "Fruits \(x+1)", style: .default, handler: { _ in
//                let fruit = Fruit(title: "Fruits \(x+1)")
//                self.fruits.append(fruit)
//                self.updateDataSource()
//            }))
//        }
//
//        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//        present(actionSheet, animated: true, completion: nil)
//    }
    
    func updateDataSource() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Fruit>()
        snapshot.appendSections([.first])
        snapshot.appendItems(fruits, toSection: .first)
        dataSource.apply(snapshot, animatingDifferences: true, completion: nil)
    }
    
    private func setTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.font = UIFont.systemFont(ofSize: 30)
        titleLabel.text = "今日星座運勢"
    }
    private func setButton() {
        view.addSubview(chZodiacButton)
        chZodiacButton.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
        chZodiacButton.setTitle("生肖流年", for: .normal)
        chZodiacButton.setTitleColor(.black, for: .normal)
        chZodiacButton.backgroundColor = .systemYellow
        chZodiacButton.layer.cornerRadius = 10
        chZodiacButton.setImage(UIImage(systemName: "star"), for: .normal)
    }
    private func setTableView() {
        view.addSubview(tableView)
        tableView.backgroundColor = .lightGray
        tableView.layer.cornerRadius = 10
    }
    

}

extension CodeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return cellDatas.count
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(FirstCell.self)", for: indexPath) as? FirstCell else {
            return UITableViewCell()
        }
            cell.imgView.image = UIImage(systemName: "signature")
            cell.titleLabel.text = "星座名"
            return cell
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(ThirdTableViewCell.self)", for: indexPath) as? ThirdTableViewCell else {
//            return UITableViewCell()
//        }
//        cell.imgView.image = UIImage(systemName: "signature")
//        cell.titleLabel.text = "星座名"
//            return cell
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(NewCell.self)", for: indexPath) as? NewCell else {
//                return UITableViewCell()
//            }
//            cell.textLabel?.text = "測試用"
//            cell.detailTextLabel?.text = "測試測試用"
//            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(SecondCell.self)", for: indexPath) as? SecondCell else {
                return UITableViewCell()
            }
            let cellRow = cellDatas[indexPath.row]
            cell.titleLabel.text = cellRow.name
            cell.trailingImgView.image = UIImage(named: "\(cellRow.picName)")
//            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(FirstCell.self)", for: indexPath) as? FirstCell else {
                return UITableViewCell()
            }
            cell.imgView.image = UIImage(systemName: "rosette")
            cell.titleLabel.text = "系統設定"
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(ThirdTableViewCell.self)", for: indexPath) as? ThirdTableViewCell else {
//                return UITableViewCell()
//            }
//            cell.imgView.image = UIImage(systemName: "rosette")
//            cell.titleLabel.text = "系統設定"
            
//            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(ThirdCell.self)", for: indexPath) as? ThirdCell else {
                return UITableViewCell()
            }
            cell.titleLabel.text = "接收每日通知"
            cell.trailingSwitch.isOn = true
    
//            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(FourthCell.self)", for: indexPath) as? FourthCell else {
                return UITableViewCell()
            }
            cell.titleLabel.text = "目前登入帳號"
            cell.trailingLabel.text = "Charles"
            cell.trailingLabel.textColor = .white
            return cell
        default: break
            
        }
        
        return UITableViewCell()
    }
}

extension CodeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let fruit = dataSource.itemIdentifier(for: indexPath) else {
//            return
//        }
//
//        print(fruit.title)
//    }
}
