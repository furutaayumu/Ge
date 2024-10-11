#include "particle.hlsli"


struct TransformationMatrix
{
    float4x4 WVP;
};
StructuredBuffer<TransformationMatrix> gTransformationMatirices : register(t0);



struct VertexShaderInput {
	float4 position : POSITION0;
    float2 texcoord : TEXCOORD0;
};

VertexShaderOutput main(VertexShaderInput input,uint32_t instanceId : SV_InstanceID) {
	
	VertexShaderOutput output;
	output.position = mul(input.position, gTransformationMatirices[InstanceId].WVP) ;//output.position = input.position
    output.texcoord = input.texcoord;
	return output;
}


