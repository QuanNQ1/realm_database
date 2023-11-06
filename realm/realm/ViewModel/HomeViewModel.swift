//
//  HomeViewModel.swift
//  realm
//
//  Created by Macmini on 06/11/2023.
//

import Foundation
import RealmSwift

class HomeViewModel {
    var books = [Book]()
    
    func fetchData(completion: (Bool) -> Void) {
        do {
            let realm = try Realm()
            let results = realm.objects(Book.self)
            books = Array(results)
            completion(true)
        } catch {
            completion(false)
        }
    }
    
    func configuration() {
        let realm = try! Realm()
        let path = realm.configuration.fileURL?.path
        print(path)
    }
}
