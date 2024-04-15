//
//  OpenWebVIEW.swift
//  BakuCafes
//
//  Created by Shahid on 15.04.24.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var url: URL?
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        guard let url = url else {
            print("Invalid URL: nil URL provided.")
            return
        }
        
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
            print("Failed to load page: \(error.localizedDescription)")
            
        }
        
        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            print("Failed to navigate: \(error.localizedDescription)")
        }
    }
}
