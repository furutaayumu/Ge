struct Pixelshaderoutput
{
    float4 color : SV_TARGET0;
};

Pixelshaderoutput main()
{
    Pixelshaderoutput output;
    output.color = float4(1.0, 1.0, 1.0, 1.0);
    return output;
}