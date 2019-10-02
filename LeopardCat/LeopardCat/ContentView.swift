//
//  ContentView.swift
//  LeopardCat
//
//  Created by mikewang on 2019/10/1.
//  Copyright © 2019 mikewang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            
            // background
            Image("Cat3")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 400, alignment: .bottom)
            // ref: https://bnwinfor.com/2018/04/21/%E5%8D%97%E6%8A%95%E7%B8%A3%E5%8F%8B%E5%96%84%E7%9F%B3%E8%99%8E%E8%BE%B2%E4%BD%9C%E4%BF%83%E9%80%B2%E6%9C%83%E3%80%8A%E7%9F%B3%E8%99%8E%E5%AE%B6%E6%97%8F%E7%9A%84%E7%B6%A0%E4%BF%9D%E9%81%8B%E5%8B%95/
            
            
            // MARK: - HeadLayer
            
            Group {
                Path { (path) in
                    path.move(to: CGPoint(x: 53, y: 100))
                    path.addQuadCurve(to: CGPoint(x: 66, y: 17), control: CGPoint(x: 48, y: 50))
                    path.addQuadCurve(to: CGPoint(x: 119, y: 80), control: CGPoint(x: 90, y: 30))
                    path.addLine(to: CGPoint(x: 164, y: 82))
                    path.addQuadCurve(to: CGPoint(x: 214, y: 13), control: CGPoint(x: 178, y: 38))
                    path.addQuadCurve(to: CGPoint(x: 230, y: 96), control: CGPoint(x: 234, y: 60))
                    path.addQuadCurve(to: CGPoint(x: 239, y: 193), control: CGPoint(x: 265, y: 138))
                    path.addQuadCurve(to: CGPoint(x: 170, y: 242), control: CGPoint(x: 235, y: 215))
                    path.addQuadCurve(to: CGPoint(x: 80, y: 230), control: CGPoint(x: 130, y: 225))
                    path.addQuadCurve(to: CGPoint(x: 53, y: 100), control: CGPoint(x: 5, y: 175))
                    path.closeSubpath()
                }
                .stroke(Color(red: 165/255, green: 113/255, blue: 80/255), lineWidth:15)
                
                Path { (path) in
                    path.move(to: CGPoint(x: 53, y: 100))
                    path.addQuadCurve(to: CGPoint(x: 66, y: 17), control: CGPoint(x: 48, y: 50))
                    path.addQuadCurve(to: CGPoint(x: 119, y: 80), control: CGPoint(x: 90, y: 30))
                    path.addLine(to: CGPoint(x: 164, y: 82))
                    path.addQuadCurve(to: CGPoint(x: 214, y: 13), control: CGPoint(x: 178, y: 38))
                    path.addQuadCurve(to: CGPoint(x: 230, y: 96), control: CGPoint(x: 234, y: 60))
                    path.addQuadCurve(to: CGPoint(x: 239, y: 193), control: CGPoint(x: 265, y: 138))
                    path.addQuadCurve(to: CGPoint(x: 170, y: 242), control: CGPoint(x: 235, y: 215))
                    path.addQuadCurve(to: CGPoint(x: 80, y: 230), control: CGPoint(x: 130, y: 225))
                    path.addQuadCurve(to: CGPoint(x: 53, y: 100), control: CGPoint(x: 5, y: 175))
                    path.closeSubpath()
                }
                .fill(Color(red: 205/255, green: 154/255, blue: 114/255))
            }
            
            // MARK: - EarLayer
            
            Group {
                Path { (path) in
                    // left1
                    path.move(to: CGPoint(x: 61, y: 97))
                    path.addLine(to: CGPoint(x: 77, y: 75))
                    path.addLine(to: CGPoint(x: 67, y: 24))
                    path.addQuadCurve(to: CGPoint(x: 61, y: 97), control: CGPoint(x: 50, y: 58))
                    // right1
                    path.move(to: CGPoint(x: 212, y: 21))
                    path.addLine(to: CGPoint(x: 206, y: 74))
                    path.addLine(to: CGPoint(x: 223, y: 92))
                    path.addQuadCurve(to: CGPoint(x: 212, y: 21), control: CGPoint(x: 223, y: 54))
                }
                .fill(Color(red: 255/255, green: 204/255, blue: 203/255))
                
                Path { (path) in
                    //left2
                    path.move(to: CGPoint(x: 70, y: 24))
                    path.addLine(to: CGPoint(x: 84, y: 78))
                    path.addLine(to: CGPoint(x: 111, y: 84))
                    path.addQuadCurve(to: CGPoint(x: 70, y: 24), control: CGPoint(x: 99, y: 58))
                    // right2
                    path.move(to: CGPoint(x: 172, y: 82))
                    path.addLine(to: CGPoint(x: 204, y: 73))
                    path.addLine(to: CGPoint(x: 208, y: 22))
                    path.addQuadCurve(to: CGPoint(x: 172, y: 82), control: CGPoint(x: 182, y: 44))
                }
                .fill(Color(red: 0, green: 0, blue: 0))
                
                Path { (path) in
                    //left3
                    path.move(to: CGPoint(x: 86, y: 44))
                    path.addLine(to: CGPoint(x: 96, y: 57))
                    path.addLine(to: CGPoint(x: 85, y: 59))
                    path.addQuadCurve(to: CGPoint(x: 86, y: 44), control: CGPoint(x: 80, y: 52))
                    // right3
                    path.move(to: CGPoint(x: 192, y: 45))
                    path.addLine(to: CGPoint(x: 185, y: 60))
                    path.addLine(to: CGPoint(x: 195, y: 57))
                    path.addQuadCurve(to: CGPoint(x: 192, y: 45), control: CGPoint(x: 197, y: 50))
                }
                .fill(Color(red: 1, green: 1, blue: 1))
            }
            
            // MARK: - EyeLayer
            
            Group {
                
                Path { (path) in
                    path.move(to: CGPoint(x: 72, y: 123))
                    path.addQuadCurve(to: CGPoint(x: 109, y: 122), control: CGPoint(x: 87, y: 104))
                    path.addLine(to: CGPoint(x: 123, y: 90))
                    path.addLine(to: CGPoint(x: 129, y: 90))
                    path.addLine(to: CGPoint(x: 120, y: 130))
                    path.addQuadCurve(to: CGPoint(x: 100, y: 167), control: CGPoint(x: 128, y: 170))
                    path.addQuadCurve(to: CGPoint(x: 72, y: 123), control: CGPoint(x: 54, y: 160))
                    
                    path.move(to: CGPoint(x: 155, y: 89))
                    path.addLine(to: CGPoint(x: 161, y: 137))
                    path.addQuadCurve(to: CGPoint(x: 172, y: 162), control: CGPoint(x: 152, y: 160))
                    path.addQuadCurve(to: CGPoint(x: 209, y: 156), control: CGPoint(x: 188, y: 140))
                    path.addQuadCurve(to: CGPoint(x: 198, y: 123), control: CGPoint(x: 220, y: 130))
                    path.addQuadCurve(to: CGPoint(x: 173, y: 130), control: CGPoint(x: 190, y: 120))
                    path.addLine(to: CGPoint(x: 162, y: 89))
                    path.addLine(to: CGPoint(x: 155, y: 89))
                }
                .fill(Color(red: 1, green: 1, blue: 1))
                
                /* Black Eye */
                Path { (path) in
                    path.move(to: CGPoint(x: 75, y: 128))
                    path.addQuadCurve(to: CGPoint(x: 112, y: 152), control: CGPoint(x: 110, y: 106))
                    path.addQuadCurve(to: CGPoint(x: 81, y: 156), control: CGPoint(x: 106, y: 170))
                    path.addQuadCurve(to: CGPoint(x: 75, y: 128), control: CGPoint(x: 68, y: 148))
                    
                }
                .fill(Color(red: 0, green: 0, blue: 0))
                
                Path { (path) in
                    path.move(to: CGPoint(x: 170, y: 153))
                    path.addQuadCurve(to: CGPoint(x: 206, y: 145), control: CGPoint(x: 188, y: 128))
                }
                .stroke(Color(red: 0, green: 0, blue: 0), lineWidth: 5)
                
                Path { (path) in
                    path.move(to: CGPoint(x: 121, y: 0))
                    path.addQuadCurve(to: CGPoint(x: 81, y: 45), control: CGPoint(x: 89, y: 9))
                    path.addQuadCurve(to: CGPoint(x: 121, y: 0), control: CGPoint(x: 115, y: 39))
                    path.closeSubpath()
                }
                .fill(Color(red: 0, green: 1, blue: 0))
            }
            
            
            // MARK: - BeardLayer
            
            Group {
                Path { (path) in
                    path.move(to: CGPoint(x: 4, y: 152))
                    path.addQuadCurve(to: CGPoint(x: 52, y: 164), control: CGPoint(x: 26, y: 150))
                    path.move(to: CGPoint(x: 4, y: 188))
                    path.addLine(to: CGPoint(x: 54, y: 184))
                    path.move(to: CGPoint(x: 228, y: 163))
                    path.addQuadCurve(to: CGPoint(x: 281, y: 142), control: CGPoint(x: 253, y: 145))
                    path.move(to: CGPoint(x: 230, y: 178))
                    path.addLine(to: CGPoint(x: 282, y: 201))
                    path.move(to: CGPoint(x: 121, y: 91))
                    
                    path.move(to: CGPoint(x: 121, y: 89))
                    path.addLine(to: CGPoint(x: 110, y: 113))
                    path.move(to: CGPoint(x: 134, y: 89))
                    path.addLine(to: CGPoint(x: 126, y: 119))
                    
                    path.move(to: CGPoint(x: 152, y: 89))
                    path.addLine(to: CGPoint(x: 157, y: 119))
                    path.move(to: CGPoint(x: 164, y: 89))
                    path.addLine(to: CGPoint(x: 173, y: 119))
                    
                    path.closeSubpath()
                }
                .stroke(Color(red: 0, green: 0, blue: 0), lineWidth: 5)
                
            }
            
            Group {
                // White Eyeball
                Path(ellipseIn: CGRect(x: 86, y: 130, width: 10, height: 10))
                    .fill(Color(red: 1, green: 1, blue: 1))
                
                Path { (path) in
                    path.move(to: CGPoint(x: 78, y: 137))
                    path.addQuadCurve(to: CGPoint(x: 106, y: 152), control: CGPoint(x: 82, y: 160))
                }
                .stroke(Color(red: 1, green: 1, blue: 1), lineWidth: 5)
                
                Path { (path) in
                    path.move(to: CGPoint(x: 80, y: 133))
                    path.addQuadCurve(to: CGPoint(x: 110, y: 152), control: CGPoint(x: 76, y: 150))
                    path.addQuadCurve(to: CGPoint(x: 78, y: 148), control: CGPoint(x: 90, y: 165))
                    path.addQuadCurve(to: CGPoint(x: 78, y: 133), control: CGPoint(x: 74, y: 140))
                }
                .fill(Color(red: 1, green: 1, blue: 1))
            }
            
            // MARK: - MouthLayer
            
            Group {
                Path { (path) in
                    path.move(to: CGPoint(x: 119, y: 225))
                    path.addQuadCurve(to: CGPoint(x: 128, y: 178), control: CGPoint(x: 98, y: 196))
                    path.addQuadCurve(to: CGPoint(x: 152, y: 177), control: CGPoint(x: 140, y: 172))
                    path.addQuadCurve(to: CGPoint(x: 153, y: 230), control: CGPoint(x: 191, y: 198))
                    path.addQuadCurve(to: CGPoint(x: 119, y: 225), control: CGPoint(x: 136, y: 222))
                }
                .fill(Color(red: 1, green: 1, blue: 1))
                
                Path { (path) in
                    path.move(to: CGPoint(x: 135, y: 210))
                    path.addLine(to: CGPoint(x: 138, y: 192))
                    path.addLine(to: CGPoint(x: 128, y: 185))
                    path.addQuadCurve(to: CGPoint(x: 130, y: 179), control: CGPoint(x: 126, y: 176))
                    
                    path.addQuadCurve(to: CGPoint(x: 148, y: 178), control: CGPoint(x: 138, y: 174))
                    path.addQuadCurve(to: CGPoint(x: 146, y: 186), control: CGPoint(x: 153, y: 181))
                    path.addLine(to: CGPoint(x: 143, y: 193))
                    path.addLine(to: CGPoint(x: 144, y: 210))
                    path.addLine(to: CGPoint(x: 135, y: 210))
                }
                .fill(Color(red: 0, green: 0, blue: 0))
                
                Path { (path) in
                    path.move(to: CGPoint(x: 135, y: 210))
                    path.addQuadCurve(to: CGPoint(x: 117, y: 200), control: CGPoint(x: 124, y: 220))
                    path.move(to: CGPoint(x: 144, y: 210))
                    path.addQuadCurve(to: CGPoint(x: 164, y: 200), control: CGPoint(x: 150, y: 220))
                }
                .stroke(Color(red: 0, green: 0, blue: 0), lineWidth: 5)
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
