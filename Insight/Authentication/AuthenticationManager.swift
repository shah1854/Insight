//
//  AuthenticationManager.swift
//  Insight
//
//  Created by Mihir Shah on 6/17/24.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel {
    let uid: String
    let email: String?
//    let interest1: String
//    let interest2: String
//    let interest2: String
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
    }
}

struct UserInfo {
    let uid: String
    let email: String?
    let name: String?
    let interest1: String?
    let interest2: String?
    let interest3: String?
}

final class AuthenticationManager: ObservableObject {
    static let shared = AuthenticationManager()
    
    private init() { }
    
    func getUser() throws -> AuthDataResultModel{
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        
        return AuthDataResultModel(user: user)
    }
    
    func createUser(email: String, password: String) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResult.user)
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
}
