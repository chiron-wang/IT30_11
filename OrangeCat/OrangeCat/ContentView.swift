//
//  ContentView.swift
//  OrangeCat
//
//  Created by mikewang on 2019/10/12.
//  Copyright © 2019 mikewang. All rights reserved.
//

import SwiftUI

let imageNames = 1...30

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack {
                NavigationLink(destination: ListView()){
                    Image("Home")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 400, height: 400)
                }
            }
            .navigationBarTitle("螞蟻工坊-橘皮貓")
        }
    }
}

struct ListView: View {
    var index = 1
    var body: some View {
        VStack {
            ScrollView(Axis.Set.vertical, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(1...3, id: \.self) { name in
                        NavigationLink(destination: DetailsCatView(name: "\(name)")) {
                            Image("\(name)")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 120, height: 120)
                        }
                    }
                }
                HStack(alignment: .top, spacing: 0) {
                    ForEach(4...6, id: \.self) { name in
                        NavigationLink(destination: DetailsCatView(name: "\(name)")) {
                            Image("\(name)")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 120, height: 120)
                        }
                    }
                }
                HStack(alignment: .top, spacing: 0) {
                    ForEach(7...9, id: \.self) { name in
                        NavigationLink(destination: DetailsCatView(name: "\(name)")) {
                            Image("\(name)")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 120, height: 120)
                        }
                    }
                }
                HStack(alignment: .top, spacing: 0) {
                    ForEach(10...12, id: \.self) { name in
                        NavigationLink(destination: DetailsCatView(name: "\(name)")) {
                            Image("\(name)")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 120, height: 120)
                        }
                    }
                }
                HStack(alignment: .top, spacing: 0) {
                    ForEach(13...15, id: \.self) { name in
                        NavigationLink(destination: DetailsCatView(name: "\(name)")) {
                            Image("\(name)")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 120, height: 120)
                        }
                    }
                }
                HStack(alignment: .top, spacing: 0) {
                    ForEach(16...18, id: \.self) { name in
                        NavigationLink(destination: DetailsCatView(name: "\(name)")) {
                            Image("\(name)")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 120, height: 120)
                        }
                    }
                }
                HStack(alignment: .top, spacing: 0) {
                    ForEach(19...21, id: \.self) { name in
                        NavigationLink(destination: DetailsCatView(name: "\(name)")) {
                            Image("\(name)")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 120, height: 120)
                        }
                    }
                }
                HStack(alignment: .top, spacing: 0) {
                    ForEach(22...24, id: \.self) { name in
                        NavigationLink(destination: DetailsCatView(name: "\(name)")) {
                            Image("\(name)")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 120, height: 120)
                        }
                    }
                }
                HStack(alignment: .top, spacing: 0) {
                    ForEach(25...27, id: \.self) { name in
                        NavigationLink(destination: DetailsCatView(name: "\(name)")) {
                            Image("\(name)")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 120, height: 120)
                        }
                    }
                }
                HStack(alignment: .top, spacing: 0) {
                    ForEach(28...30, id: \.self) { name in
                        NavigationLink(destination: DetailsCatView(name: "\(name)")) {
                            Image("\(name)")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 120, height: 120)
                        }
                    }
                }.navigationBarTitle("橘皮貓貼圖清單")
            }
        }
    }
}

struct DetailsCatView: View {
    var name = "1"
    var body: some View {
        VStack {
            Image(name)
                .resizable()
                .scaledToFit()
                .navigationBarTitle("Orange Cat")            
            Text("橘皮貓粉絲團")
            Text("https://www.facebook.com/orangecat0116/")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

