//
//  Networking.swift
//  H4XOR News
//
//  Created by Omar Bakry on 20/11/2021.
//

import Foundation

class NetworkManager : ObservableObject{
    //@published from it name it published your data to any interseted parts
   @Published var posts : [Post] = [Post]() //List of objs from post class
    func fetchData(){
        let url: URL? = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page")
        var urlReq: URLRequest = URLRequest(url: url!)
        urlReq.httpMethod = "GET"
        let session : URLSession? = URLSession(configuration: .default)
        let task: URLSessionTask? = session?.dataTask(with: urlReq) { (data,res,err) in
            if err == nil{
                if let safeData = data {
                    do{
                   let results = try JSONDecoder().decode(Results.self, from: safeData)
                        DispatchQueue.main.async {
                            self.posts = results.hits
                        } // because this update must happen in main thread
                       
                    } catch{
                    print(error)
                    }
                }
            }
         
        }
        task?.resume()
    }
}
