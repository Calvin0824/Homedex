//
//  Overlay.swift
//  homedex (iOS)
//
//  Created by Calvin Li on 5/18/25.
//

import SwiftUI

struct Overlay: View {
    @State private var isOverlayPresent = true
    
    
    var body: some View {
        ZStack {
            ImagesView()
            
            VStack {
                
                Spacer()
                
                UnevenRoundedRectangle(
                    topLeadingRadius: 8,
                    topTrailingRadius: 8
                )
                .foregroundStyle(.cyan)
                .frame(height: 42)
            }
            .padding(.bottom, 180)
        }
        .sheet(isPresented: $isOverlayPresent) {
            PropertyDetails()
                .presentationDetents([.fraction(0.24), .large])
                .presentationBackgroundInteraction(.enabled(upThrough: .fraction(0.24)))
        }
    }
}


#Preview {
    Overlay()
}
