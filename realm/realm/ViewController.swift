//
//  ViewController.swift
//  realm
//
//  Created by Macmini on 06/11/2023.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    var homeViewModel = HomeViewModel()
    let book = Book()
    var employees: Results<Book>!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        homeViewModel.addBook(title: "tes2", subTitle: "test2", price: 200)
//        homeViewModel.addBook(title: "tes3", subTitle: "test2", price: 200)
//        homeViewModel.addBook(title: "tes1", subTitle: "test2", price: 200)


        book.title = "hai"
        book.subTitle = "hai"
        book.price = 11200
        
//        RealmService.shared.create(book)
        var realm = try! Realm()
        let book = realm.objects(Book.self).filter {$0.id == "218B4250-B38C-4D0F-A152-61FC267B1C3F" }.first

//        RealmService.shared.update(book!, with: ["title": "update2",
//                                                "subTitle": "update2",
//                                                "price": 12 ,
//                                               ])
        
        RealmService.shared.delete(book)
        
        homeViewModel.fetchData { result in
            if result {
                for data in homeViewModel.books {
                    print("id: \(data.id), title: \(data.title), subTitle: \(data.subTitle), price: \(data.price)")
                }
            } else {
                print ("error")
            }
        }
        
        RealmService.shared.fetchData(Book.self) { result in
            print(result[1].title)
            
        }
    }
}

