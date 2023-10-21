//
//  ImgCellViewModel.swift
//  FourDifferentWays
//
//  Created by Chun-Li Cheng on 2021/12/10.
//

import Foundation
import UIKit

class ImgCellViewModel: RowViewModel {
    var type: CustomCellType { return .img }
    var rowCount: Int?
    var sectionTitle: String?
    
    
//    let items: [ImgItem] = [
//        ImgItem(picName: "signature", titleText: "星座名"),
//        ImgItem(picName: "rosette", titleText: "系統設定")
//    ]
    
    let image = UIImage(systemName: "signature")
    let text = "星座名"
    let image2 = UIImage(systemName: "rosette")
    let text2 = "系統設定"
    
    /// 給第一個 Section 建構用
    var cellItems: [ImgItem] = [
        ImgItem(picName: "signature", titleText: "星座名")
    ]
    
    var anotherCellItems: [ImgItem] = [
        ImgItem(picName: "rosette", titleText: "系統設定")
    ]
    
    /// 項目數量
    func numberOfItems() -> Int {
        return cellItems.count
    }
    
    func anotherNumberOfItems() -> Int {
        return anotherCellItems.count
    }
    
}
