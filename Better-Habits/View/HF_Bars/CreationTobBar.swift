//
//  CreationTopBar.swift
//  Better-Habits
//
//  Created by Forrest Kalani Arnold on 4/13/25.
//

import SwiftUI

struct CreationTopBar: View {
    @EnvironmentObject var habitVM: HabitVM
    @Binding var currentColor: Color
    @Binding var showNameView: Bool
    @Binding var showGoalView: Bool
    @Binding var habitName: Habit

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(currentColor)
                .offset(y: -80)

            VStack(spacing: 30) {
                HStack {
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(.leading, 20)

                    VStack {
                        Text("New Habit")
                            .fontWeight(.semibold)
                            .opacity(0.7)

                        if showGoalView {
                            Text(habitName.name)
                                .font(.title3)
                                .fontWeight(.semibold)
                        }
                    }
                    .padding(.trailing, 48)
                    .frame(maxWidth: .infinity)
                }

                HStack(spacing: 70) {
                    Text("Name")
                        .bold(showNameView)
                        .underline(showNameView)
                        .onTapGesture {
                            showNameView = true
                        }

                    Text("Goal")
                        .bold(showGoalView)
                        .underline(showGoalView)
                        .onTapGesture {
                            showGoalView = true
                        }
                }
                .foregroundStyle(.black)
            }
        }
        .offset(y: -340)
        .frame(height: 300)
    }
}

#Preview {
    PreviewWrapper()
}

struct PreviewWrapper: View {
    @State private var showNameView = false
    @State private var showGoalView = false
    @State private var habitName = Habit(name: "Nothing", color: Color.random())
    @State private var currentColor = Color.random()

    var body: some View {
        CreationTopBar(
            currentColor: $currentColor,
            showNameView: $showNameView,
            showGoalView: $showGoalView,
            habitName: $habitName
        )
        .environmentObject(HabitVM())
    }
}
