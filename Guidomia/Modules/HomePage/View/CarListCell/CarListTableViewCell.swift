//
//  CarListTableViewCell.swift
//  Guidomia
//
//  Created by Ferrakkem Bhuiyan on 2021-04-19.
//

import UIKit

class CarListTableViewCell: UITableViewCell {
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var carMakeInfo: UILabel!
    @IBOutlet weak var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    //MARK: - getData for cell
    func setCellWithValuesOf(carData: CarModel) {
        updateUI(name: carData.make, price: carData.marketPrice)
    }
    
    //MARK: Update the UI Views
    private func updateUI(name: String, price: Int) {
        self.carMakeInfo.text = name
        self.price.text = String(price)
    }
    
}
