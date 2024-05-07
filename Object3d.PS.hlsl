float4 main( float4 pos : POSITION ) : SV_POSITION
{
	return pos;
}

struct PixelShaderOutput
{
    float32_t4 color : SV_TARGET0;
};

PixelShaderOutput main()
{
    PixelShaderOutput output;
    output.color = float32_t4(1.0, 1.0, 1.0, 1.0);
    return output;
}