//
//  YXBaseTabBarItemModel.swift
//  YXAccordingProj
//
//  Created by ios on 2021/5/10.
//

import UIKit

public enum YXBaseTabBarItemStateType {
    case YXBaseTabBarItemStateTypeNor
    case YXBaseTabBarItemStateTypeSel
}

class YXBaseTabBarItemModel: NSObject {

    var itemTitle: NSString?
    var norIcon: NSString?
    var selIcon: NSString?
    var norTitleColor: UIColor?
    var selTitleColor: UIColor?
    var type : YXBaseTabBarItemStateType?
}
