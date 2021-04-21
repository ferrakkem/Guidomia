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
    @IBOutlet weak var label: UILabel!
    
    var v = CustomView()
    
    var currentIndex = 0
    
    @IBOutlet weak var kh: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - getData for cell
    func setCellWithValuesOf(carData: CarModel) {
        updateUI(name: carData.make, model: carData.model, price: carData.marketPrice, imageName: carData.image, rating: carData.rating, pros: carData.prosList, cons: carData.consList)
    }
    
    func formatNumber(n: Int) -> String {
        let num = abs(Double(n))
        let sign = (n < 0) ? "-" : ""

        switch num {
        case 1_000_000_000...:
            var formatted = num / 1_000_000_000
            formatted = formatted.reduceScale(to: 1)
            return "\(sign)\(formatted)B"

        case 1_000_000...:
            var formatted = num / 1_000_000
            formatted = formatted.reduceScale(to: 1)
            return "\(sign)\(formatted)M"

        case 1_000...:
            var formatted = num / 1_000
            formatted = formatted.reduceScale(to: 1)
            return "\(sign)\(formatted)K"

        case 0...:
            return "\(n)"

        default:
            return "\(sign)\(n)"
        }
    }
    
    //MARK: Update the UI Views
    private func updateUI(name: String, model: String, price: Int, imageName: String, rating: Int, pros: [String], cons:[String] ) {
        
        let carMakeAndModelInfo = name + " " + model
        self.carMakeInfo.text = carMakeAndModelInfo
        let priceAmount = formatNumber(n: price)
        self.price.text = priceAmount
        //setting rating
        self.ratingView.rating = Double(rating)
        
        //setting rating UI
        self.ratingView.settings.updateOnTouch = false
        self.ratingView.backgroundColor = .clear
        // Set the distance between stars
        self.ratingView.settings.starMargin = 2
        
        // Before we download the image we clear out the old one
        self.carImage.image = nil
        setImageDataFrom(picture: imageName)
        
        
        /*
        var vCout = 0
        let yPos = 10
        var heig = 20
        if pros.count > vCout{
            print("pros: \(pros)")
            for i in 0..<pros.count {
                let element = pros[i]
                let split = element.components(separatedBy: ",")
                let labelNum = UILabel()
                labelNum.text = "\n\(split[0])"
                labelNum.backgroundColor = .blue
                labelNum.textAlignment = .center
                labelNum.frame = CGRect( x: 5, y:heig*i + yPos, width:Int(kh.bounds.width) - 10, height: 20)
                self.kh.addSubview(labelNum)
                vCout = vCout + 1
                var frame = self.kh.frame
                frame.size.height = CGFloat(Int(frame.size.height) + heig*i + yPos)
                self.kh.frame = frame
            }
        }

        if cons.count > vCout {
            print("Cons: \(cons)")
            for i in 0..<cons.count {
                let element = cons[i]
                let split = element.components(separatedBy: ",")
                let labelNum = UILabel()
                print("Split 1: \(split[0])")
                labelNum.text = split[0]
                labelNum.backgroundColor = .yellow
                labelNum.textAlignment = .center
                labelNum.frame = CGRect( x:Int(kh.bounds.origin.x)+5, y:yPos, width:Int(kh.bounds.width) - 10, height: 20)
                self.kh.addSubview(labelNum)
                vCout = vCout + 1

            }
        }
       */
        
        
        
    }
    
    // MARK: - Get image data
    private func setImageDataFrom(picture: String) {
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


/*
 let label: UILabel = UILabel()
 label.text = nValue
 label.textColor = .black
 nutrientValueLabel?.backgroundColor = .white
 myStackView.addArrangedSubview(label)
 */
