//
//  Posterize.swift
//  FInalProject
//
//  Created by Angela Tian on 1/18/22.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import PhotosUI
import SwiftUI

struct Posterize: View {
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
                    Text("Posterization Filter")
                        .font(.title)
                        .fontWeight(.black)
                    Spacer()
                }
                
                // INFO
                VStack {
                    Text("")
                    
                    HStack {
                        Text("The CI Posterization Filter has its coefficient for inputLevels set to 6 by default, which means that each color R, G, or B will only have 6 \"buckets\".\n")
                        Spacer();
                    }
                    
                    HStack {
                        Text("If we look at the two images below, after the initial image of the 256 shades of gray is posterized, there are only 6 shades of gray:")
                        Spacer();
                    }
                    
                    Image("Scale")
                        .resizable()
                        .scaledToFit()
                    
                    Image("ScalePost")
                        .resizable()
                        .scaledToFit()
                    
                    VStack {
                        HStack {
                            Text("\nLet R0, G0, and B0 be the values for red, green, and blue from the original image pixel respectively. And, let R1, G1, and B1 be the values for red, green and blue in the filtered image.\n")
                            Spacer();
                        }
                        
                        HStack {
                            Text("The function below will map each value of the RGB to the bucket it belongs in:")
                            Spacer();
                        }
                        
                        Image("Function")
                            .resizable()
                            .scaledToFit()
                        
                        HStack {
                            Text("R1 = f(R0)\n")
                            Spacer();
                        }
                        HStack {
                            Text("G1 = f(G0)\n")
                            Spacer();
                        }
                        HStack {
                            Text("B1 = f(B0)\n")
                            Spacer();
                        }
                        
                    }
                    
                    HStack {
                        Text("Below, you can see an example image that has been put through the Posterization Filter. By pressing \"Select Image\", you can use the filter on one of your own images. If you are trying to load a large file, it may take some time for the filter to finish processing the image.\n")
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
                        Image("Posterate")
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
        
        outputImage = Processor().applyFilter(inputImage: inputImage, type: "posterize");
        
        guard let outputImage = outputImage else { return }
        filteredImage = Image(uiImage: outputImage);
    }
    
    func saveImage() {
        guard let savedImage = outputImage else { return }

        let imageSaver = ImageSaver()
        imageSaver.writeToPhotoAlbum(image: savedImage)
    }

}

struct Posterize_Previews: PreviewProvider {
    static var previews: some View {
        Posterize()
    }
}

