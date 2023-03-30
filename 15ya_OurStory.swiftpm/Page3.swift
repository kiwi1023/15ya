//
//  Page3.swift
//  15ya15days
//
//  Created by 허준혁 on 2023/03/29.
//

import SwiftUI

struct Page3: View {
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                Image("page3")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()

                NavigationLink {
                    QuestionKiwiView()
                } label: {
                    Image(systemName: "arrow.right.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.black)
                }
                .offset(x: -20, y: -50)
            }
        }
        .navigationBarBackButtonHidden()
    }
}
