//
//  MainView.swift
//  Better-Habits
//
//  Created by Forrest Kalani Arnold on 4/12/25.
//

import SwiftUI

struct MainView: View {
    @State private var showHabitCreation = false

    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Rectangle()
                    .ignoresSafeArea()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundStyle(.gray)
                    .opacity(0.2)

                VStack(spacing: 0) {
                    // Pass the binding into Topbar
                    Topbar(navigateToHabitCreation: $showHabitCreation)

                    HStack {
                        Text("Daily Goals")
                            .font(.title3)
                        Spacer()
                        ZStack {
                            Circle()
                                .frame(width: 36, height: 36)
                                .foregroundStyle(.gray)
                            Circle()
                                .frame(width: 30, height: 30)
                                .foregroundStyle(.white)
                            Image(systemName: "chevron.down")
                                .resizable()
                                .frame(width: 13, height: 7)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top)

                    HabitView()
                }

                // Hidden NavigationLink that will trigger full-screen nav
                NavigationLink(
                    destination: HabitCreationView(),
                    isActive: $showHabitCreation
                ) {
                    EmptyView()
                }
                .hidden()
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    MainView()
}
