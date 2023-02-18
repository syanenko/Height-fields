#version 3.8;
global_settings { assumed_gamma 1 }

#include "colormaps.inc"

//
// Camera
//
camera 
{ 
  location <1.7, 1.25, 2.2,> // / 1.1
  look_at < 0.12,-0.5,0>
  angle 35
}

//
// Light
//
light_source { <10,10,10>, rgb <1,1,1> }

//
// Colormap
//
#declare hot = make_colormap (hot, 0, 0);

//
// Sine function
//
#declare fn = function { pattern {
                         granite sine_wave scale 0.7 }}

//
// Height field
// 
#declare hf = height_field {
         function 800, 800 { fn(x, y, z) }
         smooth
         scale <1,0.097,1>
         pigment { gradient y
                   color_map  {hot}
                   scale 0.075
                   translate -y * 0.047 }}
//
// Object
//
intersection{

  box{-0.135, 0.99 
  pigment {  gradient y
             color_map {hot}
             translate -y * 0.45
             scale 0.3 }}

  object { hf }

  scale y * 0.8
}