//
//  MetalView.swift
//  Thriends
//
//  Created by Mac on 24/02/2025.
//

import SwiftUI
import MetalKit

struct MetalView: UIViewRepresentable {
    class Coordinator: NSObject, MTKViewDelegate {
        var parent: MetalView
        var device: MTLDevice
        var commandQueue: MTLCommandQueue
        var pipelineState: MTLRenderPipelineState
        var time: Float = 0
        
        init(parent: MetalView) {
            self.parent = parent
            self.device = MTLCreateSystemDefaultDevice()!
            self.commandQueue = device.makeCommandQueue()!
            
            let library = device.makeDefaultLibrary()!
            let vertexFunction = library.makeFunction(name: "vertex_main")!
            let fragmentFunction = library.makeFunction(name: "fragment_main")!
            
            let pipelineDescriptor = MTLRenderPipelineDescriptor()
            pipelineDescriptor.vertexFunction = vertexFunction
            pipelineDescriptor.fragmentFunction = fragmentFunction
            pipelineDescriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
            
            self.pipelineState = try! device.makeRenderPipelineState(descriptor: pipelineDescriptor)
        }
        
        func draw(in view: MTKView) {
            guard let drawable = view.currentDrawable,
                  let descriptor = view.currentRenderPassDescriptor,
                  let commandBuffer = commandQueue.makeCommandBuffer(),
                  let commandEncoder = commandBuffer.makeRenderCommandEncoder(descriptor: descriptor) else { return }
            
            time += 0.016 // Update time
            
            var timeBuffer = device.makeBuffer(bytes: &time, length: MemoryLayout<Float>.size, options: [])
            
            commandEncoder.setRenderPipelineState(pipelineState)
            commandEncoder.setVertexBytes(&time, length: MemoryLayout<Float>.size, index: 0)
            commandEncoder.setFragmentBuffer(timeBuffer, offset: 0, index: 0)
            
            commandEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: 6)
            
            commandEncoder.endEncoding()
            commandBuffer.present(drawable)
            commandBuffer.commit()
        }
        
        func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {}
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> MTKView {
        let view = MTKView()
        view.device = context.coordinator.device
        view.delegate = context.coordinator
        view.enableSetNeedsDisplay = true
        view.isPaused = false
        return view
    }
    
    func updateUIView(_ uiView: MTKView, context: Context) {}
}
