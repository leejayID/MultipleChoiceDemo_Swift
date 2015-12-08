//
//  MultipleChoiceTableViewCell.swift
//  MultipleChoiceDemo_Swift
//
//  Created by LeeJay on 15/12/8.
//  Copyright © 2015年 以撒网. All rights reserved.
//

import UIKit

protocol CellDelegate: NSObjectProtocol {
    
    func cellForSelect(isSelect: Bool, atIndexPath indexPath: NSIndexPath)
}

class MultipleChoiceTableViewCell: UITableViewCell {

    let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
    let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height

    var isSelecet: Bool = false
    var titleLabel: UILabel = UILabel()
    var selectBtn: UIButton = UIButton()
    var indexPath: NSIndexPath = NSIndexPath()
    
    //Delegate
    weak var delegate: CellDelegate?
    
    //Block
    var CallBackBlock: ((select: Bool, indexPath: NSIndexPath) -> Void)!
    
    var model: MultipleChoiceModel {
        get {
            return self.model
        }
        set(newModel) {
            setBtnSelected(newModel.select!)
            titleLabel.text = newModel.name
            isSelecet = newModel.select!
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        config()
    }
    
    private func config() {
        titleLabel.frame = CGRectMake(10, 10, 100, 30)
        self.contentView.addSubview(titleLabel)
        
        selectBtn.frame = CGRectMake(SCREEN_WIDTH-40, 7, 30, 30)
        selectBtn.setImage(UIImage(named: "selected.png"), forState: .Normal)
        selectBtn.addTarget(self, action: Selector("onBtnClick:"), forControlEvents: .TouchUpInside)
        self.contentView.addSubview(selectBtn)
    }
    
    func setBtnSelected(selected: Bool) {
        if selected {
            selectBtn.setImage(UIImage(named: "selected.png"), forState: .Normal)
        } else {
            selectBtn.setImage(UIImage(named: "unselected.png"), forState: .Normal)
        }
    }
    
    func onBtnClick(sender: UIButton) {
        isSelecet = !isSelecet
        if delegate?.respondsToSelector("cellForSelect:") != nil {
            delegate?.cellForSelect(isSelecet, atIndexPath: indexPath)
        } else if CallBackBlock != nil {
            CallBackBlock(select: isSelecet, indexPath: indexPath)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
