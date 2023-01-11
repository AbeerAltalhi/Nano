//
//  color palette.swift
//  nano
//
//  Created by Ruba on 17/06/1444 AH.
//


import SwiftUI

struct color_palette: View {
//    @State private var selectedColor: Color = .blue
    
    var body: some View {
        VStack {
//            MyColorPicker(selectedColor: $selectedColor)
            Spacer()
            
            Circle()
//                .fill(morecolor(color))
                .frame(width: 300, height: 300)
                .cornerRadius(20)
                .font(.system(size: 40, design: .rounded))
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        color_palette()
    }
}
