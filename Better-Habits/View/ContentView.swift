//
//  ContentView.swift
//  Better-Habits
//
//  Created by Forrest Kalani Arnold on 4/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundStyle(.gray)
                .opacity(0.2)
            VStack(spacing: 0) {
                Topbar()
                HStack {
                    Text("Daily Goals")
                        .font(.title3)
                    Spacer()
                    ZStack {
                        Circle()
                            .frame(width: 36, height: 36)
                            .foregroundStyle(.gray)
                        Circle()
                            .frame(width: 30, height: 30)
                            .foregroundStyle(.white)
                        Image(systemName: "chevron.down")
                            .resizable()
                            .frame(width: 13, height: 7)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top)
                GoalView()
            }
        }
    }
}

#Preview {
    ContentView()
}
