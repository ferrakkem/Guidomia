//
//  K.swift
//  Guidomia
//
//  Created by Ferrakkem Bhuiyan on 2021-04-19.
//

import Foundation
import UIKit


struct K{
    
    struct CarList{
        static let cellNibName = "CarListTableViewCell"
        static let cellIdentifier = "carListCellIndetifier"
    }
    
    struct BandColors {
        static let orange = UIColor(named: "FC6016")
        static let darkGray = UIColor(named: "#858585")
        static let lightGray = UIColor(named: "#D5D5D5")
    }
    
    struct iPhoneScreen {
        static let screenSize = UIScreen.main.bounds
        static let screenWidth = screenSize.width
        static let screenHeight = screenSize.height
    }
}


/*
 Orange : #FC6016
 Dark gray : #858585
 Light gray : #D5D5D5
 Line : 4px
 Text : black 45%
 Bullet point text : black
 */
