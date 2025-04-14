//
//  CreationTopBar.swift
//  Better-Habits
//
//  Created by Forrest Kalani Arnold on 4/13/25.
//

import SwiftUI

struct CreationTopBar: View {
    @EnvironmentObject var habitVM: HabitVM
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(habitVM.habitColor)
                .offset(y: -80)
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
                    Text("Goal")
                }
            }
        }
        .frame(height: 300)
        .offset(y: -320)
    }
}

#Preview {
    CreationTopBar()
}
