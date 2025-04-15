//
//  GoalCreationView.swift
//  Better-Habits
//
//  Created by Forrest Kalani Arnold on 4/12/25.
//

import SwiftUI

struct GoalCreationView: View {
    @ObservedObject var habitVM = HabitVM()
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
            // this is creating an instance of this which may be incorrect
            PremadeHabitView()
        }
        .navigationBarBackButtonHidden()
    }
}

struct PremadeHabitView: View {
    @ObservedObject var habitVM = HabitVM()
    var body: some View {
        HStack {
            Text("Fitness:")
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(habitVM.fitnessHabits, id: \.self) { habit in
                        ZStack {
                            Text(habit.name)
//                                .foregroundStyle()
                                .padding()
                                .background (
                                    RoundedRectangle(cornerRadius: 8)
                                        .foregroundStyle(habit.color)
                                )
                        }
                    }
                }
            }
        }
        HStack {
            Text("Health:")
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(habitVM.healthHabits, id: \.self) { habit in
                        ZStack {
                            Text(habit.name)
                                .padding()
                                .background (
                                    RoundedRectangle(cornerRadius: 8)
                                        .foregroundStyle(habit.color)
                                )
                        }
                    }
                }
            }
        }
        HStack {
            Text("Mind:")
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(habitVM.mindHabits, id: \.self) { habit in
                        ZStack {
                            Text(habit.name)
                                .padding()
                                .background (
                                    RoundedRectangle(cornerRadius: 8)
                                        .foregroundStyle(habit.color)
                                )
                        }
                    }
                }
            }
        }
        HStack {
            Text("Chores:")
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(habitVM.choresHabits, id: \.self) { habit in
                        ZStack {
                            Text(habit.name)
                                .padding()
                                .background (
                                    RoundedRectangle(cornerRadius: 8)
                                        .foregroundStyle(habit.color)
                                )
                        }
                    }
                }
            }
        }
        HStack {
            Text("Reduce:")
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(habitVM.reduceHabits, id: \.self) { habit in
                        ZStack {
                            Text(habit.name)
                                .padding()
                                .background (
                                    RoundedRectangle(cornerRadius: 8)
                                        .foregroundStyle(habit.color)
                                )
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    GoalCreationView()
}
