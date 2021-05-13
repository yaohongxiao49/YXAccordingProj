//
//  YXHomeCollecHeaderReusableView.swift
//  YXAccordingProj
//
//  Created by ios on 2021/5/12.
//

import UIKit

class YXHomeCollecHeaderReusableView: UICollectionReusableView {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        initView()
    }

    //MARK:- 初始化视图
    func initView() {
        
        let bannerView: YXToolFuncCycleScrollView = YXToolFuncCycleScrollView.init(frame: CGRect.init(x: 0, y: self.yxStatusBarHeight + 60, width: self.yxScreenWidth, height: 100), showType: .YXToolFuncCycleScrollTypeEdge, directionType: .YXToolFuncCycleScrollDirectionTypeHorizontal, boolCycle: false, boolDynamic: false, zoomRadio: 1.2, boolPageController: false, boolPageBtn: false)
        bannerView.edgeInsets = UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 10)
        bannerView.yxToolFuncCycleScrollBlock = {(model: YXToolFuncCycleScrollInfoModel) ->() in
            
            NSLog("imgUrl == %@", model.imgUrl)
        }
        bannerView.yxToolFuncCycleScrollMoveBlock = {(index: NSInteger) ->() in
            
            NSLog("page == %d", index)
        }
        addSubview(bannerView)
        
        let arr: NSArray = YXToolFuncCycleScrollInfoModel.arrayOfModelsFromDictionaries(arr: [["imgUrl":"1"], ["imgUrl":"2"], ["imgUrl":"3"]])
        bannerView.imgValueArr = (arr as! NSMutableArray)
        bannerView.cornerRadius = 10
    }
}
