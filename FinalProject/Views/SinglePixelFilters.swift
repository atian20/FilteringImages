//
//  SinglePixelFilters.swift
//  FInalProject
//
//  Created by Angela Tian on 1/18/22.
//

import SwiftUI

struct SinglePixelFilters: View {
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Single Pixel Filters")
                        .font(.title)
                        .fontWeight(.black)
                    Spacer()
                }
                
                Text("")
                
                Text("\tThe digital images we see are made up of collections of pixels. The denser the pixels, the higher quality we perceive the image to be! But what are these pixels? And, how do they show us a colorful image from a series of 0's and 1's?\n")
                
                Text("\tEach pixel contains three number values, the RGB values. When these three numbers are used in conjunction with one another, we have thousands of colors to choose from. Exactly 2^24 choices since the values for RGB are always between 0 and 255.\n")
                
                Text("\tThese \"Single Pixel Filters\" take the RGB values from the original image and apply some kind of mathematical function to it, sometimes a very simple function and other times more complicated, to create a new set of RGB values for each pixel. The transformation of the RGB values over the entire image makes it look like you're seeing the image through a filter!\n")
                
                HStack {
                    Text("\tApplying several Single Pixel Filters to an image multiple times and in random order can create an image like the one below.\n")
                    Spacer();
                }
                
                Image("Single")
                    .resizable()
                    .scaledToFit()
                
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

struct SinglePixelFilters_Previews: PreviewProvider {
    static var previews: some View {
        SinglePixelFilters()
    }
}
