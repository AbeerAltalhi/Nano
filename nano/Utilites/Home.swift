//
//  Home.swift
//  nano
//
//  Created by Ruba on 17/06/1444 AH.
//

import SwiftUI

struct Home: View {
    @State var showPicker: Bool = false
    @State var showPickerFirstView: Bool = false
    @State private var showingPopover = false


    
    
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
                Text(LocalizedStringKey("H5"))
               //نغير الجمله وكمان ااضيفها لملف اللغات
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

