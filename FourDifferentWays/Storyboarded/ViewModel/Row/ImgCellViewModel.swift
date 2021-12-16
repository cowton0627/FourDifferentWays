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
    
    let image = UIImage(systemName: "signature")
    let text = "星座名"
    let image2 = UIImage(systemName: "rosette")
    let text2 = "系統設定"
    
}
