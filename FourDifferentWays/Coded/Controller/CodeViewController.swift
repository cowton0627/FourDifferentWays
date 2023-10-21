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

class NewCell: UITableViewCell {}

class CodeViewController: UIViewController {
    
//    private let firstVM = FirstCellViewModel()
    
    // MARK: - 在 VC 取回 Cell Item
//    private let secondVM = SecondCellViewModel()
    
    private let thirdVM = ThirdCellViewModel()
    private let fourthVM = FourthCellViewModel()
    
    private lazy var titleLabel: UILabel = {
        var label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var chineseZodiacButton: UIButton = {
        var button = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var tableView: UITableView = {
        var table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        // MARK: - Programming
        table.register(FirstCell.self, forCellReuseIdentifier: "FirstCell")
        table.register(SecondCell.self, forCellReuseIdentifier: "SecondCell")
        table.register(ThirdCell.self, forCellReuseIdentifier: "ThirdCell")
        table.register(FourthCell.self, forCellReuseIdentifier: "FourthCell")
        
        // MARK: - 使用 Xib
//        table.register(UINib(nibName: "\(ThirdTableViewCell.self)", bundle: nil),
//                       forCellReuseIdentifier: "ThirdTableViewCell")
        
        // MARK: - 註冊一個客製化 Cell
//        table.register(NewCell.self, forCellReuseIdentifier: "NewCell")

        // MARK: - 註冊一個基本 Cell
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
//    private var cellDatas = [ZodiacData]() {
//        didSet {
//            tableView.reloadData()      // 較耗能
//        }
//    }
    
    private var dataSource: UITableViewDiffableDataSource<Section, Fruit>!
    private var fruits = [Fruit]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        title = "程式造頁"
        setupUI()
        setupConstraint()
        
        // MARK: - 在 VC 取回 Cell Item
//        fetchSecondCellData()
//        secondVM.fetchSecondCellItem()

        
        // 水果 Table
//        title = "Fruit Collection"
//        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(
//            image: UIImage(systemName: "plus"),
//            style: .done,
//            target: self,
//            action: #selector(didTapAdd))
//        
//        dataSource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { tableView, indexPath, itemIdentifier in
//            let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
//                                                     for: indexPath)
//            cell.textLabel?.text = itemIdentifier.title
//            return cell
//        })
    }
    
//    private func fetchSecondCellData() {
//        guard let url = Bundle.main.url(forResource: "Zodiac",
//                                        withExtension: "json") else { return }
//        do {
//            let data = try Data(contentsOf: url)
//            let cellDatas = try JSONDecoder().decode([ZodiacData].self, from: data)
//            self.cellDatas = cellDatas
//
//        } catch {
//            print(error.localizedDescription)
//        }
//    }

    
    // 水果 Table
    @objc func didTapAdd() {
        let actionSheet = UIAlertController(title: "Please Select A Fruit",
                                            message: nil,
                                            preferredStyle: .actionSheet)
        let fruitNames = [
            "Apple", "Banana", "Cherry", "Date", "Fig",
            "Grape", "Honeydew", "Kiwi", "Lemon", "Mango",
            "Nectarine", "Orange", "Papaya", "Quince", "Raspberry"
        ]

        for (index, fruitName) in fruitNames.enumerated() {
            actionSheet.addAction(UIAlertAction(title: fruitName,
                                                style: .default,
                                                handler: { _ in
                let fruit = Fruit(title: fruitName)
                self.fruits.append(fruit)
                self.updateDataSource()
            }))
        }
        
//        for x in 0...15 {
//            actionSheet.addAction(UIAlertAction(title: "Fruits \(x+1)",
//                                                style: .default,
//                                                handler: { _ in
//                let fruit = Fruit(title: "Fruits \(x+1)")
//                self.fruits.append(fruit)
//                self.updateDataSource()
//            }))
//        }

        actionSheet.addAction(UIAlertAction(title: "Cancel",
                                            style: .cancel,
                                            handler: nil))
        present(actionSheet, animated: true, completion: nil)
    }
    
    private func updateDataSource() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Fruit>()
        snapshot.appendSections([.first])
        snapshot.appendItems(fruits, toSection: .first)
        dataSource.apply(snapshot, animatingDifferences: true, completion: nil)
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            tableView.bottomAnchor.constraint(equalTo: chineseZodiacButton.topAnchor,
                                              constant: -8),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            chineseZodiacButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -86),
            chineseZodiacButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32),
            chineseZodiacButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            chineseZodiacButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
    }
    
    private func setupUI() {
        view.backgroundColor = .gray
        setupTitleLabel()
        setupButton()
        setupTableView()
    }
    private func setupTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.font = UIFont.systemFont(ofSize: 30)
        titleLabel.text = "今日星座運勢"
    }
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.backgroundColor = .lightGray
        tableView.layer.cornerRadius = 10
        tableView.dataSource = self
        tableView.delegate = self
    }
    private func setupButton() {
        view.addSubview(chineseZodiacButton)
        chineseZodiacButton.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
        chineseZodiacButton.setTitle("生肖流年", for: .normal)
        chineseZodiacButton.setTitleColor(.black, for: .normal)
        chineseZodiacButton.backgroundColor = .systemYellow
        chineseZodiacButton.layer.cornerRadius = 10
        chineseZodiacButton.setImage(UIImage(systemName: "star"), for: .normal)
        // 設置兩個 EdgeInsets 是為了平衡，將來考慮用 ButtonConfiguration 來設置
        chineseZodiacButton.titleEdgeInsets = UIEdgeInsets(top: 0,
                                                           left: 6,
                                                           bottom: 0,
                                                           right: -6)
//        chineseZodiacButton.imageEdgeInsets = UIEdgeInsets(top: 0,
//                                                           left: -3,
//                                                           bottom: 0,
//                                                           right: 3)
    }
    

}

extension CodeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        switch section {
//        case 0:
//            return firstVM.numberOfItems()
        case 1:
            // MARK: - 在 Cell 取回 Cell Item（用 View Model）
            return 12
//            return secondVM.numberOfItems()
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // MARK: - 另一種 API 建構 TableView（水果 Table）
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = "星座名"
//        cell.imageView?.image = UIImage(systemName: "signature")
//        return cell
        
        switch indexPath.section {
        case 0:
            // MARK: - Programming
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(FirstCell.self)", for: indexPath) as? FirstCell else {
                return UITableViewCell()
            }
//            cell.leadingImgView.image = UIImage(systemName: "signature")
//            cell.trailingTitleLabel.text = "星座名"
            
//            cell.setupCell(with: firstVM, at: indexPath.row)
            // MARK: - 在 Cell 取回 Cell Item（用 View Model）
            cell.setupCell(at: indexPath.row)
//            return cell
            
            // MARK: - 使用 Xib
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(ThirdTableViewCell.self)", for: indexPath) as? ThirdTableViewCell else {
//            return UITableViewCell()
//        }
//        cell.imgView.image = UIImage(systemName: "signature")
//        cell.titleLabel.text = "星座名"
//            return cell
            
            // MARK: - 客製化 Cell 用基本樣式
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(NewCell.self)", for: indexPath) as? NewCell else {
//                return UITableViewCell()
//            }
//            cell.textLabel?.text = "測試用"
//            cell.imageView?.image = UIImage(systemName: "signature")
//            return cell
            
            // MARK: - 預設 Cell 的基本樣式
//            let cell = UITableViewCell()
//            cell.textLabel?.text = "星座名"
//            cell.imageView?.image = UIImage(systemName: "signature")
//            return cell
            
            // MARK: - 同上，只是需要註冊 cell
//            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//            cell.textLabel?.text = "星座名"
//            cell.imageView?.image = UIImage(systemName: "signature")
//            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(SecondCell.self)", for: indexPath) as? SecondCell else {
                return UITableViewCell()
            }
//            let cellRow = cellDatas[indexPath.row]
//            cell.leadingTitleLabel.text = cellRow.name
//            cell.trailingImgView.image = UIImage(named: "\(cellRow.picName)")
            
//            cell.setupCell(with: secondVM, at: indexPath.row)
            // MARK: - 在 Cell 取回 Cell Item（用 View Model）
            cell.setupCell(at: indexPath.row)

//            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(FirstCell.self)", for: indexPath) as? FirstCell else {
                return UITableViewCell()
            }
//            cell.leadingImgView.image = UIImage(systemName: "rosette")
//            cell.trailingTitleLabel.text = "系統設定"
            
//            cell.anotherSetupCell(with: firstVM, at: indexPath.row)
            // MARK: - 在 Cell 取回 Cell Item（用 View Model）
            cell.anotherSetupCell(at: indexPath.row)
            
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
            cell.setupCell(with: thirdVM, at: indexPath.row)
            
//            cell.titleLabel.text = "接收每日通知"
//            cell.trailingSwitch.isOn = true
//            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(FourthCell.self)", for: indexPath) as? FourthCell else {
                return UITableViewCell()
            }
            cell.setupCell(with: fourthVM, at: indexPath.row)
            
//            cell.titleLabel.text = "目前登入帳號"
//            cell.trailingLabel.text = "Charles"
//            cell.trailingLabel.textColor = .white
//            return cell
        default: break
        }
        
        return UITableViewCell()
    }
}

extension CodeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // 水果 Table
//        guard let fruit = dataSource.itemIdentifier(for: indexPath) else {
//            return
//        }
//        print(fruit.title)
    }
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }

}
