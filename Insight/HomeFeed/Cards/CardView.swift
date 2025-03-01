//
//  CardView.swift
//  Insight
//
//  Created by Mihir Shah on 6/24/24.
//

import SwiftUI

struct CardView: View {
//    var article: Article
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.gray)
                .opacity(0.3)
                .frame(width: .infinity, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding()
            VStack(alignment: .leading) {
                
                HStack {
                    Text("Title")
                        .font(.title2)
                        .bold()
                        .frame(alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .padding()
                    Spacer()
                }
            }
            
                
                
        }
    }
}

#Preview {
    CardView()
}
