//
//  ConvolutionKernels.swift
//  FInalProject
//
//  Created by Angela Tian on 1/18/22.
//

import SwiftUI

struct ConvolutionKernels: View {
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Convolution Kernels")
                        .font(.title)
                        .fontWeight(.black)
                    Spacer()
                }
                
                Text("")
                
                Text("\tConvolution kernels are a array - a grid - of coefficients that the original values of each pixel are multiplied by to create the new image.")
                
                Image("Convolution")
                    .resizable()
                    .scaledToFit()
                
                Text("\n\tConsider an image to be three grids of equal dimensions, each grid containing either the R, G, or B value of the image. If we want to apply a convolution kernel to the image, we will center the kernel on each pixel such that they \"overlap\" and multiply the coefficient in the kernel by the number that it \"overlaps\".")
                
                Image("Multiply")
                    .resizable()
                    .scaledToFit()
                
                VStack {
                    Text("\n\tWe would \"convolve\" each of the R, G, and B grids from the original image to create the R', B', and G' values of the new pixel.\n")
                    
                    Text("\tBy playing with the values of the coefficients and the size of the filter kernel, we can create strange and interesting effects.\n")
                    
                    Text("\tAn especially interesting quality of filter kernels is that the brightness will change depending on what the coefficients sum to. If they sum to 1, the brightness of the new image will be relatively similar to that of the original image. However, when the sum is less than 1, the filtered image will likely seem darker. On the flip side, if the sum is larger than 1, it will likely seem brighter.\n")
                    
                    Text("\tFurthermore, there is no rule that prevents someone from entering a negative number as a coefficient, which can help to show edges and borders in an image.\n")
                    
                    Text("\tHowever, depending on the coefficients chosen, there will be cases where you will need to check the bounds of the new RGB values calculated since their values must be between 0 and 255.\n")
                    
                    HStack {
                        Text("\tApplying several Convolution Filters to an image multiple times and in random order can create an image like the one below.\n")
                        Spacer();
                    }
                    
                    Image("Convolve")
                        .resizable()
                        .scaledToFit()
                }
                
                // Etcetera
                Spacer()
            }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("DarkGrey"))
        .foregroundColor(Color("PaleGrey"))
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ConvolutionKernels_Previews: PreviewProvider {
    static var previews: some View {
        ConvolutionKernels()
    }
}
