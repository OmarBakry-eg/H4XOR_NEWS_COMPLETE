//
//  WebView.swift
//  H4XOR News
//
//  Created by Omar Bakry on 20/11/2021.
//

import Foundation
import WebKit
import SwiftUI

struct WebView : UIViewRepresentable {
    let urlStrig : String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlStrig {
            if let url = URL(string: safeString){
                let req = URLRequest(url: url)
                uiView.load(req)
            }
            
        }
    }
  
}
