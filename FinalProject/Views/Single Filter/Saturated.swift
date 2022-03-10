//
//  Saturated.swift
//  FInalProject
//
//  Created by Angela Tian on 1/17/22.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import PhotosUI
import SwiftUI

struct Saturated: View {
    // Var for popup image picker
    @State private var showingImagePicker = false
    
    // Input image selected by user
    @State private var inputImage: UIImage?
    // Filtered version -- used to save
    @State private var outputImage: UIImage?
    // Input image -- used to print on screen
    @State private var originalImage: Image?
    // Filtered version -- used to print on screen
    @State private var filteredImage: Image?
    
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Double Saturation Filter")
                        .font(.title)
                        .fontWeight(.black)
                    Spacer()
                }
                
                // INFO
                VStack {
                    Text("")
                    
                    HStack {
                        Text("Let R0, G0, and B0 be the values for red, green, and blue from the original image pixel respectively.\n")
                        Spacer();
                    }
                    
                    HStack {
                        Text("First we will convert the RGB values into HSV (Hue, Saturation, Value) numbers.\n")
                        Spacer();
                    }
                    
                    Image("RGBtoHSV")
                        .resizable()
                        .scaledToFit()
                    
                    Text("\n")
                    
                    HStack {
                        Text("Then we set the Saturation value to be twice the calculated value or 100%, whichever is smaller. Then we will convert back to RGB.\n")
                        Spacer();
                    }
                    
                    Image("HSVtoRGBSat")
                        .resizable()
                        .scaledToFit()
                    
                    Text("\n")
                    
                    HStack {
                        Text("The calculated R3, G3, and B3 are the RGB values of the original pixel that has it's saturation doubled by the Saturation Filter.\n")
                        Spacer();
                    }
                    
                    HStack {
                        Text("Below, you can see an example image that has been put through the Double Saturation Filter. By pressing \"Select Image\", you can use the filter on one of your own images. If you are trying to load a large file, it may take some time for the filter to finish processing the image.\n")
                        Spacer();
                    }
                    
                }
                
                // Buttons
                HStack {
                    Text("Select Image")
                        .font(.headline)
                        .foregroundColor(Color.blue)
                        .onTapGesture {
                            showingImagePicker = true
                        }
                    
                    Spacer()
                    
                    Text("Save Image")
                        .font(.headline)
                        .foregroundColor(Color.blue)
                        .onTapGesture {
                            saveImage()
                            print("test")
                        }
                }
                
                // Self Images
                VStack {
                    // Prints Original Image
                    if originalImage != nil {
                        Text("Original Image")
                        originalImage?
                            .resizable()
                            .scaledToFit()
                    }
                    else {
                        Text("Original Image")
                            .font(.title3)
                        // TODO Insert sepia version
                        Image("Default")
                            .resizable()
                            .scaledToFit()
                    }
                    
                    // Prints Original Image
                    if filteredImage != nil {
                        Text("Filtered Image")
                        filteredImage?
                            .resizable()
                            .scaledToFit()
                    }
                    else {
                        Text("Filtered Image")
                            .font(.title3)
                        Image("Saturate")
                            .resizable()
                            .scaledToFit()
                    }
                }
                Spacer()
            }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("DarkGrey"))
        .foregroundColor(Color("PaleGrey"))
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .onChange(of: inputImage) { _ in loadImage() }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        originalImage = Image(uiImage: inputImage);
        
        outputImage = Processor().applyFilter(inputImage: inputImage, type: "saturated");
        
        guard let outputImage = outputImage else { return }
        filteredImage = Image(uiImage: outputImage);
    }
    
    func saveImage() {
        guard let savedImage = outputImage else { return }

        let imageSaver = ImageSaver()
        imageSaver.writeToPhotoAlbum(image: savedImage)
    }

}

struct Saturated_Previews: PreviewProvider {
    static var previews: some View {
        Saturated()
    }
}

