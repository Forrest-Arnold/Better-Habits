//
//  HabitDetailCreation.swift
//  Better-Habits
//
//  Created by Forrest Kalani Arnold on 4/12/25.
//

import SwiftUI

struct HabitDetailCreation: View {
    @EnvironmentObject var habitVM: HabitVM
    @ObservedObject var selectedHabit: Habit
    @State private var goalSet = true
    @State private var leastMostOption = "At Least"
    @State private var timeOption = "times"
    @State private var tickerValue = 3
    @State private var dayOption = "Week"
    
    // Navigation Variables
    @Environment(\.dismiss) var dismiss
    @State private var showPopup = false
    
    var body: some View {
        ZStack {
            CreationTopBar(
                currentColor: $selectedHabit.color,
                showNameView: .constant(false),
                showGoalView: .constant(true),
                habitName: selectedHabit
            )
            .environmentObject(habitVM)
            VStack {
                VStack {
                    colorPicker
                    trackingType
                    goalSetting
                    HStack(spacing: -40) {
                        stepperSection
                        timePickerSection
                    }
                    dayPickerSection
                    divider
                    actionButtons
                }
                .padding(.bottom, 110)
                .foregroundStyle(.black)
            }

            // Popup view
            if showPopup {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        showPopup = false
                    }

                SchedulePopup(selectedHabit: selectedHabit)
                    .transition(.scale)
                    .zIndex(1)
            }
        }
        .animation(.easeInOut, value: showPopup)
        .navigationBarBackButtonHidden()
    }

}

private extension HabitDetailCreation {
    var colorPicker: some View {
        ColorPicker("Pick your habit color", selection: $selectedHabit.color)
            .padding(.horizontal, 100)
    }
    
    var trackingType: some View {
        VStack {
            Text("Tracking Type")
                .padding(.vertical, 8)
            
            Divider()
                .background(Color.black)
                .frame(height: 1)
                .padding(.vertical, 8)
        }
    }
    
    var goalSetting: some View {
        Toggle(isOn: $goalSet) {
            Text("Set a Goal?")
        }
        .padding(.horizontal, 128)
    }
    
    var stepperSection: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 1)
                    .foregroundStyle(.gray)
                    .frame(width: 150, height: 60)
                HStack {
                    Stepper("", value: $tickerValue)
                        .labelsHidden()
                    Text("\(tickerValue)")
                        .foregroundColor(.black)
                        .font(.title3)
                        .padding(.leading, 12)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    var timePickerSection: some View {
        HStack {
            Menu {
                Button("times") { timeOption = "times" }
                Button("minutes") { timeOption = "minutes" }
                Button("hours") { timeOption = "hours" }
            } label: {
                Label(timeOption, systemImage: "chevron.down")
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
            }
        }
        .padding(.trailing, 70)
    }
    
    var dayPickerSection: some View {
        HStack {
            Menu {
                Button("Day") { dayOption = "Day" }
                Button("Week") { dayOption = "Week" }
                Button("Month") { dayOption = "Month" }
                Button("Year") { dayOption = "Year" }
            } label: {
                Label(dayOption, systemImage: "chevron.down")
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 70)
    }
    
    var divider: some View {
        Divider()
            .background(Color.black)
            .frame(height: 1)
            .padding(.vertical, 8)
    }
    
    var actionButtons: some View {
        HStack {
            actionButton(label: "Back") {
                dismiss()
            }

            actionButton(label: "Next") {
                showPopup = true
                // Make all habit changes to selectedHabit and append selected habit to myHabits in my View Model
            }
        }
    }
    
    func actionButton(label: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.gray)
                    .opacity(0.2)
                    .frame(width: 120, height: 60)
                Text(label)
            }
        }
    }
}

struct HabitDetailCreation_Previews: PreviewProvider {
    @State static var selectedHabit = Habit(name: "Nothing", color: Color.random())
    
    static var previews: some View {
        HabitDetailCreation(
            selectedHabit: selectedHabit
        )
        .environmentObject(HabitVM())
    }
}
