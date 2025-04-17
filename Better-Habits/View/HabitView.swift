//
//  GoalView.swift
//  Better-Habits
//
//  Created by Forrest Kalani Arnold on 4/12/25.
//

import SwiftUI

struct HabitView: View {
    @EnvironmentObject var habitVM: HabitVM
    
    var body: some View {
        ScrollView {
            ForEach(habitVM.myHabits) { habit in
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(.white)
                    VStack(alignment: .leading, spacing: 2) {
                        HStack(spacing: 4) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(.orange)
                                Text(habit.name)
                            }
                            .frame(width: 70, height: 32)
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(.gray)
                                    .opacity(0.4)
                                HStack(spacing: 2) {
                                    Text("\(habit.streak)")
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
                        // This part needs to be changed or removed *******
                        Text("Today, 0 / 2 hours")
                            .padding(.leading, 4)
                        Divider()
                        HStack(alignment: .center) {
                            // I want to check if this habits day is selected, if so then present pink, otherwise present gray *******
                            ForEach(habitVM.daysShorter, id: \.self) { day in
                                VStack {
                                    Circle()
                                        .foregroundStyle(.pink)
                                        .opacity(0.8)
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
    }
}

#Preview {
    HabitView()
        .environmentObject(HabitVM())
}
