//
//  letsTryTableViewController.swift
//  meetTheTeam
//
//  Created by Taylor Simpson on 5/10/17.
//  Copyright © 2017 Taylor Simpson. All rights reserved.
//

import UIKit

class letsTryTableViewController: UITableViewController {
    
    var firstPoint: CGPoint?
    var secondPoint: CGPoint?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstPoint = CGPoint(x: 0.0, y: 250.0)
        
        secondPoint = CGPoint(x: 500, y: 323)
         addLine(fromPoint: firstPoint! , toPoint: secondPoint!)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    func addLine(fromPoint start: CGPoint, toPoint end:CGPoint) {
        let line = CAShapeLayer()
        let linePath = UIBezierPath()
        linePath.move(to: start)
        linePath.addLine(to: end)
        line.path = linePath.cgPath
        line.strokeColor = UIColor.red.cgColor
        line.lineWidth = 10
        line.lineJoin = kCALineJoinRound
        self.view.layer.addSublayer(line)
    }

}
