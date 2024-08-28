//
//  LoadingBarView.swift
//  voughtTHeBoys
//
//  Created by Aditya Rai on 28/08/24.
//
import SwiftUI
struct LoadingBarView: View {
    var progress: CGFloat

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(Color.white.opacity(0.5))
                    .cornerRadius(5)
                
                Rectangle()
                    .frame(width: geometry.size.width * self.progress, height: nil, alignment: .leading)
                    .foregroundColor(.white)
                    .cornerRadius(5)
            }
        }
    }
}
#Preview {
    LoadingBarView(progress: 0.1)
}
