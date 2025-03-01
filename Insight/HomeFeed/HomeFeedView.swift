//
//  HomeFeedView.swift
//  Insight
//
//  Created by Mihir Shah on 6/14/24.
//

import SwiftUI

struct HomeFeedView: View {
    @ObservedObject private var viewModel = HomeFeedViewModel()
    var body: some View {
        
        NavigationSplitView {
            List(viewModel.articles) { article in
                NavigationLink {
                    ArticleView(article: article)
                } label: {
                    VStack {
                        Text(article.title)
                            .font(.headline)
                        Text(article.summary)
                            .font(.subheadline)
                    }
                }
            }
            .navigationTitle("Articles")
            .onAppear() {
                self.viewModel.fetchData()
            }
        } detail: {
            Text("Select Article")
        }
    }
}

#Preview {
    HomeFeedView()
}
