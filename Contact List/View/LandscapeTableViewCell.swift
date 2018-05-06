//
//  LandscapeTableViewCell.swift
//  Contact List
//
//  Created by chen yong on 5/5/18.
//  Copyright © 2018 Max Chen. All rights reserved.
//

import Foundation
import UIKit

class LandscapeViewCell: UITableViewCell {
    var fullnameLeft: UILabel!
    var emailLeft: UILabel!
    var avatarLeft: UIImageView!
    var favourLeft: UIImageView!
    var idLeft: Int!
    
    var fullnameRight: UILabel!
    var emailRight: UILabel!
    var avatarRight: UIImageView!
    var favourRight: UIImageView!
    var idRight: Int!
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:)")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let containerLeft = UIView()
        containerLeft.layer.borderColor = UIColor.darkGray.cgColor
        containerLeft.layer.borderWidth = 1.0
        contentView.addSubview(containerLeft)
        
        containerLeft.translatesAutoresizingMaskIntoConstraints = false
        let clLeftContraint = NSLayoutConstraint(item: containerLeft, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: contentView, attribute: NSLayoutAttribute.left, multiplier: 1, constant: 10)
        let clTopConstraint = NSLayoutConstraint(item: containerLeft, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: contentView, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 5)
        let clWidthConstraint = NSLayoutConstraint(item: containerLeft, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: contentView, attribute: NSLayoutAttribute.width, multiplier: 0.5, constant: -20)
        let clHeightConstraint = NSLayoutConstraint(item: containerLeft, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: contentView, attribute: NSLayoutAttribute.height, multiplier: 1, constant: -10)
        NSLayoutConstraint.activate([clLeftContraint, clTopConstraint, clWidthConstraint, clHeightConstraint])
        
        fullnameLeft = UILabel()
        containerLeft.addSubview(fullnameLeft)
        
        fullnameLeft.translatesAutoresizingMaskIntoConstraints = false
        let fnlLeftContraint = NSLayoutConstraint(item: fullnameLeft, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: containerLeft, attribute: NSLayoutAttribute.left, multiplier: 1, constant: 20)
        let fnlTopConstraint = NSLayoutConstraint(item: fullnameLeft, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: containerLeft, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 160)
        let fnlWidthConstraint = NSLayoutConstraint(item: fullnameLeft, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: containerLeft, attribute: NSLayoutAttribute.width, multiplier: 1, constant: -40)
        let fnlHeightConstraint = NSLayoutConstraint(item: fullnameLeft, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 20)
        NSLayoutConstraint.activate([fnlLeftContraint, fnlTopConstraint, fnlWidthConstraint, fnlHeightConstraint])
        
        emailLeft = UILabel()
        containerLeft.addSubview(emailLeft)
        
        emailLeft.translatesAutoresizingMaskIntoConstraints = false
        let elLeftContraint = NSLayoutConstraint(item: emailLeft, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: containerLeft, attribute: NSLayoutAttribute.left, multiplier: 1, constant: 20)
        let elTopConstraint = NSLayoutConstraint(item: emailLeft, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: containerLeft, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 180)
        let elWidthConstraint = NSLayoutConstraint(item: emailLeft, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: containerLeft, attribute: NSLayoutAttribute.width, multiplier: 1, constant: -40)
        let elHeightConstraint = NSLayoutConstraint(item: emailLeft, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 20)
        NSLayoutConstraint.activate([elLeftContraint, elTopConstraint, elWidthConstraint, elHeightConstraint])
        
        avatarLeft = UIImageView()
        containerLeft.addSubview(avatarLeft)
        
        avatarLeft.translatesAutoresizingMaskIntoConstraints = false
        let alLeftContraint = NSLayoutConstraint(item: avatarLeft, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: containerLeft, attribute: NSLayoutAttribute.left, multiplier: 1, constant: 10)
        let alTopConstraint = NSLayoutConstraint(item: avatarLeft, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: containerLeft, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 5)
        let alWidthConstraint = NSLayoutConstraint(item: avatarLeft, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 140)
        let alHeightConstraint = NSLayoutConstraint(item: avatarLeft, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 140)
        NSLayoutConstraint.activate([alLeftContraint, alTopConstraint, alWidthConstraint, alHeightConstraint])
        
        favourLeft = UIImageView()
        favourLeft.image = UIImage(named: "noselect.png")
        containerLeft.addSubview(favourLeft)
        
        let favourTapLeft = UITapGestureRecognizer(target: self, action: #selector(tapFavourIconLeft))
        favourLeft.isUserInteractionEnabled = true
        favourLeft.addGestureRecognizer(favourTapLeft)
        
        favourLeft.translatesAutoresizingMaskIntoConstraints = false
        let flRightContraint = NSLayoutConstraint(item: favourLeft, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: containerLeft, attribute: NSLayoutAttribute.right, multiplier: 1, constant: -10)
        let flTopConstraint = NSLayoutConstraint(item: favourLeft, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: containerLeft, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 155)
        let flWidthConstraint = NSLayoutConstraint(item: favourLeft, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 40)
        let flHeightConstraint = NSLayoutConstraint(item: favourLeft, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 40)
        NSLayoutConstraint.activate([flRightContraint, flTopConstraint, flWidthConstraint, flHeightConstraint])
        // right
        
        let containerRight = UIView()
        containerRight.layer.borderColor = UIColor.darkGray.cgColor
        containerRight.layer.borderWidth = 1.0
        contentView.addSubview(containerRight)
        
        containerRight.translatesAutoresizingMaskIntoConstraints = false
        let crRightContraint = NSLayoutConstraint(item: containerRight, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: contentView, attribute: NSLayoutAttribute.right, multiplier: 1, constant: -10)
        let crTopConstraint = NSLayoutConstraint(item: containerRight, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: contentView, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 5)
        let crWidthConstraint = NSLayoutConstraint(item: containerRight, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: contentView, attribute: NSLayoutAttribute.width, multiplier: 0.5, constant: -20)
        let crHeightConstraint = NSLayoutConstraint(item: containerRight, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: contentView, attribute: NSLayoutAttribute.height, multiplier: 1, constant: -10)
        NSLayoutConstraint.activate([crRightContraint, crTopConstraint, crWidthConstraint, crHeightConstraint])
        
        fullnameRight = UILabel()
        containerRight.addSubview(fullnameRight)
        
        fullnameRight.translatesAutoresizingMaskIntoConstraints = false
        let fnrLeftContraint = NSLayoutConstraint(item: fullnameRight, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: containerRight, attribute: NSLayoutAttribute.left, multiplier: 1, constant: 20)
        let fnrTopConstraint = NSLayoutConstraint(item: fullnameRight, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: containerRight, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 160)
        let fnrWidthConstraint = NSLayoutConstraint(item: fullnameRight, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: containerRight, attribute: NSLayoutAttribute.width, multiplier: 1, constant: -40)
        let fnrHeightConstraint = NSLayoutConstraint(item: fullnameRight, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 20)
        NSLayoutConstraint.activate([fnrLeftContraint, fnrTopConstraint, fnrWidthConstraint, fnrHeightConstraint])
        
        emailRight = UILabel()
        containerRight.addSubview(emailRight)
        
        emailRight.translatesAutoresizingMaskIntoConstraints = false
        let erLeftContraint = NSLayoutConstraint(item: emailRight, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: containerRight, attribute: NSLayoutAttribute.left, multiplier: 1, constant: 20)
        let erTopConstraint = NSLayoutConstraint(item: emailRight, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: containerRight, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 180)
        let erWidthConstraint = NSLayoutConstraint(item: emailRight, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: containerRight, attribute: NSLayoutAttribute.width, multiplier: 1, constant: -40)
        let erHeightConstraint = NSLayoutConstraint(item: emailRight, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 20)
        NSLayoutConstraint.activate([erLeftContraint, erTopConstraint, erWidthConstraint, erHeightConstraint])
        
        avatarRight = UIImageView()
        containerRight.addSubview(avatarRight)
        
        avatarRight.translatesAutoresizingMaskIntoConstraints = false
        let arLeftContraint = NSLayoutConstraint(item: avatarRight, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: containerRight, attribute: NSLayoutAttribute.left, multiplier: 1, constant: 10)
        let arTopConstraint = NSLayoutConstraint(item: avatarRight, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: containerRight, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 5)
        let arWidthConstraint = NSLayoutConstraint(item: avatarRight, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 140)
        let arHeightConstraint = NSLayoutConstraint(item: avatarRight, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 140)
        NSLayoutConstraint.activate([arLeftContraint, arTopConstraint, arWidthConstraint, arHeightConstraint])
        
        favourRight = UIImageView()
        favourRight.image = UIImage(named: "noselect.png")
        containerRight.addSubview(favourRight)
        
        let favourTapRight = UITapGestureRecognizer(target: self, action: #selector(tapFavourIconRight))
        favourRight.isUserInteractionEnabled = true
        favourRight.addGestureRecognizer(favourTapRight)
        
        favourRight.translatesAutoresizingMaskIntoConstraints = false
        let frRightContraint = NSLayoutConstraint(item: favourRight, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: containerRight, attribute: NSLayoutAttribute.right, multiplier: 1, constant: -10)
        let frTopConstraint = NSLayoutConstraint(item: favourRight, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: containerRight, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 155)
        let frWidthConstraint = NSLayoutConstraint(item: favourRight, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 40)
        let frHeightConstraint = NSLayoutConstraint(item: favourRight, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 40)
        NSLayoutConstraint.activate([frRightContraint, frTopConstraint, frWidthConstraint, frHeightConstraint])
    }
    
    //Action
    @objc func tapFavourIconLeft() {
        let isFavour = UserDefaults.standard.bool(forKey: String(self.idLeft))
        if isFavour
        {
            UserDefaults.standard.set(false, forKey: String(self.idLeft))
            favourLeft.image = UIImage(named: "noselect.pn")
        }
        else
        {
            UserDefaults.standard.set(true, forKey: String(self.idLeft))
            favourLeft.image = UIImage(named: "select.png")
        }
    }
    
    //Action
    @objc func tapFavourIconRight() {
        if(self.idRight == 0)
        {
            return
        }
        let isFavour = UserDefaults.standard.bool(forKey: String(self.idRight))
        if isFavour
        {
            UserDefaults.standard.set(false, forKey: String(self.idRight))
            favourRight.image = UIImage(named: "noselect.pn")
        }
        else
        {
            UserDefaults.standard.set(true, forKey: String(self.idRight))
            favourRight.image = UIImage(named: "select.png")
        }
    }
    
    func updateLeft(contact:Contact) -> Void {
        self.fullnameLeft.text = contact.fullname
        self.emailLeft.text = contact.email
        if(contact.gender.caseInsensitiveCompare("male") == ComparisonResult.orderedSame){
            avatarLeft.image = UIImage(named: "male.png")
        }
        else
        {
            avatarLeft.image = UIImage(named: "female.png")
        }
        
        self.idLeft = contact.id
        let isFavour = UserDefaults.standard.bool(forKey: String(self.idLeft))
        if isFavour
        {
            favourLeft.image = UIImage(named: "select.png")
        }
        else
        {
            favourLeft.image = UIImage(named: "noselect.png")
        }
    }
    
    func updateRight(contact:Contact) -> Void {
        if(contact.id == 0)
        {
            self.idRight = 0
            self.fullnameRight.text = ""
            self.emailRight.text = ""
            self.avatarRight.image = nil
            self.favourRight.image = nil
            return
        }
        
        self.fullnameRight.text = contact.fullname
        self.emailRight.text = contact.email
        if(contact.gender.caseInsensitiveCompare("male") == ComparisonResult.orderedSame){
            avatarRight.image = UIImage(named: "male.png")
        }
        else
        {
            avatarRight.image = UIImage(named: "female.png")
        }
        
        self.idRight = contact.id
        let isFavour = UserDefaults.standard.bool(forKey: String(self.idRight))
        if isFavour
        {
            favourRight.image = UIImage(named: "select.png")
        }
        else
        {
            favourRight.image = UIImage(named: "noselect.png")
        }
    }
}
