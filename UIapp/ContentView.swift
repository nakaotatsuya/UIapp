//
//  ContentView.swift
//  UIapp
//
//  Created by 中尾　達也 on 2020/08/10.
//  Copyright © 2020 Sample Inc. All rights reserved.
//

import SwiftUI

struct ContentView: View {
//    @State private var selection = 1
//
//    let selections = [
//        "C/C++",
//        "Java",
//        "Ruby",
//        "PHP",
//        "Objective-C",
//        "Swift",
//        "Kotlin"
//    ]
//
//    var body: some View {
//        Picker(selection: $selection, label: Text("プログラミング言語")) {
//            ForEach(0..<selections.count) { index in
//                Text(self.selections[index])
//            }
//        }
//    }
    
    @State var data:[String] = ["apple", "grape", "banana","orange"]

    @State var selection:[String] = ["banana"]
    @State var btnOut:String = "button"
    
    @State var input:String = ""

    var body: some View {
        VStack(spacing:50){
        Text(verbatim: "selection \(selection)")
        Divider()
        Button(action: {
            self.btnOut = "tapped!"
        }) {
            Text("\(self.btnOut)")
        }
        
        TextField("input", text: $input){
            self.data.append(self.input)
            }
            Text(verbatim: "\(self.data.last!) was added. the number of data is \(self.data.count)")
        SinglePicker(data: data, selection: $selection)
        }
    }
}

struct SinglePicker: View{
    let data:[String]
    @Binding var selection:[String]

    var body: some View {
        //GeometryReader { geometry in
            Picker("fruits", selection: self.$selection[0]){
                ForEach(0..<self.data.count) { row in
                    Text(verbatim: self.data[row]).tag(self.data[row])
                }
            }
        //}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
