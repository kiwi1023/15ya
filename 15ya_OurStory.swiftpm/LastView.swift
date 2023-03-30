//
//  LastView.swift
//  cbl_1
//
//  Created by jaelyung kim on 2023/03/28.
//

import SwiftUI

struct LastView: View {
    
    var body: some View {
        ZStack {
            Image("last_background").resizable().edgesIgnoringSafeArea(.all)
            RoundedRectangle(cornerRadius:33).foregroundColor(Color.white).frame(width:300, height: 500).opacity(0.53).offset(y: -20)
            Image("last_15ya").resizable().padding(.top, 80)
                .frame(width:300, height: 500).offset(y: -20)
            Text("농부의 마음으로").font(.system(size: 24)).fontWeight(.heavy).offset(y:-225)
            Text("Uni Jeremy Kiwi Ted Radin Woozu \n Thank you!").foregroundColor(Color.white).fontWeight(.semibold).font(.system(size: 13))
                .multilineTextAlignment(.center)
                .offset(y: 255)
            Text("💧").font(.system(size: 56)).offset(x:74, y:-53)
            Text("💧").font(.system(size: 39)).offset(x:90, y:-10)
            NavigationLink {
//                SecondView()
            } label: {
                Text("Level up!👍")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
            }
            .frame(width: 280, height: 60)
            .background(.black, in: RoundedRectangle(cornerRadius: 30))
            .offset(y: 350)
        }
        
    }
}

struct LastView_Previews: PreviewProvider {
    static var previews: some View {
        LastView()
    }
}
