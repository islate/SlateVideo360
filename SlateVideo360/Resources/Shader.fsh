//
//  Shader.fsh
//
//  Created by  on 11/8/15.
//  Copyright © 2015 Hanton. All rights reserved.
//

//varying lowp vec4 colorVarying;

precision mediump float;
uniform sampler2D SamplerY;
uniform sampler2D SamplerUV;
varying mediump vec2 v_textureCoordinate;

uniform mat3 colorConversionMatrix;

void main() {
  mediump vec3 yuv;
  lowp vec3 rgb;
  
  // Subtract constants to map the video range start at 0
  yuv.x = (texture2D(SamplerY, v_textureCoordinate).r - (16.0/255.0))* 1.0;
  yuv.yz = (texture2D(SamplerUV, v_textureCoordinate).rg - vec2(0.5, 0.5))* 1.0;
  
  rgb = colorConversionMatrix * yuv;
  
  gl_FragColor = vec4(rgb,1);
}