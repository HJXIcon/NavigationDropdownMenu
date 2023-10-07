//
//  BTTableViewCell.swift
//
//  Copyright (c) 2017 PHAM BA THO (phambatho@gmail.com). All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import UIKit

class BTTableViewCell: UITableViewCell {
    
    let horizontalMargin: CGFloat = 20
    
    var checkmarkIcon: UIImageView!
    var cellContentFrame: CGRect!
    var configuration: BTConfiguration!
    
    init(style: UITableViewCell.CellStyle, reuseIdentifier: String?, configuration: BTConfiguration, hasDetailText: Bool) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.configuration = configuration
        
        let titleHeight = ("dd" as NSString).size(withAttributes: [NSAttributedString.Key.font: configuration.cellTextLabelFont!]).height
        
        let detailHeight = hasDetailText ? ("dd" as NSString).size(withAttributes: [NSAttributedString.Key.font: configuration.cellDetailTextLabelFont!]).height : 0
        
        let totalHeight = titleHeight + detailHeight
        
        // Setup cell
        cellContentFrame = CGRect(x: 0, y: 0, width: (UIApplication.shared.keyWindow?.frame.width)!, height: self.configuration.cellHeight)
        
        let y = max(0, (cellContentFrame.height - totalHeight)/2.0 - configuration.cellLabelSpacing/2.0)
        
        self.contentView.backgroundColor = self.configuration.cellBackgroundColor
        self.selectionStyle = .none
        self.textLabel!.textColor = self.configuration.cellTextLabelColor
        self.textLabel!.font = self.configuration.cellTextLabelFont
        self.textLabel!.textAlignment = self.configuration.cellTextLabelAlignment
        
        detailTextLabel?.font = configuration.cellDetailTextLabelFont
        detailTextLabel?.textAlignment = configuration.cellTextLabelAlignment
        detailTextLabel?.textColor = configuration.cellDetailTextLabelColor
        
        if self.textLabel!.textAlignment == .center {
            self.textLabel!.frame = CGRect(x: 0, y: y, width: cellContentFrame.width, height: titleHeight)
            let dY = textLabel!.frame.maxY + configuration.cellLabelSpacing/2.0
            detailTextLabel?.frame = .init(x: 0, y: dY, width: cellContentFrame.width, height: detailHeight)
        } else if self.textLabel!.textAlignment == .left {
            self.textLabel!.frame = CGRect(x: horizontalMargin, y: y, width: cellContentFrame.width, height: titleHeight)
            let dY = textLabel!.frame.maxY + configuration.cellLabelSpacing/2.0
            detailTextLabel?.frame = .init(x: horizontalMargin, y: dY, width: cellContentFrame.width, height: detailHeight)
        } else {
            self.textLabel!.frame = CGRect(x: -horizontalMargin, y: y, width: cellContentFrame.width, height: titleHeight)
            let dY = textLabel!.frame.maxY + configuration.cellLabelSpacing/2.0
            detailTextLabel?.frame = .init(x: -horizontalMargin, y: dY, width: cellContentFrame.width, height: detailHeight)
        }
        
        // Checkmark icon
        var imageSize = configuration.checkMarkImage.size
        if imageSize.height > cellContentFrame.height {
            imageSize.width = cellContentFrame.height
            imageSize.height = cellContentFrame.height
        }
        
        if self.textLabel!.textAlignment == .center {
            self.checkmarkIcon = UIImageView(frame: CGRect(x: cellContentFrame.width - imageSize.width, y: (cellContentFrame.height - imageSize.height)/2, width: imageSize.width, height: imageSize.height))
            
        } else if self.textLabel!.textAlignment == .left {
            self.checkmarkIcon = UIImageView(frame: CGRect(x: cellContentFrame.width - imageSize.width, y: (cellContentFrame.height - imageSize.height)/2, width: imageSize.width, height: imageSize.height))
        } else {
            self.checkmarkIcon = UIImageView(frame: CGRect(x: horizontalMargin, y: (cellContentFrame.height - imageSize.height)/2, width: imageSize.width, height: imageSize.height))
        }
        self.checkmarkIcon.isHidden = true
        self.checkmarkIcon.image = self.configuration.checkMarkImage
        self.checkmarkIcon.contentMode = UIView.ContentMode.scaleAspectFill
        self.contentView.addSubview(self.checkmarkIcon)
        
        // Separator for cell
        let separator = BTTableCellContentView(frame: cellContentFrame)
        if let cellSeparatorColor = self.configuration.cellSeparatorColor {
            separator.separatorColor = cellSeparatorColor
        }
        self.contentView.addSubview(separator)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        self.bounds = cellContentFrame
        self.contentView.frame = self.bounds
    }
}
