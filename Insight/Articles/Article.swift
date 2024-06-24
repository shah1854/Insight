//
//  Article.swift
//  Insight
//
//  Created by Mihir Shah on 6/24/24.
//

import Foundation

struct Article: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var article: String
    var url: String
    var summary: String
}
