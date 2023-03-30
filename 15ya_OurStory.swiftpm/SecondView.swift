//
//  SecondView.swift
//  StudyPlaygroundApp
//
//  Created by Lee Jinhee on 2023/03/28.
//

import SwiftUI

struct SecondView: View {
    @State private var scaleAnimation = 0
    var body: some View {
        ZStack {
            ZStack {
                Image("background")
                    .scaleEffect(scaleAnimation == 0 ? 1 : 1.1)
                    .animation(.easeInOut(duration: 1), value: scaleAnimation)

                
                ZStack {
                    //Image - kiwi and team
                    ZStack {
                        Image("team")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .offset(x: 0, y: -150)
                            .frame(width: scaleAnimation == 0 ? 300 : 650, height: scaleAnimation == 0 ? 300: 650)
                            .opacity(scaleAnimation == 0 ? 1 : 0)
                            .animation(.easeInOut(duration: 0.5), value: scaleAnimation)
                        
                        VStack {
                            Image(scaleAnimation == 2 ? "mango" : "kiwi")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .offset(x: scaleAnimation == 0 ?  -3 : -12, y: scaleAnimation == 0 ? -135: -95)
                                .frame(width: scaleAnimation == 0 ? 80: 250, height: scaleAnimation == 0 ? 80 : 250)
                            
                                .onTapGesture {
                                    if scaleAnimation == 0 {
                                        scaleAnimation = 1
                                    } else if scaleAnimation == 1 {
                                        scaleAnimation = 2
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
                                            scaleAnimation = 1
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
                                                scaleAnimation = 2
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
                                                    scaleAnimation = 1
                                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
                                                        scaleAnimation = 2
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }.animation(.easeInOut(duration: 0.7), value: scaleAnimation)
                            
                            Image("kiwiText")
                                .opacity(scaleAnimation == 0 ? 0 : 1).animation(.easeIn(duration: 0.4))
                                
                                .offset(x: 0, y: -95)
                        }
                        
                        
                    }
                    
                    //Text - title, sub
                    ZStack {
                        VStack {
                            Spacer()
                            Group { scaleAnimation == 0 ?
                                Text("3.13 오늘은 ")
                                    .foregroundColor(Color.black) +
                                Text("CBL 첫 날")
                                    .foregroundColor(Color.green)
                                    .fontWeight(.heavy) +
                                Text("이었어요")
                                    .foregroundColor(Color.black)
                                : Text("근데 한 남자가 눈에 띄네요")
                            }
                            .animation(.easeInOut(duration: 1.0).delay(0.5), value: scaleAnimation)
                            .font(.system(size: 20, weight: .bold))
                            .padding(.top, 252)
                            
                            Text(scaleAnimation == 0 ? "드디어 누구와 같은 팀이 될 지\n알게 되었어요. 얼굴이 낯익은 우니, 제레미, 테드,\n라딘, 우주와 한 팀이 되었네요." : "\n\n" )
                                .animation(.easeInOut(duration: 1), value: scaleAnimation)
                                .font(.system(size: 15))
                                .padding(.top, 8)
                            Spacer()
                        }
                        .padding()
                        .multilineTextAlignment(.center)
                    }
                }
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink {
                            // 다음 화면 여따가!!
                            //AnimationView()
                        } label: {
                            Image("button")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .aspectRatio(contentMode: .fit)
                            
                        }
                        .frame(width: 50, height: 50)
                        //.offset(x: -200, y: -80)
                        //.position(x: scaleAnimation == 0 ? 480: 655, y: scaleAnimation == 0 ? 750: 849)
                        .position(x: scaleAnimation == 0 ? 340: 468, y: scaleAnimation == 0 ? 750 : 750)
                        
                    }
                }
            }
        }
    }
}
