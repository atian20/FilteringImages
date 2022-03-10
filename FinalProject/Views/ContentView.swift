//
//  ContentView.swift
//  FInalProject
//
//  Created by Angela Tian on 1/14/22.
//

import SwiftUI

struct ContentView: View {
    // Properties
    
    @State private var showHome: Bool = false
    @State private var showIntroduction: Bool = false
    
    // View Body
    
    var body: some View {
   
        NavigationView {
    
            VStack {
                
                VStack { // Intro Text
                    
                    Text("Applying Image Filters")
                        .font(.title)
                        .fontWeight(.black)
                    
                    Text("")
                    
                    Text("Click through the following links to learn and experiment with different types of image filters.").padding()
                    
                    Text("")
                    
                    HStack {
                        Text("\t")
                        NavigationLink(destination: Introduction()){Text("Introduction").font(.title2)
                            .fontWeight(.bold)}
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        Text("\t")
                    
                        Spacer()
                    }
                    .padding(.horizontal)
    
                }
                
                VStack { // Single Pixel Filters
                    
                    HStack {
                        Text("\t")
                        NavigationLink(destination: SinglePixelFilters()){Text("Single Pixel Filters").font(.title2)
                                                .fontWeight(.bold)}
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        Text("\t")
                        Text("\t")
                        NavigationLink(destination: SepiaTone()){Text("Sepia Tone Filter").font(.title2)
                                                .fontWeight(.bold)}
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        Text("\t")
                        Text("\t")
                        NavigationLink(destination: Invert()){Text("Color Inversion Filter").font(.title2)
                                                .fontWeight(.bold)}
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        Text("\t")
                        Text("\t")
                        NavigationLink(destination: Grayscale()){Text("Grayscale Filter").font(.title2)
                                                .fontWeight(.bold)}
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        Text("\t")
                        Text("\t")
                        NavigationLink(destination: Saturated()){Text("Double Saturation Filter").font(.title2)
                                                .fontWeight(.bold)}
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        Text("\t")
                        Text("\t")
                        NavigationLink(destination: Posterize()){Text("Posterization Filter").font(.title2)
                                                .fontWeight(.bold)}
                        Spacer()
                    }
                    .padding(.horizontal)

                }
                
                VStack { // Kernels
                    
                    Text("")
                    
                    HStack {
                        Text("\t")
                        NavigationLink(destination: ConvolutionKernels()){Text("Convolution Filters").font(.title2)
                                                .fontWeight(.bold)}
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        Text("\t")
                        Text("\t")
                        NavigationLink(destination: Identity()){Text("Identity Kernel").font(.title2)
                                               .fontWeight(.bold)}
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        Text("\t")
                        Text("\t")
                        NavigationLink(destination: Sharpen()){Text("Sharpen Kernel").font(.title2)
                                                .fontWeight(.bold)}
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        Text("\t")
                        Text("\t")
                        NavigationLink(destination: Emboss()){Text("Emboss Kernel").font(.title2)
                                                .fontWeight(.bold)}
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        Text("\t")
                        Text("\t")
                        NavigationLink(destination: Edges()){Text("Edge Detection Kernel").font(.title2)
                                                .fontWeight(.bold)}
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        Text("\t")
                        Text("\t")
                        NavigationLink(destination: Box3()){Text("Box Blur 3x3").font(.title2)
                                               .fontWeight(.bold)}
                        Spacer()
                    }
                    .padding(.horizontal)
                   
                    HStack {
                        Text("\t")
                        Text("\t")
                        NavigationLink(destination: Gauss3()){Text("Gaussian Blur 3x3").font(.title2)
                                                .fontWeight(.bold)}
                        Spacer()
                    }
                    .padding(.horizontal)

                }
                
                VStack {
                    
                    Text("")
                    
                    HStack {
                        Text("\t")
                        NavigationLink(destination: AllChoices()){Text("Filter Selection Tool").font(.title2)
                                               .fontWeight(.bold)}
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                }
                
                Spacer()
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("DarkGrey"))
            .foregroundColor(Color("PaleGrey"))
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
