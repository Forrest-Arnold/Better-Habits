//
//  Better_HabitsApp.swift
//  Better-Habits
//
//  Created by Forrest Kalani Arnold on 4/12/25.
//

import SwiftUI

@main
struct Better_HabitsApp: App {
    @StateObject var habitVM = HabitVM()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(habitVM)
        }
    }
}
