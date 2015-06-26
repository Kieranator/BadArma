# descClassGear
Set faction loadouts in decsription.ext with inheritance.

gear_usarmywd_ucp.h is a good example. might be a better way to change the uniforms on each class, but it shows how you can inherit from an identically named class in the superclass

###to do
- integrate with f3
- separate weapons config / class
- random selection if provided array of uniforms, weapons, etc
 - rewrite weapons properties:    
 {{"weapon1", {{"mag1", mag1#},{"mag2", mag2#}}}, {"weapon2", {{"mag3", mag3#},{"mag4", mag4#}}},...}    
weapon can have multiple mag types that come with it, e.g. m240 comes with 2 reg belts 1 tracer belt
- write more faction loadouts
