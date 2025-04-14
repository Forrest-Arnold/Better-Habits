//
//  Topbar.swift
//  Better-Habits
//
//  Created by Forrest Kalani Arnold on 4/12/25.
//

import SwiftUI

struct Topbar: View {
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 40, height: 40)
                        .foregroundStyle(.gray)
                        .opacity(0.6)
                }
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
                    .fontWeight(.semibold)
                    .offset(x: -16)
                Spacer()
                ZStack {
                    Circle()
                        .frame(width: 40, height: 40)
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.white)
                }
            }
            HStack {
                ForEach(1..<8) { day in
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(.gray)
                            .opacity(0.6)
                        Text("d-\(day)")
                    }
                }
            }
        }
        .frame(height: 100)
        .padding()
        .background(.white)
    }
}

#Preview {
    Topbar()
}
