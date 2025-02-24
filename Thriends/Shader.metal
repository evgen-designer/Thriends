//
//  Shader.metal
//  Thriends
//
//  Created by Mac on 24/02/2025.
//

#include <metal_stdlib>
using namespace metal;

struct VertexOut {
    float4 position [[position]];
    float2 texCoord;
};

vertex VertexOut vertex_main(uint vertexID [[vertex_id]]) {
    float2 positions[6] = {
        {-1.0, -1.0}, {1.0, -1.0}, {-1.0,  1.0}, // First triangle
        {1.0, -1.0}, {1.0,  1.0}, {-1.0,  1.0}  // Second triangle
    };
    
    VertexOut out;
    out.position = float4(positions[vertexID], 0.0, 1.0);
    out.texCoord = positions[vertexID] * 0.5 + 0.5;
    return out;
}

fragment float4 fragment_main(VertexOut in [[stage_in]], constant float &time [[buffer(0)]]) {
    float2 uv = in.texCoord;
    float r = 0.5 + 0.5 * sin(time + uv.x * 10.0);
    float g = 0.5 + 0.5 * cos(time + uv.y * 10.0);
    float b = 0.5 + 0.5 * sin(time * 0.5);
    return float4(r, g, b, 1.0);
}
