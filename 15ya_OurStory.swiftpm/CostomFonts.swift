//
//  CostomFonts.swift
//  15ya_OurStory
//
//  Created by 송기원 on 2023/03/29.
//

import SwiftUI

enum MyCustomFonts: String, CaseIterable {
    case mailFont = "나눔손글씨 하나되어 손글씨.ttf"
    
    var fontName: String { String(self.rawValue.dropLast(4)) }
    var fileExtension: String { String(self.rawValue.suffix(3)) }
}


struct CustomFonts {
    static func register() {
        MyCustomFonts.allCases.forEach {
            registerFont(fontName: $0.fontName,
                         fontExtension: $0.fileExtension)
        }
    }
    
    private static func registerFont(fontName: String, fontExtension: String) {

        guard let fontURL = Bundle.main.url(forResource: fontName, withExtension: fontExtension),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider) else {
            print("Couldn't create \(fontName) from data")
            return
        }
        
        var error: Unmanaged<CFError>?
        
        CTFontManagerRegisterGraphicsFont(font, &error)
    }
    
}

extension Font {
    static func custom(_ font: MyCustomFonts, size: CGFloat) -> Font {
        custom(font.fontName, size: size)
    }
}
