//
//  ViewController.swift
//  Guidomia
//
//  Created by Ferrakkem Bhuiyan on 2021-04-16.
//

import UIKit

class ViewController: UIViewController {
    private var apiService = NetworkManager()
    private var carViewModel = CarViewModel()
    @IBOutlet weak var carListTableView: UITableView!
    let hexColor = UIColor()
    
    var selectedIndex = -1
    var isCollapce = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.navigationController?.setNavigationBarColor(color: K.BandColors.backGroundColor)
        
        loadData()
        setTableView()
        navLogoAndIcon()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    //MARK: - navigationBar
    func navLogoAndIcon(){
        let label = UILabel()
        label.textColor = UIColor.white
        label.text = "GUIDOMIA"
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
    }
    
    
    //MARK: - setUp tableView
    func setTableView(){
        carListTableView.register(UINib(nibName: K.CarList.cellNibName, bundle: nil), forCellReuseIdentifier: K.CarList.cellIdentifier)
        carListTableView.separatorColor = hexColor.hexColor(hex: K.BandColors.orange)
        carListTableView.separatorStyle = .none
        carListTableView.reloadData()
    }
    
    //MARK: - Load Data
    func loadData(){
        LoadingStart(messsage: "Loading...")
        carViewModel.fetchCarList { [weak self] in
            DispatchQueue.main.async {
                self?.LoadingStop()
                self?.carListTableView.reloadData()
            }
        }
    }
    
}


//MARK: - UITableViewDelegate
extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data = carViewModel.numberOfRowsInSection(section: section)
        if data == 0{
            self.carListTableView.setEmptyMessage("Nothing to show :(")
        }else{
            self.carListTableView.restore()
        }
        return data
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = carListTableView.dequeueReusableCell(withIdentifier: K.CarList.cellIdentifier, for: indexPath) as! CarListTableViewCell
        let carInfo = carViewModel.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(carData: carInfo)
        cell.layer.shadowOffset = CGSize(width: 0, height: 6)
        // Configure the cell...
        let maskLayer = CAShapeLayer()
        let bounds = cell.bounds
        maskLayer.path = UIBezierPath(roundedRect: CGRect(x: 2, y: 2, width: bounds.width-4, height: bounds.height-4), cornerRadius: 5).cgPath
        cell.layer.mask = maskLayer
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.selectedIndex == indexPath.row && isCollapce == true{
            return 243
        }else{
            return 134
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //print(indexPath.row)
        if selectedIndex == indexPath.row{
            if self.isCollapce == false {
                self.isCollapce = true
            }else{
                self.isCollapce = false
            }
        }else{
            self.isCollapce = true
        }
        
        self.selectedIndex = indexPath.row
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    
    private func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    private func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}


