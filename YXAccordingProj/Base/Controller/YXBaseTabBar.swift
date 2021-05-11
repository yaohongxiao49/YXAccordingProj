//
//  YXBaseTabBar.swift
//  YXAccordingProj
//
//  Created by ios on 2021/5/10.
//

import UIKit

class YXBaseTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //设置是否半透明
        self.tabBar.isTranslucent = true
        let standardAppearance = self.tabBar.standardAppearance;
        standardAppearance.backgroundEffect = nil;
        standardAppearance.backgroundColor = UIColor.clear;
        standardAppearance.backgroundImage = nil
        standardAppearance.shadowImage = nil
        standardAppearance.shadowColor = UIColor.clear;
        self.tabBar.standardAppearance = standardAppearance;

        initVC()
        initView()
    }

    //MARK:- 初始化视图
    func initView() {
    
        let baseTabBarView = YXBaseTabBarView(frame: CGRect.init(x: 0, y: self.yxScreenHeight - self.yxToolHeight, width: self.tabBar.bounds.width, height: self.yxToolHeight))
        baseTabBarView.yxBaseTabBarViewTapBlock = {(tag) ->() in
            
            self.selectedIndex = tag
        }
        self.view.addSubview(baseTabBarView)
        
        self.tabBar.removeFromSuperview()
    }
    
    //MARK:- 初始化控制器
    func initVC() {
        
        let homeVC = YXHomeVC.init()
        let settingVC = YXUserVC.init()
        
        addChildrenVC(homeVC, title: nil, image: nil, selectedImage: nil);
        addChildrenVC(settingVC, title: nil, image: nil, selectedImage: nil);
    }
    
    //MARK:- 添加控制器
    func addChildrenVC(_ childController: UIViewController, title: String?, image: UIImage?, selectedImage: UIImage?) {
        
//        childController.title = title
//        childController.tabBarItem = UITabBarItem(title: nil, image: image?.withRenderingMode(.alwaysOriginal), selectedImage: selectedImage?.withRenderingMode(.alwaysOriginal))
//        
//        if UIDevice.current.userInterfaceIdiom == .phone {
//            childController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
//        }

        addChild(YXBaseNavigationVC(rootViewController: childController))
    }
}
