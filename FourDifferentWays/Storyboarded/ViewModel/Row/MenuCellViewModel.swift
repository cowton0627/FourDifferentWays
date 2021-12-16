//
//  MenuCellViewModel.swift
//  FourDifferentWays
//
//  Created by Chun-Li Cheng on 2021/12/9.
//

import Foundation
import UIKit

class MenuCellViewModel: NSObject, RowViewModel {
    var type: CustomCellType { return .menu }
    var rowCount: Int {
        return cellDatas.count
    }
    var sectionTitle: String?

    var cellDatas = [MenuData]()
    
    override init() {
        super.init()
        fetchCellData()
    }

    func fetchCellData() {
        guard let url = Bundle.main.url(forResource: "Zodiac", withExtension: "json") else { return }

        do {
            let data = try Data(contentsOf: url)
            let cellDatas = try JSONDecoder().decode([MenuData].self, from: data)
            self.cellDatas = cellDatas

        }
        catch {
            print(error)
        }
    }
    
}

//extension MenuCellViewModel: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return cellDatas.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell: MenuCell = tableView.dequeueReusableCell(for: indexPath)
//        cell.setupCell(with: cellDatas[indexPath.row])
//        return cell
//    }
//
//}
