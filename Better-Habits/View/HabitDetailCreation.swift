//
//  HabitDetailCreation.swift
//  Better-Habits
//
//  Created by Forrest Kalani Arnold on 4/12/25.
//

import SwiftUI

struct HabitDetailCreation: View {
    @EnvironmentObject var habitVM: HabitVM
    @Binding var selectedHabit: Habit
    @Binding var selectedColor: Color
    @State private var goalSet = true
    @State private var leastMostOption = "At Least"
    @State private var timeOption = "minutes"
    @State private var tickerValue = 30
    @State private var dayOption = "Day"
    
    var body: some View {
        ZStack {
            CreationTopBar(
                currentColor: $selectedColor,
                showNameView: .constant(false),
                showGoalView: .constant(true),
                habitName: $selectedHabit
            )
            .environmentObject(habitVM)
            
            VStack {
                colorPicker
                trackingType
                goalSetting
                stepperSection
                timePickerSection
                divider
                actionButtons
            }
            .padding(.bottom, 60)
            .foregroundStyle(.black)
        }
        .navigationBarBackButtonHidden()
    }
}


private extension HabitDetailCreation {
    var colorPicker: some View {
        ColorPicker("Pick your habit color", selection: $selectedColor)
            .onChange(of: selectedColor) { newColor in
                // Sync the selected color with the habit's color
                selectedHabit.color = newColor
            }
            .padding(.horizontal, 106)
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
                        .padding(.leading, 8)
                }
                .padding(.horizontal, 10)
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
            actionButton(label: "Back", action: {})
            actionButton(label: "Next", action: {})
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
    @State static var selectedColor = Color.random()
    @State static var selectedHabit = Habit(name: "Nothing", color: selectedColor)
    
    static var previews: some View {
        HabitDetailCreation(
            selectedHabit: $selectedHabit,
            selectedColor: $selectedColor
        )
        .environmentObject(HabitVM())
    }
}
