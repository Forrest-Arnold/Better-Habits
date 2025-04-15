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
            // this is not showing up for some reason
            CreationTopBar()
            Text("What would you like to track?")
                .padding(.vertical, 6)
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
                Divider()
                    .background(Color.black)
                    .frame(height: 1)
                    .padding(.vertical, 18)
                Text("Try a suggestion...")
                    .background(Rectangle().foregroundStyle(.white))
            }
            // this is creating an instance of this which may be incorrect
            PremadeHabitView(habitVM: habitVM)
            Divider()
                .background(Color.black)
                .frame(height: 1)
                .padding(.vertical, 8)
            HStack {
                HStack {
                    Button {
                        
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(.gray)
                                .opacity(0.4)
                                .frame(width: 120, height: 60)
                            Text("Cancel")
                        }
                    }
                    Button {
                        
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(.gray)
                                .frame(width: 120, height: 60)
                            Text("Next")
                        }
                    }
                }
                .foregroundStyle(.black)
            }
        }
        .navigationBarBackButtonHidden()
        .padding(10)
    }
}

struct PremadeHabitView: View {
    @ObservedObject var habitVM: HabitVM
    var body: some View {
        HStack {
            Text("Fitness:")
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(habitVM.fitnessHabits, id: \.self) { habit in
                        ZStack {
                            Text(habit.name)
                                .foregroundStyle(habit.textColor)
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
                                .foregroundStyle(habit.textColor)
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
                                .foregroundStyle(habit.textColor)
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
                                .foregroundStyle(habit.textColor)
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
                                .foregroundStyle(habit.textColor)
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
        .environmentObject(HabitVM())
}
