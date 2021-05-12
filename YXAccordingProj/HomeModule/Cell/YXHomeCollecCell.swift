//
//  YXHomeCollecCell.swift
//  YXAccordingProj
//
//  Created by ios on 2021/5/12.
//

import UIKit

class YXHomeCollecCell: UICollectionViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var titleLab: UILabel!
    @IBOutlet weak var pixelTitleLab: UILabel!
    @IBOutlet weak var prixelSizeLab: UILabel!
    @IBOutlet weak var printTitleLab: UILabel!
    @IBOutlet weak var printSizeLab: UILabel!
    @IBOutlet weak var takingPicBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    //MARK:- 拍照按钮事件
    @IBAction func progressTakingPicBtn(_ sender: UIButton) {
    }
}
