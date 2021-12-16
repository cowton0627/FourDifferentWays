//
//  UserCellViewModel.swift
//  FourDifferentWays
//
//  Created by Chun-Li Cheng on 2021/12/10.
//

import Foundation

class UserCellViewModel: RowViewModel {
    var type: CustomCellType { return .user }
    var rowCount: Int?
    var sectionTitle: String?
    
    let titleText = "目前登入帳號"
    let trailingText = "Charles"
    
}
