//
//  Habit.swift
//  Better-Habit
//
//  Created by Forrest Kalani Arnold on 4/12/25.
//

import Foundation
import SwiftUI

struct Habit: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var color: Color
    
    var textColor: Color {
        color.isVeryDark ? .white : .black
    }
}
