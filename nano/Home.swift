//
//  Home.swift
//  nano
//
//  Created by Ruba on 15/06/1444 AH.
//

import SwiftUI

struct Home: View {
    @State var showPicker: Bool = false
    @State var showPickerFirstView: Bool = false

//
    
    
    @State var selectedColor: Color = .white
    var body: some View {
        ZStack {
            
            Rectangle()
                .fill(selectedColor)
                .ignoresSafeArea()
            
            Button {
                showPicker.toggle()
                
                showPickerFirstView.toggle()
            } label: {
                Text("Show Image Color Picker")
                    
            }
        }
        .imageColorPicker(showPicker: $showPicker, showPickerFirstView: $showPickerFirstView, color: $selectedColor)
    }
    
}
    
struct Home_Previews: PreviewProvider{
    static var previews: some View {
        Home()
        }
}

