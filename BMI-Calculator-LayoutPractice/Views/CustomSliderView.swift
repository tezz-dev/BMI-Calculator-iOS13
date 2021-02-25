//
//  CustomSliderView.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by tezz on 24/02/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import SwiftUI

struct HeightView: View {
    @State var width = UIScreen.main.bounds.width * 0.9
    @State var height = 80
    @State var val = 0.0
    @State var foregroundColor = Color(red: 0.3333, green: 0.3333, blue: 0.3333)
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Text("Height")
                        .font(.system(size: 18.0))
                        .fontWeight(.bold)
                        .foregroundColor(foregroundColor)
                }.frame(width: CGFloat(width * 0.9), alignment: .leading)
                HStack {
                    Text("\(Int((val * 150 + 80) / 2.54) / 12)' \(Int((val * 150 + 80) / 2.54) % 12)\" : \(Int(val * 150 + 80)) cm")
                        .fontWeight(.bold)
                        .foregroundColor(foregroundColor)
                }.frame(width: CGFloat(width * 0.9), alignment: .trailing)
            }
            ModernSlider(title: "height", width: width * 0.95, val: $val, foregroundColor: foregroundColor)
        }
        .frame(width: CGFloat(width))
    }
}

struct WeightView: View {
    @State var width = UIScreen.main.bounds.width * 0.9
    @State var height = 80
    @State var val = 0.0
    @State var foregroundColor = Color(red: 0.3333, green: 0.3333, blue: 0.3333)
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Text("Weight")
                        .font(.system(size: 18.0))
                        .fontWeight(.bold)
                        .foregroundColor(foregroundColor)
                }.frame(width: CGFloat(width * 0.9), alignment: .leading)
                HStack {
                    Text("\(Int((val * 120 + 25) * 2.20462)) lb : \(Int(val * 120 + 25)) kg")
                        .fontWeight(.bold)
                        .foregroundColor(foregroundColor)
                }.frame(width: CGFloat(width * 0.9), alignment: .trailing)
            }
            ModernSlider(title: "weight", width: width * 0.95, val: $val, foregroundColor: foregroundColor)
        }
        .frame(width: CGFloat(width))
    }
}

//struct CustomSliderView_Previews: PreviewProvider {
//    static var previews: some View {
//        WeightView()
//    }
//}

struct ModernSlider: View {
    @State var title: String
    @State var width = UIScreen.main.bounds.width * 0.9
    @Binding var val: Double
    @State var foregroundColor = Color(red: 0.3333, green: 0.3333, blue: 0.3333)
    var notificationChanged = NotificationCenter.default.publisher(for: .heightValue)
    
    var body: some View {
        GeometryReader { geometry in
            // TODO: - there might be a need for horizontal and vertical alignments
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.gray)
                Rectangle()
                    .foregroundColor(Color(red: 0.3843, green: 0.3803, blue: 0.6117))
                    .frame(width: geometry.size.width * CGFloat(self.val))
            }
            .cornerRadius(12)
            .gesture(DragGesture(minimumDistance: 0)
                .onChanged({ value in
                    // TODO: - maybe use other logic here
                    self.val = Double(min(max(0, Float(value.location.x / geometry.size.width * 100)), 100)) / 100
                    
                    if title == "height" {
                        sharedObject.heightValue = val
                    }
                    else {
                        sharedObject.weightValue = val
                    }
                }))
            .animation(.spring())
            .onReceive(notificationChanged) { note in
                self.val = note.userInfo!["heightValue"]! as! Double
            }
        }
        .frame(width: width, height: 30, alignment: .center)
    }
}
