// Quality = 11

#version 3.7;
global_settings { assumed_gamma 1.2 } 

#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"
#include "metals.inc"
#include "glass.inc"
#include "woods.inc"

camera {
    location <1.3, 0.4, 2>
    look_at  <0, 0, 0>
  }
                                
#declare RodRadius = 0.05   ;                             
#declare Texture = texture {
      Glass
      finish { reflection {1.0} ambient 0 diffuse 0 }
      
    }
#declare RodTexture = texture {
      pigment { color Blue }
    }
    
plane { <0, 1, 0>, -1
    pigment {
      color Gray
    }
  }
  
global_settings { ambient_light Gray20 }

#declare Lightbulb = union {
    merge {
      sphere { <0,0,0>,1 }
      cylinder {
        <0,0,1>, <0,0,0>, 1
        scale <0.35, 0.35, 1.0>
        translate  0.5*z
      }
      texture {
        pigment {color rgb <1, 1, 1>}
        finish {ambient .8 diffuse .6}
      }
    }
    cylinder {
      <0,0,1>, <0,0,0>, 1
      scale <0.4, 0.4, 0.5>
      texture { Brass_Texture }
      translate  1.5*z
    }
    rotate 90*x
    scale .2
  }     
  
  light_source {
    <0, 0, 0>
    color White
    looks_like { Lightbulb }
  }          
  
  
#declare a = 1 / (2 * sqrt(2));
#declare b = 1/2;

union {
triangle { <1, 0, 0>,   <0, 1, 0>,   < 0,  0, 1 > }
triangle { <1, 0, 0>,   <0, 1, 0>,   < 0,  0, 1 > rotate x * 90 }
triangle { <1, 0, 0>,   <0, 1, 0>,   < 0,  0, 1 > rotate x * 180 }
triangle { <1, 0, 0>,   <0, 1, 0>,   < 0,  0, 1 > rotate x * 270 }
triangle { <1, 0, 0>,   <0, 1, 0>,   < 0,  0, 1 > rotate z * 90}
triangle { <1, 0, 0>,   <0, 1, 0>,   < 0,  0, 1 > rotate z * 90 rotate x * 90}
triangle { <1, 0, 0>,   <0, 1, 0>,   < 0,  0, 1 > rotate z * 90 rotate x * 180}
triangle { <1, 0, 0>,   <0, 1, 0>,   < 0,  0, 1 > rotate z * 90 rotate x * 270 }
texture {Texture }
scale 1
}
            
union {            
cylinder {  <1, 0, 0>,   <0, 1, 0>, RodRadius open    }
cylinder {  <1, 0, 0>,   <0, 1, 0>, RodRadius open   rotate x * 90 }
cylinder {  <1, 0, 0>,   <0, 1, 0>, RodRadius open   rotate x * 180 }
cylinder {  <1, 0, 0>,   <0, 1, 0>, RodRadius open   rotate x * 270 }
cylinder {  <1, 0, 0>,   <0, 1, 0>, RodRadius open   rotate y * 90 }
cylinder {  <1, 0, 0>,   <0, 1, 0>, RodRadius open   rotate y * 90 rotate x * 90 }
cylinder {  <1, 0, 0>,   <0, 1, 0>, RodRadius open   rotate y * 90 rotate x * 180 }
cylinder {  <1, 0, 0>,   <0, 1, 0>, RodRadius open   rotate y * 90 rotate x * 270 }
cylinder {  <1, 0, 0>,   <0, 1, 0>, RodRadius open   rotate y * 180 }
cylinder {  <1, 0, 0>,   <0, 1, 0>, RodRadius open   rotate y * 180 rotate x * 90}
cylinder {  <1, 0, 0>,   <0, 1, 0>, RodRadius open   rotate y * 180 rotate x * 180}
cylinder {  <1, 0, 0>,   <0, 1, 0>, RodRadius open   rotate y * 180 rotate x * 270}

texture { RodTexture  }
scale 1
}