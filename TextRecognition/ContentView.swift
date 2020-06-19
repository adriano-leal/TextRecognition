//
//  ContentView.swift
//  TextRecognition
//
//  Created by Adriano Ramos on 19/06/20.
//  Copyright © 2020 Adriano Ramos. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var recognizedText = "Tap to scan"
    @State private var showScanningView = false
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(Color.gray.opacity(0.2))
                        
                        Text(recognizedText)
                            .padding()
                    }.padding()
                }
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        self.showScanningView = true
                    }) {
                        Text("Start scanning")
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Capsule().fill(Color.blue))
                }
                .padding()
            }
            .navigationBarTitle("Text Recognition")
            .sheet(isPresented: $showScanningView) {
                ScanDocumentView(recognizedText: self.$recognizedText)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
