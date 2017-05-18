//
//  ViewController.swift
//  meetTheTeam
//
//  Created by Taylor Simpson on 5/10/17.
//  Copyright © 2017 Taylor Simpson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Variables to be set from TeamTableViewController
    var fullName: String?
    var staffTitle: String?
    var avatar: String?
    var bio: String?
    var firstName: String?
    
    // MARK: - IBOutlets to change view heights and to make mods to views
    @IBOutlet weak var bioView: UIView!
    @IBOutlet weak var bioViewHeightContraint: NSLayoutConstraint!
    @IBOutlet weak var bioTextView: UITextView!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    var bioViewHeight: CGFloat! {
        /*
         Here we're using a property observer to execute code whenever
         this value is updated
         */
        
        didSet {
            print("stackViewHeight updated to \(bioViewHeight)")
            UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveEaseIn], animations: {
                self.bioViewHeightContraint.constant = self.bioViewHeight
                self.view.layoutIfNeeded()
            }) { _ in
                self.bioTextView.scrollRangeToVisible(NSRange(location: 0, length: 0))
                print("animation complete")
            }
         }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        bioViewHeight = bioViewHeightContraint.constant
        bioViewHeight = UIScreen.main.bounds.height / 2
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTapGesture()
        bioView.layer.addBorder(edge: .top, color: UIColor(red:0.15, green:0.54, blue:0.90, alpha:1.0), thickness: 10)
        self.title = firstName
        bioLabel.text = fullName
        titleLabel.text = staffTitle
        bioTextView.text = bio
        let url = URL(string: avatar!)
        //Shows an indicator when the images are being downloaded
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: url)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     }
    
    //Configures The Tap Gesture and calls toggelHeight
    func configureTapGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(toggleHeight(sender:)))
        tapGestureRecognizer.numberOfTapsRequired = 1
        bioView.addGestureRecognizer(tapGestureRecognizer)
        }
    
    //changes bioView height when tap gesture is fired
    func toggleHeight(sender: UITapGestureRecognizer) {
        if bioViewHeightContraint.constant == UIScreen.main.bounds.height / 2 {
            // true
            bioViewHeight = UIScreen.main.bounds.height - 80 // gives space for status bar and navigation bar
        } else {
            // false
            bioViewHeight = UIScreen.main.bounds.height / 2
        }
    }
        

}

