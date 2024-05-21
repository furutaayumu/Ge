struct Pixelshaderoutput
{
    float32_t4 color : SV_TARGET0;
};

Pixelshaderoutput main()
{
    Pixelshaderoutput output;
    output.color = float32_t4(1.0, 1.0, 1.0, 1.0);
    return output;
}