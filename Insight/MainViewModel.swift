//
//  MainViewModel.swift
//  Insight
//
//  Created by Mihir Shah on 7/24/24.
//

import Foundation
import FirebaseAuth

class MainViewModel: ObservableObject {
    @Published var currUserID: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currUserID = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedin: Bool {
        return Auth.auth().currentUser != nil
    }
}
