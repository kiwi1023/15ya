import SwiftUI

struct HoweverView: View {

    var body: some View {
        
        NavigationView {
            VStack {
                Spacer()
                Text("However")
                    .font(Font.custom("Spongeboy Me Bob", size: 60))
                    .foregroundColor(Color("custsomgreen"))
                    
                Spacer()
                HStack(alignment: .top) {
                    Spacer()

                    NavigationLink(
                        destination: PageControlView(),
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
            .background(.white)
        }
    }
    
    init() {
        for familyName in UIFont.familyNames {
            print(familyName)

            for fontName in UIFont.fontNames(forFamilyName: familyName) {
                print("-- \(fontName)")
            }
        }
    }
}
