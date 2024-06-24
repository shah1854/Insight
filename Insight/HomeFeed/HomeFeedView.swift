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
        NavigationView {
            List(viewModel.articles) { article in
                VStack {
                    Text(article.title)
                        .font(.headline)
                    Text(article.summary)
                        .font(.subheadline)
                }
            }
            .navigationTitle("Articles")
            .onAppear() {
                self.viewModel.fetchData()
            }
        }
    }
}

#Preview {
    HomeFeedView()
}
