//
//  LastView.swift
//  cbl_1
//
//  Created by jaelyung kim on 2023/03/28.
//

import SwiftUI
import EffectsLibrary

struct LastView: View {
    @State private var animating = 0
    var body: some View {
        ZStack {
            Image("last_background").resizable().edgesIgnoringSafeArea(.all)
            RoundedRectangle(cornerRadius:33).foregroundColor(Color.white).frame(width:300, height: 500).opacity(0.53).offset(y: -30)
            Image("last_15ya").resizable().padding(.top, 80)
                .frame(width:300, height: 500).offset(y: -30)
            Text("농부의 마음으로").font(.system(size: 24)).fontWeight(.heavy).offset(y:-255)
            Text("Uni Jeremy Kiwi Ted Radin Woozu \n Thank you!").foregroundColor(Color.white).fontWeight(.semibold).font(.system(size: 13))
                .multilineTextAlignment(.center)
                .offset(y: 245)
            Text("💧").font(.system(size: 56))
                .offset(x: 74, y: animating >= 1 ? 320 : -53)
                .animation(.easeOut.speed(0.7), value: animating)
            Text("💧").font(.system(size: 39))
                .offset(x:90, y: animating >= 1 ? 320 : -10)
                .animation(.easeOut.speed(0.3), value: animating)
            Button {
                animating = 1
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    animating = 2
                }
            } label: {
                Text("Level up!👍")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
            }
            .frame(width: 280, height: 60)
            .background(animating == 1 ? .blue : .black, in: RoundedRectangle(cornerRadius: 30))
            .animation(.easeOut.delay(0.7), value: animating)
            .offset(y: 320)
            
            if (animating == 2) {
                FireworksView(
                    config: FireworksConfig(
                        intensity: .high,
                        lifetime: .long,
                        initialVelocity: .fast,
                        fadeOut: .slow
                    )
                    
                )
            }
        }
    }
}

struct LastView_Previews: PreviewProvider {
    static var previews: some View {
        LastView()
    }
}
