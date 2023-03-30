//
//  MC2View.swift
//  mc1-15ya
//
//  Created by KimTaeHyung on 2023/03/28.
//

import SwiftUI

struct MC2View: View {
    var body: some View {
        ZStack {
            VStack(alignment: .trailing) {
                Spacer()
                Image("kiwi")
                    .opacity(0.3)
            }

            VStack(alignment: .leading) {
                
                Spacer()
                
                HStack(alignment: .top) {
                    Spacer()

                    NavigationLink(
                        destination: LetterView(),
                        label: {
                            Image(systemName: "arrow.right.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80)
                                .foregroundColor(.black)
                        })
                    .padding(30)
                }
            }
            ProgressLoadingView()
            
            
            
        }

    }
}

struct MC2View_Previews: PreviewProvider {
    static var previews: some View {
        MC2View()
    }
}
