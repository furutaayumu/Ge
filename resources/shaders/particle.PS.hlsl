#include "particle.hlsli"

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
    float4 transformdUV = mul(float4(input.texcoord, 0.0f, 1.0f), gMaterial.uvTransform);
    float4 texturecolor = gTexture.Sample(gSampler, transformdUV.xy);
    output.color = gMaterial.color = texturecolor;
    if (output.color.a == 0.0)
    {
        discard;
    }
    return output;
}

