//
//  BTConfiguration.swift
//  BTNavigationDropdownMenu
//
//  Created by Pham Ba Tho on 6/30/15.
//  Copyright (c) 2015 PHAM BA THO. All rights reserved.
//

//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import UIKit

// MARK: BTNavigationDropdownMenu
open class BTNavigationDropdownMenu: UIView {

    open var labelSpacing: CGFloat {
        set {
            configuration.labelSpacing = newValue
        }
        get {
            self.configuration.labelSpacing
        }
    }
    
    open var cellLabelSpacing: CGFloat {
        set {
            configuration.cellLabelSpacing = newValue
        }
        get {
            self.configuration.cellLabelSpacing
        }
    }
    
    // The color of menu title. Default is darkGrayColor()
    open var menuTitleColor: UIColor! {
        get {
            return self.configuration.menuTitleColor
        }
        set(value) {
            self.configuration.menuTitleColor = value
        }
    }
    
    open var menuDetailTextColor: UIColor! {
        get {
            return self.configuration.menuDetailTextColor
        }
        set(value) {
            self.configuration.menuDetailTextColor = value
            self.menuDetailTextLabel?.textColor = value
        }
    }
    
    open var menuDetailTextFont: UIFont! {
        get {
            return self.configuration.menuDetailTextFont
        }
        set(value) {
            self.configuration.menuDetailTextFont = value
        }
    }

    // The height of the cell. Default is 50
    open var cellHeight: NSNumber {
        get {
            return self.configuration.cellHeight as NSNumber
        }
        set(value) {
            self.configuration.cellHeight = CGFloat(truncating: value)
        }
    }

    // The color of the cell background. Default is whiteColor()
    open var cellBackgroundColor: UIColor! {
        get {
            return self.configuration.cellBackgroundColor
        }
        set(color) {
            self.configuration.cellBackgroundColor = color
        }
    }

    // The tint color of the arrow. Default is whiteColor()
    open var arrowTintColor: UIColor! {
        get {
            return self.menuArrow.tintColor
        }
        set(color) {
            self.menuArrow.tintColor = color
        }
    }

    open var cellSeparatorColor: UIColor! {
        get {
            return self.configuration.cellSeparatorColor
        }
        set(value) {
            self.configuration.cellSeparatorColor = value
        }
    }

    // The color of the text inside cell. Default is darkGrayColor()
    open var cellTextLabelColor: UIColor! {
        get {
            return self.configuration.cellTextLabelColor
        }
        set(value) {
            self.configuration.cellTextLabelColor = value
        }
    }

    // The color of the text inside a selected cell. Default is darkGrayColor()
    open var selectedCellTextLabelColor: UIColor! {
        get {
            return self.configuration.selectedCellTextLabelColor
        }
        set(value) {
            self.configuration.selectedCellTextLabelColor = value
        }
    }

    // The font of the text inside cell. Default is HelveticaNeue-Bold, size 17
    open var cellTextLabelFont: UIFont! {
        get {
            return self.configuration.cellTextLabelFont
        }
        set(value) {
            self.configuration.cellTextLabelFont = value
        }
    }

    // The font of the navigation bar title. Default is HelveticaNeue-Bold, size 17
    open var navigationBarTitleFont: UIFont! {
        get {
            return self.configuration.navigationBarTitleFont
        }
        set(value) {
            self.configuration.navigationBarTitleFont = value
            self.menuTitle.font = self.configuration.navigationBarTitleFont
        }
    }

    // The alignment of the text inside cell. Default is .Left
    open var cellTextLabelAlignment: NSTextAlignment! {
        get {
            return self.configuration.cellTextLabelAlignment
        }
        set(value) {
            self.configuration.cellTextLabelAlignment = value
            menuTitle.textAlignment = value
            menuDetailTextLabel?.textAlignment = value
        }
    }

    // The color of the cell when the cell is selected. Default is lightGrayColor()
    open var cellSelectionColor: UIColor! {
        get {
            return self.configuration.cellSelectionColor
        }
        set(value) {
            self.configuration.cellSelectionColor = value
        }
    }

    // The checkmark icon of the cell
    open var checkMarkImage: UIImage! {
        get {
            return self.configuration.checkMarkImage
        }
        set(value) {
            self.configuration.checkMarkImage = value
        }
    }

    // The boolean value that decides if selected color of cell is visible when the menu is shown. Default is false
    open var shouldKeepSelectedCellColor: Bool! {
        get {
            return self.configuration.shouldKeepSelectedCellColor
        }
        set(value) {
            self.configuration.shouldKeepSelectedCellColor = value
        }
    }

    // The animation duration of showing/hiding menu. Default is 0.3
    open var animationDuration: TimeInterval! {
        get {
            return self.configuration.animationDuration
        }
        set(value) {
            self.configuration.animationDuration = value
        }
    }

    // The arrow next to navigation title
    open var arrowImage: UIImage! {
        get {
            return self.configuration.arrowImage
        }
        set(value) {
            self.configuration.arrowImage = value.withRenderingMode(.alwaysTemplate)
            self.menuArrow.image = self.configuration.arrowImage
        }
    }

    // The padding between navigation title and arrow
    open var arrowPadding: CGFloat! {
        get {
            return self.configuration.arrowPadding
        }
        set(value) {
            self.configuration.arrowPadding = value
        }
    }

    // The color of the mask layer. Default is blackColor()
    open var maskBackgroundColor: UIColor! {
        get {
            return self.configuration.maskBackgroundColor
        }
        set(value) {
            self.configuration.maskBackgroundColor = value
        }
    }

    // The opacity of the mask layer. Default is 0.3
    open var maskBackgroundOpacity: CGFloat! {
        get {
            return self.configuration.maskBackgroundOpacity
        }
        set(value) {
            self.configuration.maskBackgroundOpacity = value
        }
    }

    // The boolean value that decides if you want to change the title text when a cell is selected. Default is true
    open var shouldChangeTitleText: Bool! {
        get {
            return self.configuration.shouldChangeTitleText
        }
        set(value) {
            self.configuration.shouldChangeTitleText = value
        }
    }

    open var didSelectItemAtIndexHandler: ((_ indexPath: Int) -> ())?
    open var isShown: Bool!

    fileprivate weak var navigationController: UINavigationController?
    fileprivate var configuration = BTConfiguration()
    fileprivate var topSeparator: UIView!
    fileprivate var menuButton: UIButton!
    fileprivate var menuTitle: UILabel!
    fileprivate var menuDetailTextLabel: UILabel?
    fileprivate var menuArrow: UIImageView!
    fileprivate var backgroundView: UIView!
    fileprivate var tableView: BTTableView!
    fileprivate var items: [BTItem]!
    fileprivate var menuWrapper: UIView!

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /**

     Default init. This will allow the user to define a string or a index where the user can
     pre-define as a default selected. This is specially handy for when it's necessary to
     restore from a saved state

     - parameters:
        - navigationController: The present and visible navigation controller.
        - containerView: The container view. Default is keyWindow.
        - title: An enum to define title to be displayed, can be a string or index of items.
        - items: The array of items to select
     */
    public init(navigationController: UINavigationController? = nil, containerView: UIView = UIApplication.shared.keyWindow!, title: BTTitle, items: [BTItem]) {
        
        let keyWindow = {
            var window: UIWindow?
            if #available(iOS 13, *) {
                window = UIApplication.shared.connectedScenes
                    .compactMap { $0 as? UIWindowScene }
                    .flatMap { $0.windows }
                    .first(where: { $0.isKeyWindow })
            } else {
                window = UIApplication.shared.keyWindow
            }
            return window
        }()
        
        // Key window
        guard let window = keyWindow else {
            super.init(frame: CGRect.zero)
            return
        }

        // Navigation controller
        if let navigationController = navigationController {
            self.navigationController = navigationController
        } else {
            self.navigationController = window.rootViewController?.topMostViewController?.navigationController
        }

        // Get titleSize
        let titleSize: CGSize
        let titleToDisplay: BTItem

        switch title{
        case .index(let index):
            if index < items.count{
                titleToDisplay = items[index]
            } else {
                titleToDisplay = .init(text: "", detailText: "")
            }
        case .title(let title):
            titleToDisplay = title
        }

        titleSize = (titleToDisplay.text as NSString).size(withAttributes: [NSAttributedString.Key.font: self.configuration.navigationBarTitleFont])

        // Set frame
        let frame = CGRect(x: 0, y: 0, width: titleSize.width + (self.configuration.arrowPadding + self.configuration.arrowImage.size.width)*2, height: self.navigationController!.navigationBar.frame.height)

        super.init(frame:frame)

        self.isShown = false
        self.items = items

        // Init button as navigation title
        self.menuButton = UIButton(frame: frame)
        self.menuButton.addTarget(self, action: #selector(BTNavigationDropdownMenu.menuButtonTapped(_:)), for: UIControl.Event.touchUpInside)
        self.addSubview(self.menuButton)
        
        let titleHeight = (titleToDisplay.text as NSString).size(withAttributes: [NSAttributedString.Key.font: configuration.cellTextLabelFont!]).height
        let detailHeight = (titleToDisplay.detailText as NSString).size(withAttributes: [NSAttributedString.Key.font: configuration.cellDetailTextLabelFont!]).height
        let titleFrame: CGRect = titleToDisplay.detailText.isEmpty ? frame : .init(x: 0, y: 0, width: frame.width, height: titleHeight)
        
        self.menuTitle = UILabel(frame: titleFrame)
        self.menuTitle.text = titleToDisplay.text
        self.menuTitle.textColor = self.menuTitleColor
        self.menuTitle.font = self.configuration.navigationBarTitleFont
        self.menuTitle.textAlignment = self.configuration.cellTextLabelAlignment
        self.menuButton.addSubview(self.menuTitle)
        
        if !titleToDisplay.detailText.isEmpty {
            let detailFrame: CGRect = titleToDisplay.detailText.isEmpty ? frame : .init(x: 0, y: titleFrame.maxY, width: frame.width, height: detailHeight)
            menuDetailTextLabel = UILabel(frame: detailFrame)
            menuDetailTextLabel?.text = titleToDisplay.detailText
            menuDetailTextLabel?.textColor = menuDetailTextColor
            menuDetailTextLabel?.font = menuDetailTextFont
            menuDetailTextLabel?.textAlignment = self.configuration.cellTextLabelAlignment
            menuButton.addSubview(menuDetailTextLabel!)
        }
        
        self.menuArrow = UIImageView(image: self.configuration.arrowImage.withRenderingMode(.alwaysTemplate))
        self.menuButton.addSubview(self.menuArrow)

        let menuWrapperBounds = window.bounds

        // Set up DropdownMenu
        self.menuWrapper = UIView(frame: CGRect(x: menuWrapperBounds.origin.x, y: 0, width: menuWrapperBounds.width, height: menuWrapperBounds.height))
        self.menuWrapper.viewIdentifier = "BTNavigationDropDownMenu-MenuWrapper"
        self.menuWrapper.clipsToBounds = true
        self.menuWrapper.autoresizingMask = [ .flexibleWidth, .flexibleHeight ]

        // Init background view (under table view)
        self.backgroundView = UIView(frame: menuWrapperBounds)
        self.backgroundView.backgroundColor = self.configuration.maskBackgroundColor
        self.backgroundView.autoresizingMask = [ .flexibleWidth, .flexibleHeight ]

        let backgroundTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(BTNavigationDropdownMenu.hideMenu));
        self.backgroundView.addGestureRecognizer(backgroundTapRecognizer)

        // Init properties
        self.setupDefaultConfiguration()

        // Init table view
        let tabBarHeight = self.navigationController?.tabBarController?.tabBar.bounds.size.height ?? 0
        let navBarHeight = self.navigationController?.navigationBar.bounds.size.height ?? 0
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        self.tableView = BTTableView(frame: CGRect(x: menuWrapperBounds.origin.x, y: menuWrapperBounds.origin.y + 0.5, width: menuWrapperBounds.width, height: menuWrapperBounds.height + 300 - tabBarHeight - navBarHeight - statusBarHeight), items: items, currentItem: titleToDisplay, configuration: self.configuration)

        self.tableView.selectRowAtIndexPathHandler = { [weak self] (indexPath: Int) -> () in
            guard let selfie = self else {
                return
            }
            selfie.didSelectItemAtIndexHandler!(indexPath)
            if selfie.shouldChangeTitleText! {
                let item = selfie.tableView.items[indexPath]
                selfie.setMenuTitle(item.text)
                self?.menuDetailTextLabel?.text = item.detailText
            }
            self?.hideMenu()
            self?.layoutSubviews()
        }

        // Add background view & table view to container view
        self.menuWrapper.addSubview(self.backgroundView)
        self.menuWrapper.addSubview(self.tableView)

        // Add Line on top
        self.topSeparator = UIView(frame: CGRect(x: 0, y: 0, width: menuWrapperBounds.size.width, height: 0.5))
        self.topSeparator.autoresizingMask = UIView.AutoresizingMask.flexibleWidth
        self.menuWrapper.addSubview(self.topSeparator)

        // Remove MenuWrapper from container view to avoid leaks
        containerView.subviews
            .filter({$0.viewIdentifier == "BTNavigationDropDownMenu-MenuWrapper"})
            .forEach({$0.removeFromSuperview()})

        // Add Menu View to container view
        containerView.addSubview(self.menuWrapper)

        // By default, hide menu view
        self.menuWrapper.isHidden = true
    }

    override open func layoutSubviews() {
        var detailSize: CGSize?
        if let menuDetailTextLabel = menuDetailTextLabel {
            menuDetailTextLabel.sizeToFit()
            detailSize = menuDetailTextLabel.frame.size
        }
        
        let offsetY = detailSize == nil ? 0 : detailSize!.height/2 + labelSpacing/2.0
        
        self.menuTitle.sizeToFit()
        self.menuTitle.center = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2 - offsetY)
        let dY = menuTitle.frame.maxY + labelSpacing/2.0
        if menuDetailTextLabel?.textAlignment == .center {
            self.menuDetailTextLabel?.frame.origin = CGPoint(x: (self.frame.size.width - (detailSize?.width ?? 0))/2.0, y: dY)
        }
        else if menuDetailTextLabel?.textAlignment == .left {
            menuDetailTextLabel?.frame.origin = .init(x: menuTitle.frame.minX, y: dY)
        }
        else {
            let w = detailSize?.width ?? 0
            menuDetailTextLabel?.frame.origin = .init(x: menuTitle.frame.width-w/2.0, y: dY)
        }
        self.menuTitle.textColor = self.configuration.menuTitleColor
        self.menuArrow.sizeToFit()
        self.menuArrow.center = CGPoint(x: self.menuTitle.frame.maxX + self.configuration.arrowPadding, y: menuTitle.center.y)
        self.menuWrapper.frame.origin.y = self.navigationController!.navigationBar.frame.maxY
        self.tableView.reloadData()
    }

    open func show() {
        if self.isShown == false {
            self.showMenu()
        }
    }

    open func hide() {
        if self.isShown == true {
            self.hideMenu()
        }
    }

    open func toggle() {
        if(self.isShown == true) {
            self.hideMenu();
        } else {
            self.showMenu();
        }
    }

    open func updateItems(_ items: [BTItem]) {
        if !items.isEmpty {
            self.tableView.items = items
            self.tableView.reloadData()
        }
    }

    open func setSelected(index: Int) {
        self.tableView.selectedIndexPath = index
        self.tableView.reloadData()

        if self.shouldChangeTitleText! {
            let item = tableView.items[index]
            self.setMenuTitle(item.text)
            self.menuDetailTextLabel?.text = item.detailText
        }
    }

    func setupDefaultConfiguration() {
        self.menuTitleColor = self.navigationController?.navigationBar.titleTextAttributes?[NSAttributedString.Key.foregroundColor] as? UIColor
        self.cellBackgroundColor = self.navigationController?.navigationBar.barTintColor
        self.cellSeparatorColor = self.navigationController?.navigationBar.titleTextAttributes?[NSAttributedString.Key.foregroundColor] as? UIColor
        self.cellTextLabelColor = self.navigationController?.navigationBar.titleTextAttributes?[NSAttributedString.Key.foregroundColor] as? UIColor

        self.arrowTintColor = self.configuration.arrowTintColor
    }

    func showMenu() {
        self.menuWrapper.frame.origin.y = self.navigationController!.navigationBar.frame.maxY

        self.isShown = true

        // Table view header
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 300))
        headerView.backgroundColor = self.configuration.cellBackgroundColor
        self.tableView.tableHeaderView = headerView

        self.topSeparator.backgroundColor = self.configuration.cellSeparatorColor

        // Rotate arrow
        self.rotateArrow()

        // Visible menu view
        self.menuWrapper.isHidden = false

        // Change background alpha
        self.backgroundView.alpha = 0

        // Animation
        self.tableView.frame.origin.y = -CGFloat(self.items.count) * self.configuration.cellHeight - 300

        // Reload data to dismiss highlight color of selected cell
        self.tableView.reloadData()

        self.menuWrapper.superview?.bringSubviewToFront(self.menuWrapper)

        UIView.animate(
            withDuration: self.configuration.animationDuration * 1.5,
            delay: 0,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 0.5,
            options: [],
            animations: {
                self.tableView.frame.origin.y = CGFloat(-300)
                self.backgroundView.alpha = self.configuration.maskBackgroundOpacity },
            completion: nil
        )
    }

    @objc func hideMenu() {
        // Rotate arrow
        self.rotateArrow()

        self.isShown = false

        // Change background alpha
        self.backgroundView.alpha = self.configuration.maskBackgroundOpacity

        UIView.animate(
            withDuration: self.configuration.animationDuration * 1.5,
            delay: 0,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 0.5,
            options: [],
            animations: {
                self.tableView.frame.origin.y = CGFloat(-200)
        }, completion: nil
        )

        // Animation
        UIView.animate(
            withDuration: self.configuration.animationDuration,
            delay: 0,
            options: UIView.AnimationOptions(),
            animations: {
                self.tableView.frame.origin.y = -CGFloat(self.items.count) * self.configuration.cellHeight - 300
                self.backgroundView.alpha = 0 },
            completion: { _ in
                if self.isShown == false && self.tableView.frame.origin.y == -CGFloat(self.items.count) * self.configuration.cellHeight - 300 {
                    self.menuWrapper.isHidden = true
                }
        })
    }

    func rotateArrow() {
        UIView.animate(withDuration: self.configuration.animationDuration, animations: {[weak self] () -> () in
            if let selfie = self {
                selfie.menuArrow.transform = selfie.menuArrow.transform.rotated(by: 180 * CGFloat(Double.pi/180))
            }
        })
    }
    
    func setMenuTitle(_ title: String) {
        self.menuTitle.text = title
    }
    
    @objc func menuButtonTapped(_ sender: UIButton) {
        self.isShown == true ? hideMenu() : showMenu()
    }
}
