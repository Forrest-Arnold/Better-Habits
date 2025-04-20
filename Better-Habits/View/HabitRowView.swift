//
//  HabitRowView.swift
//  Better-Habits
//
//  Created by Forrest Kalani Arnold on 4/20/25.
//

import SwiftUI

struct HabitRowView: View {
    @ObservedObject var habit: Habit
    @EnvironmentObject var habitVM: HabitVM

    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.white)
            VStack(alignment: .leading, spacing: 2) {
                HStack(spacing: 4) {
                    Text(habit.name)
                        .foregroundStyle(habit.textColor)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 10)
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(habit.color)
                        }
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(habit.streak > 0 ? .gray : .orange)
                        HStack(spacing: 2) {
                            Text("\(habit.streak)")
                            Image(systemName: "flame")
                        }
                    }
                    .frame(width: 40, height: 32)
                    Spacer()
                    Button {
                        habitVM.AddCompleation(habit: habit)
                    } label: {
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
                        .foregroundStyle(.black)
                    }
                }
                Text("\(habit.compleationCount) / \(habit.timeNumber) times per \(habit.day)")
                    .padding(.leading, 4)
                Divider()
                HStack(alignment: .center) {
                    ForEach(habitVM.daysShorter, id: \.self) { day in
                        VStack {
                            Circle()
                                .foregroundStyle(habit.scheduleDays.contains(day) ? .pink : .gray)
                                .opacity(0.8)
                                .frame(width: 36, height: 36)
                            Text(day)
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
    HabitRowView(habit: Habit(name: "Nothing", color: Color.random()))
        .environmentObject(HabitVM())
}
