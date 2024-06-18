//
//  UserViewModel.swift
//  Insight
//
//  Created by Mihir Shah on 6/17/24.
//

import Foundation

@MainActor
class UserViewModel: ObservableObject {
    
    func logOut() throws {
        try AuthenticationManager.shared.signOut()
    }
}
