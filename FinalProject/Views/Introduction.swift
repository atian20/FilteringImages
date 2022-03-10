//
//  Introduction.swift
//  FInalProject
//
//  Created by Angela Tian on 1/14/22.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import PhotosUI
import SwiftUI

struct Introduction: View {
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Introduction")
                        .font(.title)
                        .fontWeight(.black)
                    Spacer()
                }
                
                Text("")
                
                Text("\tThis app is my final project for CSE 455 at the University of Washington. It's goal is to introduce the math behind many of the CI Filters, whether the math be relating to convolution filters or filters that apply functions to the RGB values of each pixel of an image individually. \n")
                
                Text("\tOf the filters I discuss, I sort them into \"Single Pixel Filters\" and \"Filter Kernels.\" The former refers to filters which work on a single pixel at a time, modifying the RGB values to convert from the original image to the filtered image. The latter, Covolution Filters, utilize a convolution filter which will be explained later to create the new pixel in the filtered image from the pixels surrounding it in the original image.\n")
                
                Text("\tI explain the math behind each filter separately. Then at the end, the \"Filter Selection Tool\" allows the user to apply the different filters to the default image I provided from a trip to Hawaii or they can choose their own image from their camera roll to apply the filters to.\n")
                
                HStack {
                    Text("\tUsing the different filters in conjunction with one another, you can create interesting and wacky images like the one below.\n")
                    Spacer();
                }
                
                Image("Both")
                    .resizable()
                    .scaledToFit()
                
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

struct Introduction_Previews: PreviewProvider {
    static var previews: some View {
        Introduction()
    }
}
