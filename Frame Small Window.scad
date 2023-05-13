frameLength = 186;
frameWidth = 186;
frameHeight = 3;
frameInset = 12;

pinHeight = 4;
pinDiameter = 2;

pinX = (frameWidth / 2) - (frameInset / 2);
pinY = (frameLength / 2 - (frameInset / 2));
pinZ = frameHeight - 2;

difference() {
    // outer frame with pins
    union() {
        cube(size=[frameWidth, frameLength, frameHeight], center=true);
        
        translate([pinX, pinY, pinZ]) 
        cylinder(h=pinHeight, d=pinDiameter);
        
        translate([-pinX, pinY, pinZ]) 
        cylinder(h=pinHeight, d=pinDiameter);
        
        translate([pinX, -pinY, pinZ]) 
        cylinder(h=pinHeight, d=pinDiameter);
        
        translate([-pinX, -pinY, pinZ]) 
        cylinder(h=pinHeight, d=pinDiameter);
    }
    
    // cut out the center
    cube(size=[frameWidth - (frameInset * 2), 
            frameLength - (frameInset * 2), 
            frameHeight + 1], 
        center=true
    );
}
