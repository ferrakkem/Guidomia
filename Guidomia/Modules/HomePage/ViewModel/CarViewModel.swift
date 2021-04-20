//
//  CarViewModel.swift
//  Guidomia
//
//  Created by Ferrakkem Bhuiyan on 2021-04-18.
//

import Foundation

class CarViewModel{
    private var apiService = NetworkManager()
    private var data = [CarModel]()
    
    //MARK: - fetchCarData
    func fetchCarList(completion: @escaping () -> ()) {
        // weak self - prevent retain cycles
        apiService.getCarList { (result) in
            switch result{
            case .success(let lisOfCar):
                self.data = lisOfCar
                //print("List: \(lisOfCar)")
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        if data.count != 0 {
            print(data)
            return data.count
        }
        return 0
    }

    func cellForRowAt (indexPath: IndexPath) -> CarModel {
        print("cellForRowAt")
        return data[indexPath.row]
    }

    func numberOfRows(inSection section: Int) -> Int {
        return data.count
    }

    func didSelect(at indexPath: Int) -> CarModel {
        return data[indexPath]
    }

    func searchGip(indexPath: IndexPath) -> CarModel {
        return data[indexPath.row]
    }
    

    
}



