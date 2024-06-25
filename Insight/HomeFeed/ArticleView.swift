//
//  ArticleView.swift
//  Insight
//
//  Created by Mihir Shah on 6/24/24.
//

import SwiftUI

struct ArticleView: View {
    var article: Article
    var body: some View {
        ScrollView {
            VStack(alignment: .leading ){
                Text(article.title)
                    .font(.largeTitle)
                    .bold()
                
//            @TODO: use unsplash for images
                Image(systemName: "photo.artframe")
                    .resizable()
                    .scaledToFit()
                
                Text(article.article)
                
                Text("URL: \(article.url)")
                    .foregroundStyle(Color(.blue))
            }
            .padding()
            .frame(alignment: .topLeading)
        }
    }
}

//#Preview {
////    ArticleView()
//}
