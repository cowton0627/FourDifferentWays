//
//  SecondCellViewModel.swift
//  FourDifferentWays
//
//  Created by Chun-Li Cheng on 2021/12/17.
//

import Foundation

class SecondCellViewModel: RowViewModel {
    var type: CustomCellType {
        return .menu
    }
    
//    let name: String
//    let picName: String
//    init(name: String, picName: String) {
//        self.name = name
//        self.picName = picName
//    }
    
    var cellItems: [SecondItem] = []
    
    func fetchSecondCellItem() {
        guard let url = Bundle.main.url(forResource: "Zodiac",
                                        withExtension: "json") else { return }
        do {
            let data = try Data(contentsOf: url)
            let cellItems = try JSONDecoder().decode([SecondItem].self, from: data)
            self.cellItems = cellItems
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    /// 項目數量
    func numberOfItems() -> Int {
        return cellItems.count
    }
    
    /// 項目索引
    func itemAt(_ index: Int) -> SecondItem {
        return cellItems[index]
    }
    
}
