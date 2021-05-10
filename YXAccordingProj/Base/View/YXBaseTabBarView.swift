//
//  YXBaseTabBarView.swift
//  YXAccordingProj
//
//  Created by ios on 2021/5/10.
//

import UIKit

typealias YXBaseTabBarViewTapBlock = (Int) ->(Void)

class YXBaseTabBarView: UIView {
    
    var itemModelArr = NSMutableArray.init()
    var yxBaseTabBarViewTapBlock : YXBaseTabBarViewTapBlock?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.clear
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- 初始化视图
    func initView() {
        
        let imgView = UIImageView.init(frame: self.bounds)
        imgView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        self.addSubview(imgView)
        
        initTabBarItem()
        
        let itemWidth = Int(UIScreen.main.bounds.width) / itemModelArr.count
        
        for i in 0 ..< itemModelArr.count {
            let itemView = YXBaseTabBarItemView.init(frame: CGRect.init(x: (itemWidth * Int(i)), y: 0, width: itemWidth, height: Int(self.bounds.height)))
            itemView.itemModel = itemModelArr[i] as? YXBaseTabBarItemModel;
            itemView.tag = i;
            itemView.yxBaseTabBarItemViewTapBlock = {(view) ->() in
                
                self.yxBaseTabBarViewTapBlock!(view.tag)
            }
            self.addSubview(itemView)
        }
    }
    
    //MARK:- 初始化标签
    func initTabBarItem() {
        
        let itemArr = [["title": "首页", "norIcon": "YXHomeTabNorImg", "selIcon": "YXHomeTabSelImg"], ["title": "我的", "norIcon": "YXUserTabNorImg", "selIcon": "YXUserTabSelImg"]]
        
        //项目数据
        for i in 0 ..< itemArr.count {
            let model = YXBaseTabBarItemModel.init()
            model.itemTitle = itemArr[i]["title"]! as NSString
            model.norIcon = itemArr[i]["norIcon"]! as NSString;
            model.selIcon = itemArr[i]["selIcon"]! as NSString;
            model.norTitleColor = UIColor.white;
            model.selTitleColor = UIColor.white;
            itemModelArr.add(model)
        }
    }
}
