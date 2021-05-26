//
//  NetwrokManager.swift
//  Giphy
//
//  Created by Ferrakkem Bhuiyan on 2021-04-04.
//

import Foundation

class NetworkManager{
    private var dataTask: URLSessionDataTask?
    
    func getCarList(completion: @escaping(Result<[CarModel], Error>) ->Void){
        
        let url = Bundle.main.url(forResource: "car_list", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        do {
            // Parse the data
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode([CarModel].self, from: data)
            //print(jsonData)
            // Back to the main thread
            DispatchQueue.main.async {
                //print("error***")
                print("jsonData: \(jsonData)")
                completion(.success(jsonData))
            }
        } catch let error {
            print("##error")
            completion(.failure(error))
        }
        
    }
}
