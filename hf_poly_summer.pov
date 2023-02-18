#version 3.8;
global_settings { assumed_gamma 1 }

#include "colormaps.inc"

//
// Camera
//
camera 
{ 
  location <1.78, 1.75, 2.2,>
  look_at < 0.12,-0.5,0>
  angle 28
}

//
// Light
//
light_source { <10,10,10>, rgb <1,1,1> }

//
// Colormap
//
#declare summer = make_colormap (summer, 0, 0);

//
// Exponential function
//
#declare fn = function { pattern {
                         granite poly_wave 0.2 scale 0.7 }}

//
// Height field
// 
#declare hf = height_field {
     function 800, 800 { fn(x,y,z) }
     smooth
     scale <1,  0.4, 1>
     pigment { gradient y
               color_map  {summer}
               scale 0.1 }}
//
// Object
//
intersection{

  box{0.165, 0.99 
  pigment {  gradient y
             color_map {summer}
             translate -y * 0.45
             scale 0.3 }}

  object { hf }

  scale y * 0.8
}
