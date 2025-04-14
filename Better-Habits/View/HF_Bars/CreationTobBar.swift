//
//  CreationTopBar.swift
//  Better-Habits
//
//  Created by Forrest Kalani Arnold on 4/13/25.
//

import SwiftUI

struct CreationTopBar: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.pink)
                .padding(.bottom, 80)
            VStack(spacing: 30) {
                HStack {
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(.leading, 20)
                    VStack {
                        Text("New Habit")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .opacity(0.7)
                        Text("Habit Name")
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                    .padding(.trailing, 48)
                    .frame(maxWidth: .infinity)
                }
                HStack(spacing: 70) {
                    Text("Name")
                    Text("Color")
                    Text("Goal")
                }
            }
        }
        .frame(height: 300)
        .offset(y: -130)
    }
}

#Preview {
    CreationTopBar()
}
