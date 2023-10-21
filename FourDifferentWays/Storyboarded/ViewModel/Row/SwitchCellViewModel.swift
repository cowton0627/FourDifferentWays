//
//  SwitchCellViewModel.swift
//  FourDifferentWays
//
//  Created by Chun-Li Cheng on 2021/12/10.
//

import Foundation

class SwitchCellViewModel: RowViewModel {
    var type: CustomCellType { return .switch }
    var rowCount: Int?
    var sectionTitle: String?
    
    let titleText = "接收每日通知"
    let isOn = true

    
}
