//
//  FirstCellViewModel.swift
//  FourDifferentWays
//
//  Created by Chun-Li Cheng on 2021/12/17.
//

import Foundation

class FirstCellViewModel: RowViewModel {

//    let picName: String
//    let titleText: String
//    init(picName: String, titleText: String) {
//        self.picName = picName
//        self.titleText = titleText
//    }
        
    var type: CustomCellType {
        return .img
    }
    
    /// 給第一個 Section 建構用
    var cellItems: [FirstItem] = [
        FirstItem(picName: "signature", titleText: "星座名")
    ]
    
    var anotherCellItems: [FirstItem] = [
        FirstItem(picName: "rosette", titleText: "系統設定")
    ]
    
    /// 項目數量
    func numberOfItems() -> Int {
        return cellItems.count
    }
    
    func anotherNumberOfItems() -> Int {
        return anotherCellItems.count
    }
    
    /// 項目索引
    func itemAt(_ index: Int) -> FirstItem {
        return cellItems[index]
    }
    
    func anotherItemAt(_ index: Int) -> FirstItem {
        return anotherCellItems[index]
    }
}
