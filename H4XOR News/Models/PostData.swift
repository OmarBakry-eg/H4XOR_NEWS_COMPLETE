//
//  PostData.swift
//  H4XOR News
//
//  Created by Omar Bakry on 20/11/2021.
//

import Foundation


struct Results : Decodable {
    let hits : [Post]
}

struct Post : Decodable, Identifiable {
    var id: String {
        return objectID!
    }
    let url,title,objectID:String?
    let points : Int
    
}
