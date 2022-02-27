//
//  SafariView.swift
//  github-client-app
//
//  Created by Susumu Hoshikawa on 2022/02/26.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = SFSafariViewController
    let url: URL
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        let vc = SFSafariViewController(url: url)
        vc.delegate = context.coordinator
        vc.preferredControlTintColor = UIColor(Color.accentColor)
        return vc
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        print(#function)
    }
    
    
    // MARK: - Coordinatorクラス.
    
    class Coordinator: NSObject, SFSafariViewControllerDelegate {
        
        var parent: SafariView
        
        init(_ parent: SafariView) {
            self.parent = parent
        }
        
        // MARK: - SFSafariViewDelegate.
        
        func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
            print(#function)
        }
    }
}

