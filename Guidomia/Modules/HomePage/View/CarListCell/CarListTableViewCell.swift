//
//  CarListTableViewCell.swift
//  Guidomia
//
//  Created by Ferrakkem Bhuiyan on 2021-04-19.
//

import UIKit
import Cosmos

class CarListTableViewCell: UITableViewCell {
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var carMakeInfo: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
    //MARK: - getData for cell
    func setCellWithValuesOf(carData: CarModel) {
        updateUI(name: carData.make, price: carData.marketPrice, imageName: carData.image, rating: carData.rating)
    }
    
    //MARK: Update the UI Views
    private func updateUI(name: String, price: Int, imageName: String, rating: Int ) {
        self.carMakeInfo.text = name
        self.price.text = String(price)
        //setting rating
        self.ratingView.rating = Double(rating)
        self.ratingView.settings.filledBorderColor = UIColor.blue
        self.ratingView.settings.updateOnTouch = false
        self.ratingView.backgroundColor = .clear
        // Set the distance between stars
        ratingView.settings.starMargin = 5
        
        
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
