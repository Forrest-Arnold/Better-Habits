//
//  SchedulePopup.swift
//  Better-Habits
//
//  Created by Forrest Kalani Arnold on 4/16/25.
//

import SwiftUI

struct SchedulePopup: View {
    @EnvironmentObject var habitVM: HabitVM
    @ObservedObject var selectedHabit: Habit
    @State private var selectedDays = [""]
    @State private var selectedHour = 0
    @State private var selectedMinute = 0
    @State private var selectedAMPM = 0
    
    let hours = Array(1...12)
    let minutes = ["00", "15", "30", "45"]
    let ampm = ["AM", "PM"]
    
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            TopHabitName
            DaysView
            SelectedDaysView
            Text("at")
            TimePickerView
            Divider()
                .padding()
            SaveOrCancelView
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 20).fill(.white))
        .shadow(radius: 10)
        .frame(maxWidth: 350)
    }
}

private extension SchedulePopup {
    var TopHabitName: some View {
        Text(selectedHabit.name)
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundStyle(selectedHabit.textColor)
            .background(selectedHabit.color)
            .padding(.bottom, 30)
            .bold()
    }
    
    var DaysView: some View {
        HStack {
            ForEach(habitVM.daysShorter, id: \.self) { day in
                Button {
                    if !selectedDays.contains(day) {
                        selectedDays.append(day)
                    } else {
                        selectedDays.removeAll(where: { $0 == day })
                    }
                } label: {
                    ZStack {
                        Circle()
                            .foregroundStyle(.black)
                            .opacity(0.8)
                        Text(day)
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                    }
                    .frame(width: 40, height: 40)
                }
            }
        }
    }
    
    var SelectedDaysView: some View {
        HStack {
            // each selected day text
            ForEach(selectedDays.sorted(), id: \.self) { day in
                Text(day)
            }
        }
    }
    
    var TimePickerView: some View {
        HStack {
            // Hour Picker
            Picker("Hour", selection: $selectedHour) {
                ForEach(0..<hours.count, id: \.self) { index in
                    Text("\(hours[index])")
                        .tag(index)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(width: 80, height: 150)
            
            // Minute Picker
            Picker("Minute", selection: $selectedMinute) {
                ForEach(0..<minutes.count, id: \.self) { index in
                    Text(minutes[index])
                        .tag(index)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(width: 80, height: 150)
            
            // AM/PM Picker
            Picker("AM/PM", selection: $selectedAMPM) {
                ForEach(0..<ampm.count, id: \.self) { index in
                    Text(ampm[index])
                        .tag(index)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(width: 80, height: 150)
        }
    }
    
    var SaveOrCancelView: some View {
        HStack {
            Button {
                // Naviagate back to my HabitDetailCreation
                isPresented = false
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 120, height: 60)
                        .foregroundStyle(.gray)
                        .opacity(0.5)
                    Text("Cancel")
                        .foregroundStyle(.black)
                }
            }
            
            Button {
                // Close popup or navigate back to MainView
                selectedHabit.scheduleDays = selectedDays
                selectedHabit.scheduleHour = selectedHour
                selectedHabit.scheduleMinute = selectedMinute
                selectedHabit.scheduleAmPm = selectedAMPM
                
                // This should now add all the changed habit data to myHabits in my VM
                habitVM.myHabits.append(selectedHabit)
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 140, height: 60)
                        .foregroundStyle(.black)
                    Text("Save Habit")
                        .foregroundStyle(.white)
                }
            }
        }
    }
}


#Preview {
    SchedulePopup(selectedHabit: Habit(name: "Nothing", color: Color.random()), isPresented: .constant(true))
        .environmentObject(HabitVM())
}
