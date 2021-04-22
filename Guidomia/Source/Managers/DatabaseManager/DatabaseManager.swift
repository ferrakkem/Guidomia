//
//  DatabaseManager.swift
//  Guidomia
//
//  Created by Ferrakkem Bhuiyan on 2021-04-19.
//

import RealmSwift

class DatabaseManager {
    static let shared = DatabaseManager()

    private let realm = try! Realm()
    var news: Results<RealmModel>?

    // MARK: - Lifecycle
    private init() {}

    // MARK: - Delete Realm Objects
    func delete() {
        try! realm.write {
          realm.deleteAll()
        }
    }

    //MARK: - loadGiphy
    func getCarListData() -> [RealmModel]{
        return Array(realm.objects(RealmModel.self))

    }

    //MARK: - Saving favourite gip
    func saveCarLisLocal(customerPrice: Int, marketPrice: Int, rating: Int, make: String, model: String, imageName: String, pros:String, cons: String){

        let consList = ConsList()
        let prosList = ProsList()
        //arrToSave.map { String(describing: $0) }.joined(separator: ",")
        let carInfo = RealmModel()
        carInfo.customerPrice = customerPrice
        carInfo.marketPrice = marketPrice
        carInfo.rating = rating
        carInfo.make = make
        carInfo.model = model
        carInfo.image = imageName
        save(car: carInfo)
        
    }

    func save(car: RealmModel){
        do{
            try realm.write{
                realm.add(car)
            }
        }catch{
            print("Error during saving time: \(error)")
        }
    }
    
    func saveCons(cons: ConsList){
        do{
            try realm.write{
                realm.add(cons)
            }
        }catch{
            print("Error during saving time: \(error)")
        }
    }
    
    
    func savePros(pros: ProsList){
        do{
            try realm.write{
                realm.add(pros)
            }
        }catch{
            print("Error during saving time: \(error)")
        }
    }
    


}
