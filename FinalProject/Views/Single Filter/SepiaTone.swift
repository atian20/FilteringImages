//
//  SepiaTone.swift
//  FInalProject
//
//  Created by Angela Tian on 1/17/22.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import PhotosUI
import SwiftUI

struct SepiaTone: View {
    // Var for popup image picker
    @State private var showingImagePicker = false
    
    // Input image selected by user
    @State private var inputImage: UIImage? = UIImage(named: "Default")
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
                    Text("Sepia Tone Filter")
                        .font(.title)
                        .fontWeight(.black)
                    Spacer()
                }
                
                // INFO
                VStack {
                    Text("")
                    
                    HStack {
                        Text("Let R0, G0, and B0 be the values for red, green, and blue from the original image pixel respectively. And, let R1, G1, and B1 be the values for red, green and blue in the filtered image.\n")
                        Spacer();
                    }
                    
                    HStack {
                        Text("R1 = (R0 * .393) + (G0 *.769) + (B0 * .189)\n")
                        Spacer();
                    }
                    HStack {
                        Text("G1 = (R0 * .349) + (G0 *.686) + (B0 * .168)\n")
                        Spacer();
                    }
                    HStack {
                        Text("B1 = (R0 * .272) + (G0 *.534) + (B0 * .131)\n")
                        Spacer();
                    }
                    
                    HStack {
                        Text("Then, if any of R1, G1, or B1 are larger than 255, they are set to 255 to satisfy the condition that all RGB values are between 0 and 255 inclusive.\n")
                        Spacer();
                    }
                    
                    HStack {
                        Text("Below, you can see an example image that has been put through the Sepia Tone Filter. By pressing \"Select Image\", you can use the filter on one of your own images. If you are trying to load a large file, it may take some time for the filter to finish processing the image.\n")
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
                        Image("Sepia")
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
        
        outputImage = Processor().applyFilter(inputImage: inputImage, type: "sepia_tone");
        
        guard let outputImage = outputImage else { return }
        filteredImage = Image(uiImage: outputImage);
    }
    
    func saveImage() {
        guard let savedImage = outputImage else { return }

        let imageSaver = ImageSaver()
        imageSaver.writeToPhotoAlbum(image: savedImage)
    }

}

struct SepiaTone_Previews: PreviewProvider {
    static var previews: some View {
        SepiaTone()
    }
}
