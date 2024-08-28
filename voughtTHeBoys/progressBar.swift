//
//  progressBar.swift
//  voughtTHeBoys
//
//  Created by Aditya Rai on 27/08/24.
//

import SwiftUI

struct CustomProgressView: View {
    var progress: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(Color.white.opacity(0.5))
                    .cornerRadius(5)
                
                Rectangle()
                    .frame(width: geometry.size.width * self.progress, height: geometry.size.height)
                    .foregroundColor(.white)
                    .cornerRadius(5)
            }
        }
    }
        
}

#Preview {
    CustomProgressView(progress: 0.1)
}
