//
//  Processor.swift
//  FInalProject
//
//  Created by Angela Tian on 1/15/22.
//

import Foundation
import UIKit
import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

class Processor {
    

    func applyFilter(inputImage: UIImage, type: String) -> UIImage? {
        // Convert to CIImage for processing
        let enterImage = CIImage(image: inputImage)!;
        
        // Pixels from edge extend to infinty for blurs
        let beginImage = enterImage.clampedToExtent();

        // For processing
        let context = CIContext();
        
        // Determine filter
        var currentFilter = CIFilter();
        if type == "sepia_tone" {
            currentFilter = CIFilter.sepiaTone();
        } else if type == "invert" {
            currentFilter = CIFilter.colorInvert();
        } else if type == "edges" {
            currentFilter = CIFilter.edges();
        } else if type == "grayscale" {
            currentFilter = CIFilter.colorControls();
            currentFilter.setValue(0.0, forKey: kCIInputSaturationKey);
        } else if type == "saturated" {
            currentFilter = CIFilter.colorControls();
            currentFilter.setValue(2.0, forKey: kCIInputSaturationKey);
        } else if type == "posterize" {
            currentFilter = CIFilter.colorPosterize();
        } else if type == "3x3_identity" {
            let weights:[CGFloat] = [0, 0, 0, 0, 1, 0, 0, 0, 0]
            currentFilter = CIFilter(name: "CIConvolution3X3", parameters: [
                kCIInputWeightsKey: CIVector(values: weights, count: 9)
            ])!
        } else if type == "3x3_sharpen" {
            let weights:[CGFloat] = [0, -1, 0, -1, 5, -1, 0, -1, 0]
            currentFilter = CIFilter(name: "CIConvolution3X3", parameters: [
                kCIInputWeightsKey: CIVector(values: weights, count: 9)
            ])!
        } else if type == "3x3_emboss" {
            let weights:[CGFloat] = [-2, -1, 0, -1, 1, 1, 0, 1, 2]
            currentFilter = CIFilter(name: "CIConvolution3X3", parameters: [
                kCIInputWeightsKey: CIVector(values: weights, count: 9)
            ])!
        } else if type == "box3" {
            let weights:[CGFloat] = [1/9, 1/9, 1/9, 1/9, 1/9, 1/9, 1/9, 1/9, 1/9];
            currentFilter = CIFilter(name: "CIConvolution3X3", parameters: [
                kCIInputWeightsKey: CIVector(values: weights, count: 9)
            ])!
        } else if type == "box5" {
            currentFilter = CIFilter.boxBlur();
            currentFilter.setValue(5, forKey: kCIInputRadiusKey);
        } else if type == "box10" {
            currentFilter = CIFilter.boxBlur();
            currentFilter.setValue(10, forKey: kCIInputRadiusKey);
        } else if type == "box25" {
            currentFilter = CIFilter.boxBlur();
            currentFilter.setValue(25, forKey: kCIInputRadiusKey);
        } else if type == "box100" {
            currentFilter = CIFilter.boxBlur();
            currentFilter.setValue(100, forKey: kCIInputRadiusKey);
        } else if type == "gauss3" {
            let weights:[CGFloat] = [1/16, 1/8, 1/16,
                                     1/8, 1/4, 1/8,
                                     1/16, 1/8, 1/16];
            currentFilter = CIFilter(name: "CIConvolution3X3", parameters: [
                kCIInputWeightsKey: CIVector(values: weights, count: 9)
            ])!
        } else if type == "gauss5" {
            currentFilter = CIFilter.gaussianBlur();
            currentFilter.setValue(5, forKey: kCIInputRadiusKey);
        } else if type == "gauss10" {
            currentFilter = CIFilter.gaussianBlur();
            currentFilter.setValue(10, forKey: kCIInputRadiusKey);
        } else if type == "gauss25" {
            currentFilter = CIFilter.gaussianBlur();
            currentFilter.setValue(25, forKey: kCIInputRadiusKey);
        } else if type == "gauss100" {
            currentFilter = CIFilter.gaussianBlur();
            currentFilter.setValue(100, forKey: kCIInputRadiusKey);
        } 

        currentFilter.setValue(beginImage, forKey: kCIInputImageKey);
        
        // Processing filter
        let editedImage = currentFilter.outputImage;
        guard let editedImage = editedImage else {
            return nil;
        }

        // Cropped Image back to original dimensions
        let croppedImage = editedImage.cropped(to: CGRect(x: 0, y: 0, width: enterImage.extent.width, height: enterImage.extent.height));
        
        // Output of filter
        let cgimg = context.createCGImage(croppedImage, from: croppedImage.extent);
        guard let cgimg = cgimg else {
            return nil;
        }

        // Final filtered image
        let filteredImage = UIImage(cgImage: cgimg);
        return filteredImage;
    }
    
    
}
