//
//  YXBaseTabBarItemModel.swift
//  YXAccordingProj
//
//  Created by ios on 2021/5/10.
//

import UIKit

/** 标签栏样式类型 */
public enum YXBaseTabBarItemStateType {
    /** 普通/未选中 */
    case YXBaseTabBarItemStateTypeNor
    /** 选中 */
    case YXBaseTabBarItemStateTypeSel
}

class YXBaseTabBarItemModel: NSObject {

    var vc: YXBaseVC!
    var itemTitle: NSString?
    var norIcon: NSString?
    var selIcon: NSString?
    var norTitleColor: UIColor?
    var selTitleColor: UIColor?
    var type: YXBaseTabBarItemStateType?
}
