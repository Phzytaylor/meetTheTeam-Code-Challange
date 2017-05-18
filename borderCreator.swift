//
//  borderCreator.swift
//  meetTheTeam
//
//  Created by Taylor Simpson on 5/11/17.
//  Copyright © 2017 Taylor Simpson. All rights reserved.
//
//This extension allows me to selectively choose which side of a view I want to apply a border to.

import Foundation
import UIKit

extension CALayer {
        
        func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
            
            let border = CALayer()
            
            switch edge {
            case UIRectEdge.top:
                border.frame = CGRect.init(x: 0, y: 0, width: frame.width * 2, height: thickness)
                break
            case UIRectEdge.bottom:
                border.frame = CGRect.init(x: 0, y: frame.height - thickness, width: frame.width, height: thickness)
                break
            case UIRectEdge.left:
                border.frame = CGRect.init(x: 0, y: 0, width: thickness, height: frame.height)
                break
            case UIRectEdge.right:
                border.frame = CGRect.init(x: frame.width - thickness, y: 0, width: thickness, height: frame.height)
                break
            default:
                break
            }
            
            border.backgroundColor = color.cgColor;
            
            self.addSublayer(border)
        }
    }




