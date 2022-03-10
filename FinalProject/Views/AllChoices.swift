//
//  AllChoices.swift
//  FInalProject
//
//  Created by Angela Tian on 1/19/22.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import PhotosUI
import SwiftUI

struct AllChoices: View {
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
    
    // Name of filter to apply
    @State private var filterName: String = "3x3_identity";
    @State private var showingFilterPicker = false;
    
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Filter Selection Tool")
                    .font(.title)
                    .fontWeight(.black)
                
                // Prints Original Image
                if originalImage != nil {
                    Text("Original Image")
                        .font(.title3)
                    originalImage?
                        .resizable()
                        .scaledToFit()
                }
                else {
                    Text("Original Image")
                        .font(.title3)
                    Image("Default")
                        .resizable()
                        .scaledToFit()
                }
                
                // Prints Original Image
                if filteredImage != nil {
                    Text("Filtered Image")
                        .font(.title3)
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
                
                ZStack {
                    HStack {
                        Button("Image") {
                            showingImagePicker = true;
                        }
                        .font(.headline)
                        .foregroundColor(Color.blue)
                        Spacer()
                    }
                    
                    HStack {
                        Button("Filter") {
                            showingFilterPicker = true;
                        }
                        .font(.headline)
                        .foregroundColor(Color.blue)
                    }
                    
                    HStack {
                        Spacer()
                        Button("Save", action: saveImage)
                            .font(.headline)
                            .foregroundColor(Color.blue)
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("DarkGrey"))
        .foregroundColor(Color("PaleGrey"))
        .onChange(of: inputImage) { _ in loadImage() }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
        }
        .confirmationDialog("Select Filter", isPresented: $showingFilterPicker) {
            
            VStack {
                Button("Identity") {
                    setFilter(name: "3x3_identity");
                }
                Button("Box 3x3") {
                    setFilter(name: "box3");
                }
                Button("Box 5x5") {
                    setFilter(name: "box5");
                }
                Button("Box 10x10") {
                    setFilter(name: "box10");
                }
                Button("Box 25x25") {
                    setFilter(name: "box25");
                }
                Button("Box 100x100") {
                    setFilter(name: "box100");
                }
                Button("Edge Detection") {
                    setFilter(name: "edges");
                }
                Button("Emboss") {
                    setFilter(name: "3x3_emboss");
                }
                Button("Gauss 3x3") {
                    setFilter(name: "gauss3");
                }
            }
            VStack {
                Button("Gauss 5x5") {
                    setFilter(name: "gauss5");
                }
                Button("Gauss 10x10") {
                    setFilter(name: "gauss10");
                }
                Button("Gauss 25x25") {
                    setFilter(name: "gauss25");
                }
                Button("Gauss 100x100") {
                    setFilter(name: "gauss100");
                }
                Button("Grayscale") {
                    setFilter(name: "grayscale");
                }
                Button("Posterization") {
                    setFilter(name: "posterize");
                }
                Button("Invert Colors") {
                    setFilter(name: "invert");
                }
                Button("Saturate") {
                    setFilter(name: "saturated");
                }
                Button("Sepia Tone") {
                    setFilter(name: "sepia_tone");
                }
                Button("Sharpen") {
                    setFilter(name: "3x3_sharpen");
                }
            }
        }
        
        
    }
    
    func setFilter(name: String) {
        filterName = name;
        loadImage();
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        originalImage = Image(uiImage: inputImage);
        
        outputImage = Processor().applyFilter(inputImage: inputImage, type: filterName);
        
        guard let outputImage = outputImage else { return }
        filteredImage = Image(uiImage: outputImage);
    }
    
    func saveImage() {
        guard let savedImage = outputImage else { return }

        let imageSaver = ImageSaver()
        imageSaver.writeToPhotoAlbum(image: savedImage)
    }

}

struct AllChoices_Previews: PreviewProvider {
    static var previews: some View {
        AllChoices()
    }
}
