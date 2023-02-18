#version 3.8;
global_settings { assumed_gamma 1 }

#include "colormaps.inc"

//
// Camera
//
camera 
{ 
  location <1.7, 1.25, 2.2,>
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
#declare jet = make_colormap (jet, 0, 0);

//
// Warp function
//
#declare fn = function { pattern {
         granite scale 0.7
         warp {
	       turbulence <0.25,0.05,0> octaves 4 omega 0.6 lambda 2.3 }}}
//
// Height field
// 
#declare hf = height_field {
         function 800, 800 { fn(x,y,z) }
         smooth
         scale <1,0.1,1>
         pigment { gradient y
                   color_map  {jet}
                   scale 0.15 }}
//
// Object
//
intersection{

  box{-0.135, 0.99 
  pigment {  gradient y
             color_map {jet}
             translate -y * 0.45
             scale 0.3 }}

  object { hf }

  scale y * 0.8
}
