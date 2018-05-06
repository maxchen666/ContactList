//
//  PortraitTableViewCell.swift
//  Contact List
//
//  Created by chen yong on 5/5/18.
//  Copyright © 2018 Max Chen. All rights reserved.
//

import Foundation
import UIKit

class PortraitTableViewCell: UITableViewCell {
    var fullname: UILabel!
    var email: UILabel!
    var avatar: UIImageView!
    var favour: UIImageView!
    var id: Int!
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:)")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let container = UIView()
        container.layer.borderColor = UIColor.darkGray.cgColor
        container.layer.borderWidth = 1.0
        contentView.addSubview(container)
        
        container.translatesAutoresizingMaskIntoConstraints = false
        let cLeftContraint = NSLayoutConstraint(item: container, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: contentView, attribute: NSLayoutAttribute.left, multiplier: 1, constant: 10)
        let cTopConstraint = NSLayoutConstraint(item: container, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: contentView, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 5)
        let cWidthConstraint = NSLayoutConstraint(item: container, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: contentView, attribute: NSLayoutAttribute.width, multiplier: 1, constant: -20)
        let cHeightConstraint = NSLayoutConstraint(item: container, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: contentView, attribute: NSLayoutAttribute.height, multiplier: 1, constant: -10)
        NSLayoutConstraint.activate([cLeftContraint, cTopConstraint, cWidthConstraint, cHeightConstraint])

        fullname = UILabel()
        container.addSubview(fullname)

        fullname.translatesAutoresizingMaskIntoConstraints = false
        let fnLeftContraint = NSLayoutConstraint(item: fullname, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: container, attribute: NSLayoutAttribute.left, multiplier: 1, constant: 20)
        let fnTopConstraint = NSLayoutConstraint(item: fullname, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: container, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 160)
        let fnWidthConstraint = NSLayoutConstraint(item: fullname, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: container, attribute: NSLayoutAttribute.width, multiplier: 1, constant: -40)
        let fnHeightConstraint = NSLayoutConstraint(item: fullname, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 20)
        NSLayoutConstraint.activate([fnLeftContraint, fnTopConstraint, fnWidthConstraint, fnHeightConstraint])
        
        email = UILabel()
        container.addSubview(email)
        
        email.translatesAutoresizingMaskIntoConstraints = false
        let eLeftContraint = NSLayoutConstraint(item: email, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: container, attribute: NSLayoutAttribute.left, multiplier: 1, constant: 20)
        let eTopConstraint = NSLayoutConstraint(item: email, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: container, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 180)
        let eWidthConstraint = NSLayoutConstraint(item: email, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: container, attribute: NSLayoutAttribute.width, multiplier: 1, constant: -40)
        let eHeightConstraint = NSLayoutConstraint(item: email, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 20)
        NSLayoutConstraint.activate([eLeftContraint, eTopConstraint, eWidthConstraint, eHeightConstraint])
        
        avatar = UIImageView()
        container.addSubview(avatar)
        
        avatar.translatesAutoresizingMaskIntoConstraints = false
        let aLeftContraint = NSLayoutConstraint(item: avatar, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: container, attribute: NSLayoutAttribute.left, multiplier: 1, constant: 10)
        let aTopConstraint = NSLayoutConstraint(item: avatar, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: container, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 5)
        let aWidthConstraint = NSLayoutConstraint(item: avatar, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 140)
        let aHeightConstraint = NSLayoutConstraint(item: avatar, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 140)
        NSLayoutConstraint.activate([aLeftContraint, aTopConstraint, aWidthConstraint, aHeightConstraint])
        
        favour = UIImageView()
        favour.image = UIImage(named: "noselect.png")
        container.addSubview(favour)
        
        let favourTap = UITapGestureRecognizer(target: self, action: #selector(PortraitTableViewCell.tapFavourIcon))
        favour.isUserInteractionEnabled = true
        favour.addGestureRecognizer(favourTap)
        
        favour.translatesAutoresizingMaskIntoConstraints = false
        let fRightContraint = NSLayoutConstraint(item: favour, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: container, attribute: NSLayoutAttribute.right, multiplier: 1, constant: -10)
        let fTopConstraint = NSLayoutConstraint(item: favour, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: container, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 155)
        let fWidthConstraint = NSLayoutConstraint(item: favour, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 40)
        let fHeightConstraint = NSLayoutConstraint(item: favour, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 40)
        NSLayoutConstraint.activate([fRightContraint, fTopConstraint, fWidthConstraint, fHeightConstraint])
    }
    
    //Action
    @objc func tapFavourIcon() {
        let isFavour = UserDefaults.standard.bool(forKey: String(self.id))
        if isFavour
        {
            UserDefaults.standard.set(false, forKey: String(self.id))
            favour.image = UIImage(named: "noselect.pn")
        }
        else
        {
            UserDefaults.standard.set(true, forKey: String(self.id))
            favour.image = UIImage(named: "select.png")
        }
    }
    
    func update(contact:Contact) -> Void {
        self.fullname.text = contact.fullname
        self.email.text = contact.email
        if(contact.gender.caseInsensitiveCompare("male") == ComparisonResult.orderedSame){
            avatar.image = UIImage(named: "male.png")
        }
        else
        {
            avatar.image = UIImage(named: "female.png")
        }
        
        self.id = contact.id
        let isFavour = UserDefaults.standard.bool(forKey: String(self.id))
        if isFavour
        {
            favour.image = UIImage(named: "select.png")
        }
        else
        {
            favour.image = UIImage(named: "noselect.png")
        }
    }
}
