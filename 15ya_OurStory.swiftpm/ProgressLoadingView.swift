//
//  ProgressView.swift
//  mc1-15ya
//
//  Created by KimTaeHyung on 2023/03/29.
//

import SwiftUI

struct ProgressLoadingView: View {
    
    @State var progress: Double = 1
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        ZStack {
            
            Image("back")
            
            VStack {
                VStack(alignment: .leading) {
                    Text("It's")
                    Text("time to")
                    
                    ProgressView(value: progress, total: 100)
                        .scaleEffect(x:1, y: 6, anchor: .center)
                        .tint(Color("progressgreen"))
                        
                        .padding()
                    
                    HStack {
                        Text("MC1")
                        Image("customarrow")
                        Text("MC2")
                    }
                    .font(.system(size: 21, weight: .bold))

                }
                .progressViewStyle(DarkGreenShadowProgressViewStyle())
                .onReceive(timer) { _ in
                    if progress < 100 {
                        progress += 3
                    }
                }
                
                .font(.system(size: 40, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(60)
                .padding(.bottom, 180)
                
            }
            Spacer()
            
        }
    }
}

struct ProgressLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressLoadingView()
    }
}


struct DarkGreenShadowProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .shadow(color: Color(red: 0, green: 0.1, blue: 0), radius: 0.6, x: 1.0, y: 1.0)
            .background(Color.white)
    }
}
