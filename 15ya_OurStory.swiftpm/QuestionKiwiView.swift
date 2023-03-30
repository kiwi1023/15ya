import SwiftUI

struct QuestionKiwiView: View {
    @State private var showModal = false

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack {
                Image("our_big_idea")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(70)

                Button(action: {
                    self.showModal = true
                }) {
                    Image("kiwi_thinking")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(50)
                }
                .sheet(isPresented: self.$showModal) {
                    InterviewView()
                }
            }

            NavigationLink {
                NextView()
            } label: {
                Image(systemName: "arrow.right.circle")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.black)
            }
//            .offset(x: -20, y: -50)
                .offset(x: -20, y: 0)
        }
        .navigationBarBackButtonHidden()
    }
}
