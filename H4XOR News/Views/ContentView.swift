//
//  ContentView.swift
//  H4XOR News
//
//  Created by Omar Bakry on 20/11/2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager : NetworkManager = NetworkManager()
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(
                    destination: DetailView(url: post.url),
                    label: {
                        HStack {
                            Text(String(post.points))
                            Text(post.title ?? "no title")
                                .padding()
                        }
                    })
                
            }.navigationBarTitle(Text("H4XOR NEWS"))
            
        }
        .onAppear(perform: {
            networkManager.fetchData()
        }) //didLoad, init state => ( flutter hint )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
//
//struct Post : Identifiable {
//    let id :String
//    let title : String
//}
//
//let posts : [Post] = [
//    Post(id: "1", title: "Hello"),
//    Post(id: "2", title: "Bonjour"),
//    Post(id: "3", title: "Hola")
//]
