//
//  CreateUserViewModel.swift
//  Insight
//
//  Created by Mihir Shah on 7/3/24.
//

import Foundation
@MainActor
class CreateUserViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var interest1 = ""
    @Published var interest2 = ""
    @Published var interest3 = ""
    @Published var name = ""
    
    //@TODO: add password validation
    
    func newUser() {
        guard !email.isEmpty, !password.isEmpty else {
            print("No Email or Password found")
            return
        }
        
        Task {
            do {
                let returnedUserData = try await AuthenticationManager.shared.createUser(name: name, email: email, password: password, interest1: interest1, interest2: interest2, interest3: interest3)
                
                print("Successful Login")
                print(returnedUserData)
            } catch {
                print("Error: \(error)")
            }
        }
    }
}
