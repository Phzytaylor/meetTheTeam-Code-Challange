//
//  TeamTableViewController.swift
//  meetTheTeam
//
//  Created by Taylor Simpson on 5/5/17.
//  Copyright © 2017 Taylor Simpson. All rights reserved.
//
// SwiftyJSON makes the handeling of JSON safer and easier
//
//Kingfisher caches images and improves app performance

import UIKit
import SwiftyJSON
import Kingfisher

class TeamTableViewController: UITableViewController {
    
    //Stores JSON information
    var teamMembers = [teamMemberInformation]()
    
        override func viewDidLoad() {
        super.viewDidLoad()
        
        parseTeamInfoJSON()
        self.title = "Meet The Team"
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 189
    }
    
    //Parses JSON file
    func parseTeamInfoJSON(){
    
        guard let url = Bundle.main.url(forResource: "team", withExtension: "json"), let jsonData = NSData(contentsOf: url) else {
            print ("Error finding JSON File")
            return
        
        }
        let jsonObject = JSON(data: jsonData as Data)
        let teamInfoArray = jsonObject[].arrayValue
        
        for aTeamMember in teamInfoArray {
        let avatar = aTeamMember["avatar"].stringValue
        let bio = aTeamMember["bio"].stringValue
        let firstName = aTeamMember["firstName"].stringValue
        let id = aTeamMember["id"].stringValue
        let lastName = aTeamMember["lastName"].stringValue
        let title = aTeamMember["title"].stringValue
        let teamMember = teamMemberInformation(avatar: avatar, bio: bio, firstName: firstName, id: Int(id), lastName: lastName, title: title)
        teamMembers.append(teamMember)
        
        }
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return teamMembers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamMemberCell", for: indexPath) as! TeamInfoTableViewCell

        let teamMember = teamMembers[indexPath.row]
        let completeName = teamMember.firstName! + " " + teamMember.lastName!
        let url = URL(string: teamMember.avatar!)
        cell.nameLabel.text = completeName
        cell.titleLabel.text = teamMember.title
        let imgSource = ImageResource(downloadURL: url!, cacheKey: teamMember.avatar)
        cell.avatarImageView.setRounded()
        cell.avatarImageView.kf.indicatorType = .activity
        cell.avatarImageView?.kf.setImage(with: imgSource)
        
        return cell

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        let viewController = segue.destination as! ViewController
        let indexPath: IndexPath = self.tableView.indexPathForSelectedRow!
        let teamMember = teamMembers[indexPath.row]
        let fullName = teamMember.firstName! + " " + teamMember.lastName!
        viewController.fullName = fullName
        viewController.avatar = teamMember.avatar
        viewController.staffTitle = teamMember.title
        viewController.bio = teamMember.bio
        viewController.firstName = teamMember.firstName
    }
}

extension UIImageView {
    //extension that allows for the rounding of imageViews
    func setRounded() {
        let radius = self.frame.width / 2
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor(red:0.15, green:0.54, blue:0.90, alpha:1.0).cgColor
        self.layer.borderWidth = 3
}
}

