//
//  ListController.swift
//  FourDifferentWays
//
//  Created by Chun-Li Cheng on 2021/12/17.
//

import Foundation
import UIKit

extension UITableViewCell {
    public static func cellIdentifier() -> String {
        return String(describing: self)
    }
}

/// ???
class ListController {
    let viewModel: ListViewModel
    
    init(viewModel: ListViewModel = ListViewModel()) {
        self.viewModel = viewModel
    }
    
    func buildViewModels(types: [CustomCellType]) {
        var sectionTable = [String: [RowViewModel]]()
        var viewModel: RowViewModel?
        
        for type in types {
            if type == .menu {
                
            }
        }
        
        if let viewModel = viewModel {
        }
    }
    
    func cellIdentifier(for viewModel: RowViewModel) -> String {
        switch viewModel {
        case is FirstCellViewModel:
            return FirstCell.cellIdentifier()
        case is SectionViewModel:
            return SecondCell.cellIdentifier()
        case is ThirdCellViewModel:
            return ThirdCell.cellIdentifier()
        case is FourthCellViewModel:
            return FourthCell.cellIdentifier()
        default:
            fatalError("Unexpected view model type \(viewModel)")
        }
    }
    
    
}
