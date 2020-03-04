struct VertexShaderInput {
  float2 vsi_pos : POSITION;
  float2 vsi_uv  : TEXCOORD;
};

struct PixelShaderInput {
  float4 psi_pos : SV_POSITION;
  float2 psi_uv  : TEXCOORD;
};

cbuffer ConstantBufferTransform : register(b0) {
  float4x4 MVP;
}

PixelShaderInput vs_main(VertexShaderInput input)
{
  PixelShaderInput output;
  output.psi_pos = mul(MVP, float4(input.vsi_pos, 0.0, 1.0));
  output.psi_uv = float2(input.vsi_uv.x, 1.0 - input.vsi_uv.y);
  return output;
}

Texture2D g_texture : register(t0);
SamplerState g_sampler {
  Filter = MIN_MAG_MIP_NEAREST;
  AddressU = Wrap;
  AddressV = Wrap;
};

float4 ps_main(PixelShaderInput input) : SV_TARGET
{
  return g_texture.Sample(g_sampler, input.psi_uv);
}
