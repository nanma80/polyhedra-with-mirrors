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
    location <2.2, 0.5, 3>
    look_at  <0, 0, 0>
  }
                                
#declare RodRadius = 0.05   ;                             
#declare Texture = texture {
      Glass
      pigment{ transmit 0.7 }
      finish { reflection 1.0}
    }
#declare RodTexture = texture {
      pigment { color Blue }
    }
    
union{    
box {
    <-1, -1, 0.99>,  // Near lower left corner
    < 1, 1,  1>   // Far upper right corner
    texture {Texture}
  }                         
      
box {
    <-1, -1, 0.99>,  // Near lower left corner
    < 1, 1,  1>   // Far upper right corner
    texture {Texture}
    rotate x*90
  }    
        
box {
    <-1, -1, 0.99>,  // Near lower left corner
    < 1, 1,  1>   // Far upper right corner
    texture {Texture}
    rotate x*180
  }

box {
    <-1, -1, 0.99>,  // Near lower left corner
    < 1, 1,  1>   // Far upper right corner
    texture {Texture}
    rotate x*270
  }

box {
    <-1, -1, 0.99>,  // Near lower left corner
    < 1, 1,  1>   // Far upper right corner
    texture {Texture}
    rotate x*270
    rotate z*90
  }
  
box {
    <-1, -1, 0.99>,  // Near lower left corner
    < 1, 1,  1>   // Far upper right corner
    texture {Texture}
    rotate x*270
    rotate z*270
  }  

cylinder {
    <1, 1, 1>,     // Center of one end
    <-1, 1, 1>,     // Center of other end
    RodRadius            // Radius
    open           // Remove end caps
    texture {
      RodTexture
    }
  }

cylinder {
    <1, 1, 1>,     // Center of one end
    <-1, 1, 1>,     // Center of other end
    RodRadius            // Radius
    open           // Remove end caps
    texture {
      RodTexture
    }
    rotate x*90
  }
        
cylinder {
    <1, 1, 1>,     // Center of one end
    <-1, 1, 1>,     // Center of other end
    RodRadius            // Radius
    open           // Remove end caps
    texture {
      RodTexture
    }
    rotate x*180
  }

cylinder {
    <1, 1, 1>,     // Center of one end
    <-1, 1, 1>,     // Center of other end
    RodRadius            // Radius
    open           // Remove end caps
    texture {
      RodTexture
    }
    rotate x*270
  }

cylinder {
    <1, 1, 1>,     // Center of one end
    <-1, 1, 1>,     // Center of other end
    RodRadius            // Radius
    open           // Remove end caps
    texture {
      RodTexture
    }    
    rotate y*90
  }

cylinder {
    <1, 1, 1>,     // Center of one end
    <-1, 1, 1>,     // Center of other end
    RodRadius            // Radius
    open           // Remove end caps
    texture {
      RodTexture
    }
    rotate x*90
    rotate y*90
  }
        
cylinder {
    <1, 1, 1>,     // Center of one end
    <-1, 1, 1>,     // Center of other end
    RodRadius            // Radius
    open           // Remove end caps
    texture {
      RodTexture
    }
    rotate x*180     
    rotate y*90
  }

cylinder {
    <1, 1, 1>,     // Center of one end
    <-1, 1, 1>,     // Center of other end
    RodRadius            // Radius
    open           // Remove end caps
    texture {
      RodTexture
    }
    rotate x*270
    rotate y*90
  }
  
cylinder {
    <1, 1, 1>,     // Center of one end
    <-1, 1, 1>,     // Center of other end
    RodRadius            // Radius
    open           // Remove end caps
    texture {
      RodTexture
    }    
    rotate z*90
  }
  
cylinder {
    <1, 1, 1>,     // Center of one end
    <-1, 1, 1>,     // Center of other end
    RodRadius            // Radius
    open           // Remove end caps
    texture {
      RodTexture
    }    
    rotate z*90
    rotate y*90
  }
  
cylinder {
    <1, 1, 1>,     // Center of one end
    <-1, 1, 1>,     // Center of other end
    RodRadius            // Radius
    open           // Remove end caps
    texture {
      RodTexture
    }    
    rotate z*90
    rotate y*180
  }
  
cylinder {
    <1, 1, 1>,     // Center of one end
    <-1, 1, 1>,     // Center of other end
    RodRadius            // Radius
    open           // Remove end caps
    texture {
      RodTexture
    }    
    rotate z*90
    rotate y*270
  }
  rotate y * 90 * clock
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
  