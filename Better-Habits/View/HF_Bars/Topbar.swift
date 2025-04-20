//
//  Topbar.swift
//  Better-Habits
//
//  Created by Forrest Kalani Arnold on 4/12/25.
//

import SwiftUI

struct Topbar: View {
    @Binding var navigateToHabitCreation: Bool
    @ObservedObject var habitVM = HabitVM()

    var body: some View {
        VStack(spacing: 12) {
            HStack {
                ZStack {
                    Circle()
                        .frame(width: 40, height: 40)
                    Image(systemName: "ellipsis")
                        .resizable()
                        .frame(width: 24, height: 6)
                        .foregroundStyle(.white)
                }

                Spacer()

                Text("Habits")
                    .font(.title2)
                    .fontWeight(.semibold)

                Spacer()

                Button {
                    navigateToHabitCreation = true
                } label: {
                    ZStack {
                        Circle()
                            .frame(width: 40, height: 40)
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.white)
                    }
                }
                .foregroundStyle(.black)
            }

            HStack(spacing: 8) {
                ForEach(habitVM.days, id: \.self) { day in
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 44)
                            .foregroundStyle(.gray.opacity(0.6))
                        Text(day.prefix(3))
                            .font(.caption)
                            .foregroundStyle(.black)
                    }
                }
            }
        }
        .padding(.horizontal)
        .padding(.top, 30)
        .padding(.bottom, 12)
        .frame(maxWidth: .infinity)
        .background(Color.white)
    }
}

#Preview {
    Topbar(navigateToHabitCreation: .constant(false))
}
