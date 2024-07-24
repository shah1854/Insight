//
//  UserViewModel.swift
//  Insight
//
//  Created by Mihir Shah on 6/17/24.
//

import Foundation
import FirebaseFirestore

@MainActor
class UserViewModel: ObservableObject {
//    @Published var user
    
    func logOut() throws {
        try AuthenticationManager.shared.signOut()
        
    }
    
//    let db = Firestore.firestore()
//    
//    func fetchData() {
//        let authUser = try? AuthenticationManager.shared.getUser()
//        db.collection("users").document(String(authUser!.uid)).getDocument(completion: <#T##(DocumentSnapshot?, (any Error)?) -> Void#>)
//        }
//    }
}
