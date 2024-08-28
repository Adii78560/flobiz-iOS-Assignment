//
//  ContentView.swift
//  voughtTHeBoys
//
//  Created by Aditya Rai on 27/08/24.
//

import SwiftUI
struct ContentView: View {
    var theBoys: [String] = ["butcher", "frenchie", "hughei", "mm"]
    
    @State private var currentIndex: Int = 0
    @State private var progress: CGFloat = 0.0
    @State private var timer: Timer? = nil
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
      
                Image(self.theBoys[self.currentIndex])
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .foregroundColor(.white)
                    .cornerRadius(5)
                    .animation(.easeInOut)
                
         
                HStack(alignment: .center, spacing: 4) {
                    ForEach(0..<self.theBoys.count, id: \.self) { index in
                        CustomProgressView(progress: index == self.currentIndex ? self.progress : (index < self.currentIndex ? 1.0 : 0.0))
                            .frame(height: 4)
                            .animation(.linear)
                    }
                }
                .padding(.top,60)
//                .padding()
            }
            .onAppear {
                self.startTimer()
            }
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onEnded { value in
                        if value.location.x < geometry.size.width / 2 {
                            self.advanceToPrevious()
                        } else {
                            self.advanceToNext()
                        }
                    }
            )
        }
        .ignoresSafeArea()
    }
    func startTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { _ in
            self.progress += 0.01
            if self.progress >= 1.0 {
                self.progress = 0.0
                self.currentIndex = (self.currentIndex + 1) % self.theBoys.count
            }
        }
    }
    func advanceToNext() {
        self.timer?.invalidate()
        self.progress = 0.0
        self.currentIndex = (self.currentIndex + 1) % self.theBoys.count
        self.startTimer()
    }
    func advanceToPrevious() {
        self.timer?.invalidate()
        self.progress = 0.0
        self.currentIndex = (self.currentIndex - 1 + self.theBoys.count) % self.theBoys.count
        self.startTimer()
    }
    func stopTimer() {
        self.timer?.invalidate()
        self.timer = nil
    }
}
#Preview {
    ContentView()
}
