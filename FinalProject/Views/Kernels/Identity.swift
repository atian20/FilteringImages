//
//  Identity.swift
//  FInalProject
//
//  Created by Angela Tian on 1/18/22.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import PhotosUI
import SwiftUI

struct Identity: View {
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
                    Text("Identity Kernel")
                        .font(.title)
                        .fontWeight(.black)
                    Spacer()
                }
                
                // INFO
                VStack {
                    Text("")
                    
                    HStack {
                        Text("For each of the three RGB channels for the image, we will apply the filter kernel below.\n")
                        Spacer();
                    }
                    
                    Image("3x3Ident")
                        .resizable()
                        .scaledToFit()
                    
                    HStack {
                        Text("\nSince the coefficient is 1 only in the center and 0 everywhere else, the \"filtered\" pixel is exactly the same as the original pixel. Thus, the \"filtered\" image is the same as the original image.\n")
                        Spacer();
                    }
                    
                    HStack {
                        Text("Below, you can see an example image that has been put through the Identity Kernel. By pressing \"Select Image\", you can use the filter on one of your own images. If you are trying to load a large file, it may take some time for the filter to finish processing the image.\n")
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
                        Image("Default")
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
        
        outputImage = Processor().applyFilter(inputImage: inputImage, type: "3x3_identity");
        
        guard let outputImage = outputImage else { return }
        filteredImage = Image(uiImage: outputImage);
    }
    
    func saveImage() {
        guard let savedImage = outputImage else { return }

        let imageSaver = ImageSaver()
        imageSaver.writeToPhotoAlbum(image: savedImage)
    }

}

struct Identity_Previews: PreviewProvider {
    static var previews: some View {
        Identity()
    }
}

