//
//  HomeFeedViewModel.swift
//  Insight
//
//  Created by Mihir Shah on 6/24/24.
//

import Foundation
import FirebaseFirestore

class HomeFeedViewModel: ObservableObject{
    @Published var articles = [Article]()
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("articles").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No Documents")
                return
            }
            
            self.articles = documents.map { (queryDocumentSnapshot) -> Article in
                let data = queryDocumentSnapshot.data()
                let title = data["title"] as? String ?? ""
                let article = data["article"] as? String ?? ""
                let url = data["url"] as? String ?? ""
                let summary = data["summary"] as? String ?? ""
                return Article(title: title, article: article, url: url, summary: summary)
            }
        }
    }
}
