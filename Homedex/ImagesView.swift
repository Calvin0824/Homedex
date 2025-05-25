//
//  ImagesView.swift
//  Homedex
//
//  Created by Calvin Li on 5/25/25.
//

import SwiftUI

struct ImagesView: View {
    var body: some View {
        ScrollView {
            ForEach (1..<5) { index in
                Image("home\(index)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.vertical, -3)
            }
        }
        .ignoresSafeArea(edges: .top)
        .padding(.bottom, 212)
    }
}

#Preview {
    ImagesView()
}
