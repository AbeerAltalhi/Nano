//
//  CustomColorPcker.swift
//  nano
//
//  Created by Ruba on 17/06/1444 AH.
//

import SwiftUI
import PhotosUI

extension View{
    func imageColorPicker(showPicker: Binding<Bool>,showPickerFirstView: Binding<Bool> , color: Binding<Color>)->some View {
        return self
            .fullScreenCover(isPresented: showPickerFirstView){
                
            } content: {
                Helper(showPicker: showPicker, showPickerFirstView: showPickerFirstView, color: color)
                
            }
        
    }
    
}


struct Helper: View{
    
    
    @Binding var showPicker: Bool
    
    @Binding var showPickerFirstView: Bool
    
    @Binding var color: Color
    
    @State var showImagePicker: Bool = false
    @State var imageData: Data = .init(count: 0)
    @State private var showingPopover = false
    @State private var selectedColor: Color = .blue
    @State private var isPresentedFullScreenCover = false
    var body: some View{
        
        NavigationView{
            
            VStack(spacing: 10){
                GeometryReader{proxy in
                    
                    let size = proxy.size
                    
                    VStack(spacing: 12) {
                        
                        if let image = UIImage(data: imageData){
                            
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: size.width, height: size.height  )
                        }
                        else{
                            Image(systemName: "plus")
                                .font(.system(size: 35))
                            Text("Top to Add Image ")
                                .font(.system(size: 14 , weight:.light))
                        }
                    }
                    .frame(maxWidth:.infinity , maxHeight: .infinity , alignment: .center )
                    .contentShape(Rectangle())
                    .onTapGesture {
                        
                        // showImagePicker.toggle()
                    }
                }
                ZStack(alignment: .top){
                    
                    Circle()
                        .fill(color)
                        .cornerRadius(15)
                        .frame(width: 150,height: 90)
                    
                    CustomColorPicker(color: $color)
                        .frame(width: 100 ,height: 50 ,alignment: .topLeading)
                        .clipped()
                        .offset(x: 15 , y : 15)
                }
                
            }
            .ignoresSafeArea(.container, edges: .bottom)
            .navigationTitle("Image Colro Picker")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    
                    Button("H6", action: {
                        isPresentedFullScreenCover = true
                    })
                    .fullScreenCover(isPresented: $isPresentedFullScreenCover) {
                        MainPage()
                    }
                    //                    Button("H6"){
                    //                        showPicker .toggle()
                    //                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("H7"){
                        showingPopover = true
                    } .popover(isPresented: $showingPopover) {
                        Spacer()
                        Text("H8")
                            .font(.title)
                        VStack {
                            MyColorPicker(selectedColor: $selectedColor)
                            Spacer()
                            
                            Circle()
                                .frame(width: 300, height: 300)
                                .cornerRadius(20)
                                .foregroundColor(selectedColor)
                            Text("\(selectedColor.description)")
                                .font(.system(size: 40, design: .rounded))
                            
                            Spacer()
                        }
                        //.padding()
                    }
                }
            }
            
            .sheet(isPresented: $showPicker ){
                
            } content: {
                ImagePicker(showPicker: $showPicker, imageData: $imageData)
            }
        }
        
    }
    
    
    struct ImagePicker: UIViewControllerRepresentable{
        
        @Binding var showPicker: Bool
        
        
        @Binding var imageData: Data
        
        func makeCoordinator() -> Coordinator {
            return Coordinator(parent: self)
        }
        
        func makeUIViewController(context: Context) -> PHPickerViewController {
            
            var config = PHPickerConfiguration()
            config.selectionLimit = 1
            
            let picker = PHPickerViewController(configuration: config)
            picker.delegate = context.coordinator
            
            return picker
            
        }
        func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
            
        }
        class Coordinator: NSObject, PHPickerViewControllerDelegate{
            
            var parent: ImagePicker
            init(parent: ImagePicker ) {
                self.parent = parent
            }
            
            func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
                
                if let first = results.first{
                    first.itemProvider.loadObject(ofClass: UIImage.self) {[self] result, err in
                        guard let image = result as? UIImage else{
                            parent.showPicker.toggle()
                            return
                        }
                        parent.imageData = image.jpegData(compressionQuality: 1) ?? .init(count:0)
                        
                        parent.showPicker.toggle()
                    }
                }
                else{
                    //  parent.showPicker.toggle()
                    
                }
            }
        }
        
    }
    
    struct CustomColorPicker: UIViewControllerRepresentable{
        
        @Binding var color: Color
        
        func makeCoordinator() -> Coordinator {
            return Coordinator(parent: self)
        }
        func makeUIViewController(context: Context) ->  UIColorPickerViewController {
            
            let picker = UIColorPickerViewController()
            picker.supportsAlpha = false
            picker.selectedColor = UIColor(color)
            
            picker.delegate = context.coordinator
            
            picker.title = ""
            return picker
            
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
        
        class Coordinator: NSObject,UIColorPickerViewControllerDelegate {
            
            var parent: CustomColorPicker
            
            init(parent: CustomColorPicker) {
                self.parent = parent
            }
            
            func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
                parent.color = Color(viewController.selectedColor)
            }
            
            func colorPickerViewController(_ viewController: UIColorPickerViewController, didSelect color: UIColor, continuously: Bool) {
                parent.color = Color(color)
            }
        }
    }
    
    
}

