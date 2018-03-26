//
//  BNPopUpView.swift
//  BNComViewKit
//
//  Created by Bherly Novrandy on 3/26/18.
//  Copyright © 2018 Bherly Novrandy. All rights reserved.
//

import UIKit

public protocol BNPopUpViewDelegate: class {
    func popUpViewWillDismiss()
}

public class BNPopUpView: UIView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    
    let nibName = "BNPopUpView"
    var contentView: UIView!
    
    public var delegate: BNPopUpViewDelegate?
    
    public override init(frame: CGRect) {
        // For use in code
        super.init(frame: frame)
        setUpView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        // For use in Interface Builder
        super.init(coder: aDecoder)
        setUpView()
    }
    
    public override func layoutSubviews() {
        self.layoutIfNeeded()
        self.contentView.layer.masksToBounds = true
        self.contentView.clipsToBounds = true
        self.contentView.layer.cornerRadius = 10
    }
    
    private func setUpView() {
        let bundle = Bundle(for: BNPopUpView.self)
        let nib = UINib(nibName: self.nibName, bundle: bundle)
        self.contentView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        addSubview(contentView)
        
        contentView.center = self.center
        contentView.autoresizingMask = []
        contentView.translatesAutoresizingMaskIntoConstraints = true
    }
    
    public func setDescriptionLabel(title: String) {
        self.descriptionLabel.text = title
    }
    
    public func setImageView(link: String) {
        self.imageView.downloadedFrom(link: link)
    }
    
    public func setCloseButtonTitle(title: String) {
        self.closeButton.setTitle(title, for: .normal)
    }
    
    public func setDescriptionLabelColor(color: UIColor) {
        self.descriptionLabel.textColor = color
    }
    
    public func setCloseButtonTitleColor(color: UIColor) {
        self.closeButton.setTitleColor(color, for: .normal)
    }
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        delegate?.popUpViewWillDismiss()
        self.removeFromSuperview()
    }
    
}
