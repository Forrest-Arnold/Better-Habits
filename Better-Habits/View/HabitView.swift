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
                HabitRowView(habit: habit)
            }
        }
    }
}

#Preview {
    HabitView()
        .environmentObject(HabitVM())
}
