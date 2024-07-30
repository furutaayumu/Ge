#include "object3d.hlsli"

struct Pixelshaderoutput
{
    float4 color : SV_TARGET0;
};

struct Material
{
    float4 color;
};
ConstantBuffer<Material> gMaterial : register(b0);
Texture2D<float4> gTexture : register(t0);
SamplerState gSampler : register(s0);

Pixelshaderoutput main(VertexShaderOutput input)
{
    Pixelshaderoutput output;
    
    /*output.color = gMaterial.color; *///float32_t4(1.0, 1.0, 1.0, 1.0);
    
   

    float4 textureColor = gTexture.Sample(gSampler, input.texcoord);
    output.color = gMaterial.color * textureColor;
    return output;
}

