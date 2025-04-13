//
//  GoalView.swift
//  Better-Habits
//
//  Created by Forrest Kalani Arnold on 4/12/25.
//

import SwiftUI

struct GoalView: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.white)
            VStack(alignment: .leading, spacing: 2) {
                HStack(spacing: 4) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(.orange)
                        Text("Study")
                    }
                    .frame(width: 70, height: 32)
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(.gray)
                            .opacity(0.4)
                        HStack(spacing: 2) {
                            Text("0")
                            Image(systemName: "flame")
                        }
                    }
                    .frame(width: 40, height: 32)
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 42, height: 42)
                            .foregroundStyle(.gray)
                            .opacity(0.4)
                        RoundedRectangle(cornerRadius: 4)
                            .frame(width: 34, height: 34)
                            .foregroundStyle(.white)
                        Image(systemName: "plus")
                    }
                }
                Text("Today, 0 / 2 hours")
                    .padding(.leading, 4)
                Divider()
                HStack(alignment: .center) {
                        ForEach(1..<8) { day in
                        VStack {
                            Circle()
                                .foregroundStyle(.pink)
                                .opacity(0.8)
                            Text("D-\(day)")
                        }
                    }
                        .padding(.top, 12)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(8)
        }
        .frame(height: 160)
        .padding()
    }
}

#Preview {
    GoalView()
}
