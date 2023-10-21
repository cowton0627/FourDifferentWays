//
//  FourthCellViewModel.swift
//  FourDifferentWays
//
//  Created by Chun-Li Cheng on 2021/12/17.
//

import Foundation

class FourthCellViewModel: RowViewModel {
    var type: CustomCellType {
        return .user
    }
    
//    let title: String
//    let titleTitle: String
//    init(title: String, titleTitle: String) {
//        self.title = title
//        self.titleTitle = titleTitle
//    }
    
    var cellItems: [FourthItem] = [
        FourthItem(title: "目前登入帳號", titleTitle: "Charles")
    ]
    
    /// 項目數量
    func numberOfItems() -> Int {
        return cellItems.count
    }
    
    /// 項目索引
    func itemAt(_ index: Int) -> FourthItem {
        return cellItems[index]
    }
    
    
}
