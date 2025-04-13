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
            VStack {
                Topbar()
                HStack {
                    Text("Daily Goals")
                    Spacer()
                    ZStack {
                        Circle()
                            .frame(width: 30, height: 30)
                            .foregroundStyle(.gray)
                        Circle()
                            .frame(width: 24, height: 24)
                            .foregroundStyle(.white)
                        Image(systemName: "chevron.down")
                    }
                }
                .padding(.horizontal, 20)
                GoalView()
            }
        }
    }
}

#Preview {
    ContentView()
}
