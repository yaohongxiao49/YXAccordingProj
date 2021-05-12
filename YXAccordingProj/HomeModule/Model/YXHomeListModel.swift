//
//  YXHomeListModel.swift
//  YXAccordingProj
//
//  Created by ios on 2021/5/12.
//

import UIKit

let kHomeListName = "kHomeListName"
let kHomeListPixelWidth = "kHomeListPixelWidth"
let kHomeListPixelHeight = "kHomeListPixelHeight"
let kHomeListPrintWidth = "kHomeListPrintWidth"
let kHomeListPrintHeight = "kHomeListPrintHeight"

class YXHomeListModel: NSObject {

    /** 规格名称 */
    var name: NSString!
    /** 像素宽 */
    var pixelWidth: NSInteger!
    /** 像素高 */
    var pixelHeight: NSInteger!
    /** 冲印宽 */
    var printWidth: NSInteger!
    /** 冲印高 */
    var printHeight: NSInteger!
    
    public static func arrayOfModelsFromDictionaries(arr: NSArray) -> NSMutableArray {
        
        let dataAry = NSMutableArray.init()
        for dic: NSDictionary in arr as! [NSDictionary] {
            let model = YXHomeListModel().initWithDic(dic: dic)
            dataAry.add(model)
        }
        
        return dataAry
    }
    
    func initWithDic(dic: NSDictionary) -> Self {
        
        self.name = dic.object(forKey: kHomeListName) as? NSString
        self.pixelWidth = (NSInteger)((dic.object(forKey: kHomeListPixelWidth) as? String)!)
        self.pixelHeight = (NSInteger)((dic.object(forKey: kHomeListPixelHeight) as? String)!)
        self.printWidth = (NSInteger)((dic.object(forKey: kHomeListPrintWidth) as? String)!)
        self.printHeight = (NSInteger)((dic.object(forKey: kHomeListPrintHeight) as? String)!)
        
        return self
    }
    
}
