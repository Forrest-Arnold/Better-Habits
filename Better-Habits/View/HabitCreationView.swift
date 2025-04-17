//
//  HabitCreationView.swift
//  Better-Habits
//
//  Created by Forrest Kalani Arnold on 4/12/25.
//

// HabitCreationView.swift
// Better-Habits

import SwiftUI

struct HabitCreationView: View {
    @EnvironmentObject var habitVM: HabitVM
    @State private var habitTextFieldName = ""
    @State private var habitName = Habit(name: "Nothing", color: Color.random())
    @State private var selectedColor = Color.random()
    
    // Navigation variables
    @State private var navigateToDetails = false

    var body: some View {
        NavigationStack {
            ZStack {
                CreationTopBar(
                    currentColor: $selectedColor,
                    showNameView: .constant(true),
                    showGoalView: .constant(false),
                    habitName: habitName
                )
                .environmentObject(habitVM)
                
                VStack {
                    headerText
                    habitNameInput
                    suggestionText
                    premadeHabitsView
                    actionButtons
                }
                .navigationBarBackButtonHidden()
                .padding(10)
            }
        }
    }
}

private extension HabitCreationView {
    var headerText: some View {
        Text("What would you like to track?")
            .padding(.vertical, 12)
            .padding(.top, 30)
            .fontWeight(.semibold)
    }
    
    var habitNameInput: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 2)
                .foregroundStyle(.gray)
            TextField("Name your habit", text: $habitTextFieldName)
                .padding(.leading, 12)
        }
        .frame(width: 200, height: 50)
    }
    
    var suggestionText: some View {
        ZStack {
            Divider()
                .background(Color.black)
                .frame(height: 1)
                .padding(.vertical, 18)
            Text("Try a suggestion...")
                .background(Rectangle().foregroundStyle(.white))
        }
    }
    
    var premadeHabitsView: some View {
        PremadeHabitView(habitVM: habitVM) // No change here
    }
    
    var actionButtons: some View {
        HStack {
            actionButton(label: "Cancel", action: {})
            
            NavigationLink(
                destination: HabitDetailCreation(selectedHabit: habitName).environmentObject(habitVM),
                isActive: $navigateToDetails
            ) {
                actionButton(label: "Next") {
                    navigateToDetails = true
                }
            }

        }
        .foregroundStyle(.black)
    }
    
    func actionButton(label: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.gray)
                    .opacity(0.4)
                    .frame(width: 120, height: 60)
                Text(label)
            }
        }
    }
}

struct PremadeHabitView: View {
    @ObservedObject var habitVM: HabitVM // No change here
    
    var body: some View {
        VStack {
            HabitCategoryView(title: "Fitness", habits: $habitVM.fitnessHabits)
            HabitCategoryView(title: "Health", habits: $habitVM.healthHabits)
            HabitCategoryView(title: "Mind", habits: $habitVM.mindHabits)
            HabitCategoryView(title: "Chores", habits: $habitVM.choresHabits)
            HabitCategoryView(title: "Reduce", habits: $habitVM.reduceHabits)
        }
    }
}

struct HabitCategoryView: View {
    let title: String
    @Binding var habits: [Habit] // Correct binding of habits

    var body: some View {
        HStack {
            Text(title + ":")
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach($habits, id: \.self) { $habit in
                        let habitColor = habit.color

                        NavigationLink(destination: HabitDetailCreation(
                            selectedHabit: habit
                        )) {
                            ZStack {
                                Text(habit.name)
                                    .foregroundStyle(habit.textColor)
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 8)
                                            .foregroundStyle(habitColor)
                                    )
                            }
                        }
                    }
                }
            }
        }
    }
}

struct HabitCreationView_Previews: PreviewProvider {
    @State static var selectedColor = Color.random()

    static var previews: some View {
        HabitCreationView()
            .environmentObject(HabitVM())
    }
}
