//
//  ARView.swift
//  Homedex
//
//  Created by Calvin Li on 5/26/25.
//

import ARKit
import RealityKit
import SwiftUI
import simd


struct CustomARView : View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)

        // Start AR session
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        arView.session.run(config)

        // Create Cube Model
        let mesh = MeshResource.generateBox(size: 0.1, cornerRadius: 0.005)
        let material = SimpleMaterial(color: .red, roughness: 0.15, isMetallic: true)
        let model = ModelEntity(mesh: mesh, materials: [material])
        model.transform.translation.y = 0.1

        // Create horizontal plane anchor
        let anchor = AnchorEntity(.plane(.horizontal, classification: .any, minimumBounds: simd_float2(0.2, 0.2)))
        anchor.children.append(model)

        arView.scene.anchors.append(anchor)

        return arView
    }

    
    func updateUIView(_ uiView: ARView, context: Context) {}
}

#Preview {
    CustomARView()
}
