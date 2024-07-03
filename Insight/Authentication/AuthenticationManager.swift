//
//  AuthenticationManager.swift
//  Insight
//
//  Created by Mihir Shah on 6/17/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

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
    
    func createUser(name: String, email: String, password: String, interest1: String, interest2: String, interest3: String) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        
        let db = Firestore.firestore()
        let docData: [String: Any] = ["Name": name,
                                      "Email": email,
                                      "Interest1": interest1,
                                      "Interest2": interest2,
                                      "Interest3": interest3]
        do {
            try await db.collection("users").document(authDataResult.user.uid).setData(docData)
          print("Document successfully written!")
        } catch {
          print("Error writing document: \(error)")
        }

        return AuthDataResultModel(user: authDataResult.user)
    }
    
    func login(email: String, password: String) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().signIn(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResult.user)
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
}
