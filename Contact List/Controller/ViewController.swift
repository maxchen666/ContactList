//
//  ViewController.swift
//  Contact List
//
//  Created by chen yong on 5/5/18.
//  Copyright © 2018 Max Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    fileprivate var optionSegmentControl: UISegmentedControl!
    fileprivate var contactTableView: UITableView!
    fileprivate var loadMoreBotton: UIButton!
    
    fileprivate let contactService = ContactService()
    var contacts: [Contact] = []
    var allContacts: [Contact] = []
    var contactTotal: Int = 0
    fileprivate var isPortrait: Bool {
        return view.bounds.size.width < view.bounds.size.height;
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor.white
        
        let options = ["All", "Favourites"]
        optionSegmentControl = UISegmentedControl(items: options)
        optionSegmentControl.selectedSegmentIndex = 0
        view.addSubview(optionSegmentControl)
        optionSegmentControl.addTarget(self, action: #selector(segmentedChanged(_:)), for: .valueChanged)

        optionSegmentControl.translatesAutoresizingMaskIntoConstraints = false
        let osCenterContraint = NSLayoutConstraint(item: optionSegmentControl, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
        let osTopConstraint = NSLayoutConstraint(item: optionSegmentControl, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 32)
        let osWidthConstraint = NSLayoutConstraint(item: optionSegmentControl, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 260)
        let osHeightConstraint = NSLayoutConstraint(item: optionSegmentControl, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 32)
        NSLayoutConstraint.activate([osCenterContraint, osTopConstraint, osWidthConstraint, osHeightConstraint])
        
        contactTableView = UITableView()
        contactTableView.delegate = self
        contactTableView.dataSource = self
        contactTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        contactTableView.register(PortraitTableViewCell.self, forCellReuseIdentifier: "PortraiCell")
        contactTableView.register(LandscapeViewCell.self, forCellReuseIdentifier: "LandscapeCell")
        view.addSubview(contactTableView)
        
        contactTableView.translatesAutoresizingMaskIntoConstraints = false
        let ctLeftContraint = NSLayoutConstraint(item: contactTableView, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.left, multiplier: 1, constant: 5)
        let ctTopConstraint = NSLayoutConstraint(item: contactTableView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: optionSegmentControl, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 10)
        let ctWidthConstraint = NSLayoutConstraint(item: contactTableView, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.width, multiplier: 1, constant: -10)
        let ctBottomConstraint = NSLayoutConstraint(item: contactTableView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: -40)
        NSLayoutConstraint.activate([ctLeftContraint, ctTopConstraint, ctWidthConstraint, ctBottomConstraint])
        
        loadMoreBotton = UIButton(type: UIButtonType.system)
        loadMoreBotton.setTitle("Load more", for: UIControlState.normal)
        loadMoreBotton.addTarget(self, action: #selector(ViewController.loadMoreAction(_:)), for: UIControlEvents.touchUpInside)
        view.addSubview(loadMoreBotton)
        
        loadMoreBotton.translatesAutoresizingMaskIntoConstraints = false
        let lmbCenterContraint1 = NSLayoutConstraint(item: loadMoreBotton, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
        let lmbTopConstraint = NSLayoutConstraint(item: loadMoreBotton, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: contactTableView, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 10)
        let lmbWidthConstraint = NSLayoutConstraint(item: loadMoreBotton, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 120)
        let lmbBottomConstraint = NSLayoutConstraint(item: loadMoreBotton, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: -10)
        NSLayoutConstraint.activate([lmbCenterContraint1, lmbTopConstraint, lmbWidthConstraint, lmbBottomConstraint])
        
    }
    @objc func segmentedChanged(_ segControl: UISegmentedControl) {
        if segControl.selectedSegmentIndex == 0 {
            self.contacts.removeAll()
            for index in 0..<self.contactTotal {
                self.contacts.append(self.allContacts[index])
            }
            
            contactTableView.reloadData()
        }
        else
        {
            self.contacts.removeAll()
            for index in 0..<self.contactTotal {
                let isFavour = UserDefaults.standard.bool(forKey: String(self.allContacts[index].id))
                if isFavour
                {
                    self.contacts.append(self.allContacts[index])
                }
            }
            
            contactTableView.reloadData()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        contactService.LoadContacts(){
            contacts in
            DispatchQueue.main.async {
                self.optionSegmentControl.selectedSegmentIndex = 0
                self.allContacts = contacts
                self.contacts = Array(self.allContacts.prefix(20))
                self.contactTotal = 20
                self.contactTableView.reloadData()
            }
        }
    }
    
    @objc func loadMoreAction(_ sender:UIButton)
    {
        let prevTotal = self.contactTotal
        let total = self.allContacts.count
        
        let thisTotal = total - prevTotal > 20 ? 20: (total - prevTotal)
        self.contactTotal += thisTotal
        
        for index in prevTotal..<self.contactTotal {
            if(self.optionSegmentControl.selectedSegmentIndex == 0)
            {
                self.contacts.append(self.allContacts[index])
            }
            else
            {
                let isFavour = UserDefaults.standard.bool(forKey: String(self.allContacts[index].id))
                if isFavour
                {
                    self.contacts.append(self.allContacts[index])
                }
            }
            
        }
        
        
        UIView.transition(with: self.contactTableView,
                          duration: 1,
                          options: .transitionCurlUp,
                          animations: { self.contactTableView.reloadData() })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isPortrait
        {
            return self.contacts.count
        }
        else
        {
            return (self.contacts.count + 1) / 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isPortrait
        {
            let cell:PortraitTableViewCell = tableView.dequeueReusableCell(withIdentifier: "PortraiCell") as! PortraitTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.update(contact: self.contacts[indexPath.row])
            return cell
        }
        else
        {
            let cell:LandscapeViewCell = tableView.dequeueReusableCell(withIdentifier: "LandscapeCell") as! LandscapeViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.updateLeft(contact: self.contacts[indexPath.row * 2])
            if(indexPath.row * 2 + 1 < self.contacts.count )
            {
                cell.updateRight(contact: self.contacts[indexPath.row * 2 + 1])
            }
            else
            {
                let empty = Contact(id: 0)
                cell.updateRight(contact: empty!)
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        contactTableView.reloadData()
    }
}

