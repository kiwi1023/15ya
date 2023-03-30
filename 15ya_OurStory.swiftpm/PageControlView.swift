//
//  PageControlView.swift
//  mc1-15ya
//
//  Created by KimTaeHyung on 2023/03/29.
//

import SwiftUI
import UIKit


struct PageControlView: View {
    
    @State var page: Int = 0
    
    var body: some View {
        ZStack {
            VStack {
                
                VStack {
                    Text("Photos")
                        .font(.system(size: 30, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 50)
                    
                    Text("This is a story about 15-ya")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .foregroundColor(.white)
                .padding(.horizontal, 30)

                //Using GeometryReader for getting remaining height..
                GeometryReader { g in
                    Carousel(width: UIScreen.main.bounds.width, page: self.$page, height: g.frame(in: .global).height)
                }
                PageControl(page: self.$page)

                VStack {

                    HStack(alignment: .top) {
                        Spacer()
                        NavigationLink(
                            destination: MC2View(),
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
            }
            
            .background(Color("custsomgreen"))
        }
    }
}

struct PageControlView_Previews: PreviewProvider {
    static var previews: some View {
        PageControlView()
    }
}


struct List: View {
    
    @Binding var page: Int
    
    var body: some View {
        HStack(spacing: 0) {
            
            ForEach(data) { i in
                Card(page: self.$page, width: UIScreen.main.bounds.width, data: i)
                
                
            }
        }
    }
}


struct Card: View {
    
    @Binding var page: Int
    var width: CGFloat
    var data : Type
    
    var body: some View {
        VStack {
            VStack {
                Text(self.data.location)
                    .font(.title2)
                    .fontWeight(.bold)
//                    .padding(.top, 80)
                
                Text(self.data.date)
                    .foregroundColor(.gray)
//                    .padding(.top)
//                    .padding(.vertical)

                Image(self.data.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 360, height: 260)
                
            }
//            .padding(.horizontal, 12)
            .padding(.vertical, 25)
            .background(Color.white)
            .cornerRadius(12)
            
            //Increasing Height and Width if current page appears..
//            .padding(.vertical, self.page == data.id ? 0 : 25)
//            .padding(.horizontal, self.page == data.id ? 0 : 25)
            .frame(width: self.width, height: 500)
            
        }
        
        .animation(.default)
    }
    
}


struct Carousel: UIViewRepresentable {
    
    func makeCoordinator() -> Coordinator {
        
        return Carousel.Coordinator(parent1: self)
    }
    
    
    var width: CGFloat
    @Binding var page: Int
    var height: CGFloat
    
    func makeUIView(context: Context) -> UIScrollView {
        
        
        //ScrollView Content size
        let total = width * CGFloat(data.count)
        let view = UIScrollView()
        view.isPagingEnabled = true
        
        //1.0 For Disableing Vertical Scroll
        view.contentSize = CGSize(width: total, height: 1.0)
        view.bounces = true
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.delegate = context.coordinator
        
        
        //embed SwiftUI View into UIView
        let view1 = UIHostingController(rootView: List(page: self.$page))
        view1.view.frame = CGRect(x: 0, y: 0, width: total, height: 420)
        
        view1.view.backgroundColor = .clear
        
        view.addSubview(view1.view)
        
        return view
        
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
    }
    
    class Coordinator: NSObject, UIScrollViewDelegate {
        
        var parent: Carousel
        init(parent1: Carousel) {
            parent = parent1
        }
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            
            //Using This Function For Getting Current Page
            
            let page = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
            
            self.parent.page = page
            
            print("Scroll : \(page)")
            
        }
    }
    
}

struct PageControl: UIViewRepresentable {
    
    @Binding var page: Int
    
    func makeUIView(context: Context) -> UIPageControl {
        let view = UIPageControl()
        view.currentPageIndicatorTintColor = .white
        view.pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.3)
        view.numberOfPages = data.count
        
        return view
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
            uiView.currentPage = self.page
    }
    
}



struct Type: Identifiable {
    var id: Int
    var location: String
    var date: String
    var image: String
}

var data = [
    Type(id: 0, location: "iFarm 메인랩", date: "March 22 10:51 AM", image: "image1"),
    Type(id: 1, location: "사진 위치2", date: "날짜2", image: "image2"),
    Type(id: 2, location: "사진 위치3", date: "날짜3", image: "image2"),
    Type(id: 3, location: "iFarm 카페테리아", date: "March 20 10:52 AM", image: "image5")
]
