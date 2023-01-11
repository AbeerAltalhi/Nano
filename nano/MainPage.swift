//
//  MainPage.swift
//  nano
//
//  Created by Abeer on 13/06/1444 AH.
//

import SwiftUI
//AAA
struct MainPage: View {
    @State var showPicker: Bool = false
    @State var showPickerFirstView: Bool = false
    
    // @State var changeProfileImage = false
    // @State var openCameraRoll = false
    // @State var imageSelected = UIImage()
    //  @State private var isPresentedFullScreenCover = false
    var body: some View {
        NavigationView {
            
            VStack {
                NavigationLink(destination: Home()) {
                    Text(LocalizedStringKey("H1"))
                        .font(.largeTitle)
                        .foregroundColor(Color("1"))
                        .padding(.vertical, 10.0)
                        .accessibilityHint("Click Here")
                }.navigationBarBackButtonHidden(true)
                
                //                Button {
                //                    showPicker.toggle()
                //
                //                    showPickerFirstView.toggle()
                //                } label: {
                //                    Text(LocalizedStringKey("H1"))
                //                   //نغير الجمله وكمان ااضيفها لملف اللغات
                //                }
                //            }
                //            .imageColorPicker(showPicker: $showPicker, showPickerFirstView: $showPickerFirstView, color: $selectedColor)
                //        }
                
                //            Button(action:{
                //                changeProfileImage = true
                //                openCameraRoll = true
                //            }, label: {
                //                if changeProfileImage{
                //                    Image(uiImage: imageSelected)
                //                        .resizable()
                //                        .frame(width: 120, height: 120)
                //                }else{
                //
                //                    Image(systemName: "camera")
                //                        .resizable()
                //                        .frame(width: 100.0, height: 90.0)
                //                        .foregroundColor(Color("2"))
                //                      //  .padding()
                //                }
                //            })
                Image(systemName: "camera")
                    .resizable()
                    .frame(width: 100.0, height: 80.0)
                    .foregroundColor(Color("2"))
                //  .padding()
                
                VStack{
                    Text(LocalizedStringKey("H2"))
                        .foregroundColor(Color("1"))
                        .font(.system(size: 20))
                    Text(LocalizedStringKey("H3"))
                        .foregroundColor(Color("1"))
                        .font(.system(size: 20))
                    Text(LocalizedStringKey("H4"))
                        .foregroundColor(Color("1"))
                        .font(.system(size: 20))
                        .multilineTextAlignment(.center)
                }
                .padding(.top, 50.0)
            }
            //        .sheet(isPresented: $openCameraRoll){
            //            ImagePicker(selectedImage: $imageSelected,
            //             sourceType: .camera)
            //        }
        }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
