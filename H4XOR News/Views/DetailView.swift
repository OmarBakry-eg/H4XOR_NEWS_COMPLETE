//
//  DetailView.swift
//  H4XOR News
//
//  Created by Omar Bakry on 20/11/2021.
//

import SwiftUI


struct DetailView: View {
    let url : String?
    var body: some View {
       WebView(urlStrig: url ?? "https://github.com/")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://github.com/")
    }
}
