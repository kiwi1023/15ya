import SwiftUI

struct MailView: View {
    
    @State var isHidden = false
    @State private var isActive = false
    @State var isAnimating = false
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: MailContentsView(), isActive: $isActive) {
                    ZStack {
                        Image("mail_close")
                            .resizable()
                            .frame(width: 300, height: 220, alignment: .center)
                            .opacity(isHidden ? 0 : 1)
                            .gesture(
                                TapGesture()
                                    .onEnded({ _ in
                                        isHidden.toggle()
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                                            isActive.toggle()
                                        }
                                    })
                            )
                        
                        Image("mail_open")
                            .resizable()
                            .frame(width: 300, height: 300)
                            .offset(y: -37)
                            .opacity(isHidden ? 1 : 0)
                    }
                }
            }
            .onAppear {
                isHidden = false
                isActive = false
            }
        }
    }
}

