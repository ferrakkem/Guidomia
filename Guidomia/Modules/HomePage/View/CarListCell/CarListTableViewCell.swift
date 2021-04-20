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
        updateUI(name: carData.make, price: carData.marketPrice, imageName: carData.image)
    }
    
    //MARK: Update the UI Views
    private func updateUI(name: String, price: Int, imageName: String) {
        self.carMakeInfo.text = name
        self.price.text = String(price)
        
        // Before we download the image we clear out the old one
        self.carImage.image = nil
        setImageDataFrom(picture: imageName)
    }
    
    
    // MARK: - Get image data
    private func setImageDataFrom(picture: String) {
        print("setImageDataFrom")
        DispatchQueue.global().async { [weak self] in
            DispatchQueue.main.async {
                print("name :\(picture)")
                self?.carImage?.image = UIImage.init(named: picture)
            }
        }
    }
    
}

/*
 DispatchQueue.global().async { [weak self] in
     let url = URL(string: picture)
     if url != nil{
         if let data = try? Data(contentsOf: url!) {
             if let image = UIImage(data: data) {
                 DispatchQueue.main.async {
                     self?.carImage?.image = image
                 }
             }
         }
     }else{
         DispatchQueue.main.async {
             self?.carImage?.image = UIImage.init(named: "noPicture.png")
         }
     }
 }
 */
