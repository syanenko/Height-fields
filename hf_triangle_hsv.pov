#version 3.8;
global_settings { assumed_gamma 1 }

#include "colormaps.inc"

//
// Camera
//
camera 
{ 
  location <1.9, 1.8, 2.4,>
  look_at < 0.12,-0.63,0>
  angle 28
}

//
// Light
//
light_source { <10,10,10>, rgb <1,1,1> }

//
// Colormap
//
#declare hsv = make_colormap (hsv, 0, 0);

//
// Triangle wave function
//
#declare fn = function { pattern {
                        granite triangle_wave scale 0.7 }}
//
// Height field
// 
#declare hf = height_field {
         function 800, 800 { fn(x,y,z) }
         smooth
         scale <1,0.1,1>
         pigment { gradient y
                   color_map  {hsv}
                   scale 0.15 }}
//
// Object
//
intersection{

  box{-0.115, 0.99 
  pigment {  gradient y
             color_map {hsv}
             translate -y * 0.45
             scale 0.3 }}

  object { hf }

  scale y * 0.8
}
