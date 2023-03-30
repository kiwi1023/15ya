//
//  MailContentsView.swift
//  15ya_OurStory
//
//  Created by Kiwon Song on 2023/03/28.
//

import SwiftUI

struct MailContentsView: View {
    @State var transitionTextIndex = 0
    @State var isActive = false
    
    let text = ["우리 키위는요...", "언택트 시대에 맞는 재택근무를 선호해요.", "비대면 협업을 선호하지만 대면 협업도 기꺼이 참여하는 사람이에요.", "깻잎논쟁을 요구하지 마세요." , "납득시키지 못한다면 집에 못갈 수도 있어요.", "우주가 이야기 꺼냈다가 입술이 시퍼래져서 집에 돌아갔어요.", "술은 꼭 한 병 이상 짠~! 해주세요.", "4명이 1병 마실 동안 혼자 1병 마셨거든요.", "얼굴을 봤는데 기분이 안좋아 보인다면 오해하지 마세요.", "그냥 배고픈 거예요.", "에어포스 신발을 신은 날이면 천천히 걸어주세요.", "발이 아플 수 있어요.", "죽도시장에 가고 싶어하는데, 웬만하면 같이 가주세요.", "저희는 멀어서 안갔답니다."]
    
    var body: some View {
        ZStack {
            Image("편지배경")
                .resizable()
                .offset(y: -25)
                .onTapGesture {
                    withAnimation(.easeOut(duration: 1)) {
                        if transitionTextIndex < text.count - 1 {
                            self.transitionTextIndex += 1
                        } else {
                            isActive.toggle()
                        }
                    }
                }
                .padding(.top, 120)
               
            
            Text(text[transitionTextIndex])
                .font(Font.custom("나눔손글씨 하나되어 손글씨", size: 50))
                .onAppear {
                    MusicPlayManager.shared.playSound()
                }
                .onDisappear {
                    MusicPlayManager.shared.stopSound()
                }
                .transition(.opacity)
                .padding(.all, 49)
                .offset(y: -10)
        }
        .background(.thinMaterial)
        .edgesIgnoringSafeArea(.all)
        
        NavigationLink(destination: LastView(), isActive: $isActive) { }
    }
}

struct MailContentsView_Previews: PreviewProvider {
    static var previews: some View {
        MailContentsView()
    }
}


