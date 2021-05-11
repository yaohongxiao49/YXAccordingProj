//
//  YXSizeCategory.swift
//  YXAccordingProj
//
//  Created by ios on 2021/5/11.
//

import Foundation
import UIKit

public extension NSObject {
    
    private struct viewSizeStruct {
        
        /** 安全区域 */
        static var yxSafeAreaInsets : UIEdgeInsets?
        /** 是否是全面屏 */
        static var yxBoolFullScreen : Bool?
        /** 是否是竖屏 */
        static var yxBoolPortrait : Bool?
        
        /** 屏幕宽 */
        static var yxScreenWidth : CGFloat = UIScreen.main.bounds.width
        /** 屏幕高 */
        static var yxScreenHeight : CGFloat = UIScreen.main.bounds.height
        /** 状态栏高 */
        static var yxStatusBarHeight : CGFloat?
        /** 导航栏高 */
        static var yxNavigationHeight : CGFloat?
        /** 工具栏高 */
        static var yxToolHeight : CGFloat?
        /** 最小设定值 */
        static var yxSmallHeight : CGFloat = 0.01
    }
    
    //MARK:- getting/setting
    //FIXME: 获取安全区域
    var yxSafeAreaInsets : UIEdgeInsets {
        
        get {
            return setYXSafeAreaInsets()
        }
    }
    
    //FIXME: 获取是否是全面屏
    var yxBoolFullScreen : Bool {
        
        get {
            return self.yxSafeAreaInsets.bottom > 0.0 ? true : false
        }
    }
    
    //FIXME: 获取是否是竖屏
    var yxBoolPortrait : Bool {
        
        get {
            return UIApplication.shared.isProxy()
        }
    }
    
    //FIXME: 获取屏幕宽度
    var yxScreenWidth : CGFloat {
        
        get {
            return viewSizeStruct.yxScreenWidth
        }
    }
    
    //FIXME: 获取屏幕高度
    var yxScreenHeight : CGFloat {
        
        get {
            return viewSizeStruct.yxScreenHeight
        }
    }
    
    //FIXME: 获取状态栏高度
    var yxStatusBarHeight : CGFloat {
        
        get {
            return self.yxBoolFullScreen ? self.yxSafeAreaInsets.top : 20.0
        }
    }
    
    //FIXME: 获取导航栏高度
    var yxNavigationHeight : CGFloat {
        
        get {
            return 44.0 + self.yxStatusBarHeight
        }
    }
    
    //FIXME: 获取工具栏高度
    var yxToolHeight : CGFloat {
        
        get {
            return 49.0 + self.yxSafeAreaInsets.bottom
        }
    }
    
    //FIXME: 获取最小设定值
    var yxSmallHeight : CGFloat {
        
        get {
            return viewSizeStruct.yxSmallHeight
        }
        set {
            objc_setAssociatedObject(self, &viewSizeStruct.yxSmallHeight, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    
    //MARK:- 设置属性值
    //FIXME: 全面屏尺寸
    func setYXSafeAreaInsets() -> UIEdgeInsets {
        
        if #available(iOS 11.0, *) {
            return UIApplication.shared.windows.last!.safeAreaInsets
        }
        
        return .zero;
    }
}
