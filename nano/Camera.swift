//
//  Camera.swift
//  nano
//
//  Created by Abeer on 12/06/1444 AH.
//

import SwiftUI

struct Camera: View {
    @State var Email: String = ""
    @State var yourCondition: Int = 2
    var colorToShow: Color {
            switch yourCondition {
                case 1:
                    return .red
                case 2:
                    return .green
                case 3:
                    return .blue
                case 4:
                    return Color(UIColor(red: 0.5, green: 0.2, blue: 0.8, alpha: 0.5))
                default:
                    return .clear
            }
        }
    
    var body: some View {
        Button(action: { print("hello")}, label: {
            Text("Button")
            TextField("Enter Your Email", text: $Email)
          })
        .foregroundColor(colorToShow)

        
    }
}

struct Camera_Previews: PreviewProvider {
    static var previews: some View {
        Camera()
    }
}
