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
    location <-3, 1.4, 4>
    look_at  <0, 0, 0>
  }
                                
#declare RodRadius = 0.05   ;                             
#declare Texture = texture {
      Glass
      pigment{ transmit 0.7 }
      finish { reflection 1.0}
    }
    
#declare RodTexture = texture {
      pigment { rgb <0.1, 0.1, 1> }
    }
    
plane { <0, 1, 0>, -2
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

#declare phi = (1 + sqrt(5)) / 2;
#declare b = 1 / phi;
#declare c = 1 / (phi * phi);

#declare Face = union {    
 polygon {5, < c,  0,  1>,  <-c,  0,  1>,  <-b,  b,  b>,  < 0,  1,  c>,  < b,  b,  b> texture {Texture}}
 cylinder {  < c,  0,  1>,  <-c,  0,  1>, RodRadius open  texture { RodTexture  }  }
 cylinder {  <-c,  0,  1>,  <-b,  b,  b>, RodRadius open  texture { RodTexture  }  }
 cylinder {  <-b,  b,  b>,  < 0,  1,  c>, RodRadius open  texture { RodTexture  }  }
 cylinder {  < 0,  1,  c>,  < b,  b,  b>, RodRadius open  texture { RodTexture  }  }
 cylinder {  < b,  b,  b>, < c,  0,  1>, RodRadius open  texture { RodTexture  }  }
}

#declare FaceTemplates = union {
    object { Face }
    object { Face rotate y * 90 rotate x * 90}
    object { Face rotate y * 180 }
    object { Face rotate -y * 90 rotate -x * 90}
    
    object { Face rotate x * 90 rotate -y * 90}
    object { Face rotate x * 90 rotate y * 90}
}

union {
object { FaceTemplates }
//object { FaceTemplates rotate x * 90 }
object { FaceTemplates rotate x * 180 }
//object { FaceTemplates rotate x * 270 }
scale 1.6
rotate y * 90 * clock 

}
