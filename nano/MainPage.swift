//
//  MainPage.swift
//  nano
//
//  Created by Abeer on 13/06/1444 AH.
//

import SwiftUI
//AAAA
struct MainPage: View {
    @State var changeProfileImage = false
    @State var openCameraRoll = false
    @State var imageSelected = UIImage()
    var body: some View {
        
        VStack {
            Text("أُنقر هنا ")
            Button(action:{
                changeProfileImage = true
                openCameraRoll = true
            }, label: {
                if changeProfileImage{
                    Image(uiImage: imageSelected)
                        .resizable()
                        .frame(width: 120, height: 120)
                }else{
                    
                    Image(systemName: "camera")
                        .resizable()
                        .frame(width: 60.0, height: 50.0)
                      //  .padding()
                }
            })
            VStack{
                Text("إرشادات : ")
                Text("- يجب إلتقاط الصوره بإضاءّ جيدة. ")
                Text("- التأكد من وضوح الصورة عند إلتقاطها.")
            }
        }.sheet(isPresented: $openCameraRoll){
            ImagePicker(selectedImage: $imageSelected,
             sourceType: .camera)
        }
    }
}
struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
