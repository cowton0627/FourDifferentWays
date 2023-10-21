//
//  ThirdCellViewModel.swift
//  FourDifferentWays
//
//  Created by Chun-Li Cheng on 2021/12/17.
//

import Foundation

class ThirdCellViewModel: RowViewModel {
    var type: CustomCellType {
        return .`switch`
    }
    
//    let title: String
//    let isOn: Bool
//    init(title: String, isOn: Bool) {
//        self.title = title
//        self.isOn = isOn
//    }
    
    var cellItems: [ThirdItem] = [
        ThirdItem(title: "接收每日通知", isOn: true)
    ]
    
    /// 項目數量
    func numberOfItems() -> Int {
        return cellItems.count
    }
    
    /// 項目索引
    func itemAt(_ index: Int) -> ThirdItem {
        return cellItems[index]
    }
    
    
}
