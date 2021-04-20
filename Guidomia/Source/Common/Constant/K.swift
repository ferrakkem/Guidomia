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
        static let imageTintColorDuringDownloadSpeed = UIColor(named: "#A0E0E9")
        static let imageTintColorDuringUpSpeed = UIColor(named: "#674982")
        static let backGroundColor = UIColor(named: "#192B37")
    }
    
    struct iPhoneScreen {
        static let screenSize = UIScreen.main.bounds
        static let screenWidth = screenSize.width
        static let screenHeight = screenSize.height
    }
}
