//
//  SplashScreenView.swift
//  Insight
//
//  Created by Mihir Shah on 6/26/24.
//

import SwiftUI

struct SplashScreenView: View {
    @State var isActive: Bool = false
    var body: some View {
        ZStack {
            if self.isActive {
                ContentView()
            } else {
                VStack {
                    Image("Vector")
                    Text("Insight")
                        .font(.title)
                        .bold()
                }
                .containerRelativeFrame([.horizontal, .vertical])
                .background(Color.lightPurple)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
