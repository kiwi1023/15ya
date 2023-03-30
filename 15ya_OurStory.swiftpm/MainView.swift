//
//  MainView.swift
//  StudyPlaygroundApp
//
//  Created by Lee Jinhee on 2023/03/28.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("main")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    NavigationLink {
                        SecondView()
                    } label: {
                        Text("Let's go!")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                    }
                    .frame(width: 280, height: 66)
                    .background(.black, in: RoundedRectangle(cornerRadius: 33))
                }
            }
        }
    }
}
