//
//  MyColorPicker.swift
//  nano
//
//  Created by Abeer on 17/06/1444 AH.
//

import SwiftUI

struct MyColorPicker: View {
    @Binding var selectedColor: Color
    private let colors:[Color] = [.red, .yellow, .pink, .blue, .white]
    
    
    var body: some View {
    
        ScrollView(.horizontal) {
            
            HStack {
                ForEach(colors, id: \.self) { color in
                    Circle()
                        .foregroundColor(color)
                        .frame(width: 45, height: 45)
                        .opacity(color == selectedColor ? 0.5 : 1.0)
                        .scaleEffect(color == selectedColor ? 1.1 : 1.0)
                        .onTapGesture {
                            selectedColor = color
                        }
                }
            }
            .padding()
            .background(.thinMaterial)
            .cornerRadius(20)
            .padding(.horizontal)

        }
    }
}

struct MyColorPicker_Previews: PreviewProvider {
    
    static var previews: some View {
        MyColorPicker(selectedColor: .constant(.blue))
    }
}
