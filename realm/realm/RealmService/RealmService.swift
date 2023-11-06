//
//  RealmService.swift
//  realm
//
//  Created by Macmini on 06/11/2023.
//

import Foundation
import RealmSwift
class RealmService {
    private init() {
        
    }
    static let shared = RealmService()
    var realm = try! Realm()
    
    func create<T: Object>(_ object: T) {
        do {
            try realm.write({
                realm.add(object)
            })
        } catch {
            print(error.localizedDescription)
    
        }
    }
    
    func update <T: Object>(_ object: T, with dictionary: [String: Any]) {
        do {
            try realm.write({
                for(key, value) in dictionary {
                    object.setValue(value, forKey: key)
                }
            })
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func delete<T: Object>(_ object: T?) {
        guard let _ = object else { return }
        do {
            try realm.write({
                realm.delete(object!)
            })
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchData<T: Object>(_ model: T.Type, completion: ([T]) -> Void) {
        let data = realm.objects(model)
        let datas = Array(data)
        completion(datas)
    }
}
