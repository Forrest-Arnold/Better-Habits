//
//  HabitDetailCreation.swift
//  Better-Habits
//
//  Created by Forrest Kalani Arnold on 4/12/25.
//

import SwiftUI

struct HabitDetailCreation: View {
    @State private var goalSet = true
    @State private var leastMostOption = "At Least"
    @State private var timeOption = "minutes"
    @State private var tickerValue = 30
    @State private var dayOption = "Day"
    
    var body: some View {
        VStack {
            CreationTopBar()
            Text("Tracking Type")
            Divider()
                .background(Color.black)
                .frame(height: 1)
                .padding(.vertical, 8)
            Toggle(isOn: $goalSet) {
                Text("Set a Goal?")
            }
            .padding(.horizontal, 128)
            Menu {
                Button("At Least") { leastMostOption = "At Least" }
                Button("At Most") { leastMostOption = "At Most" }
            } label: {
                Label(leastMostOption, systemImage: "chevron.down")
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
            }
            HStack(alignment: .center) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 1)
                        .foregroundStyle(.gray)
                        .frame(width: 150, height: 60)
                    Stepper("\(tickerValue)", value: $tickerValue)
                        .padding(.horizontal, 10)
                }
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
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 70)
            Text("Per")
            Menu {
                Button("Day") { timeOption = "Day" }
                Button("Week") { timeOption = "Week" }
                Button("Month") { timeOption = "Month" }
                Button("Year") { timeOption = "Year" }
            } label: {
                Label(dayOption, systemImage: "chevron.down")
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
            }
            Divider()
                .background(Color.black)
                .frame(height: 1)
                .padding(.vertical, 8)
            HStack {
                Button {
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(.gray)
                            .opacity(0.2)
                            .frame(width: 120, height: 60)
                        Text("Back")
                    }
                }
                Button {
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(.gray)
                            .opacity(0.2)
                            .frame(width: 120, height: 60)
                        Text("Next")
                    }
                }
            }
        }
        .foregroundStyle(.black)
    }
}

#Preview {
    HabitDetailCreation()
}
