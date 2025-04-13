//
//  GoalCreationView.swift
//  Better-Habits
//
//  Created by Forrest Kalani Arnold on 4/12/25.
//

import SwiftUI

struct GoalCreationView: View {
    @State private var habitName = ""
    var body: some View {
        VStack {
            Text("New Habit")
                .font(.title3)
                .fontWeight(.semibold)
            HStack(spacing: 30) {
                Text("Name")
                Text("Color")
                Text("Goal")
            }
            .foregroundStyle(.gray)
            Text("What would you like to track?")
                .fontWeight(.semibold)
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 2)
                    .foregroundStyle(.gray)
                TextField("Name your habit", text: $habitName)
                    .padding(.leading, 12)
            }
            .frame(width: 200, height: 50)
            ZStack {
                Text("Try a suggestion...")
                    .background(Rectangle().foregroundStyle(.white))
                Divider()
            }
        }
    }
}

#Preview {
    GoalCreationView()
}
