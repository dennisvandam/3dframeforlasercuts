// overall size of the frame
frameLength = 261;
frameWidth = 261;

// thickness and width of frame
frameHeight = 3;
frameInset = 10;

// dimensions of pins on each corner
pinHeight = 7;
pinDiameter = 4;
pinResolution = 50;

// pins are in middle of the frame on each corner
pinX = (frameWidth / 2) - (frameInset / 2);
pinY = (frameLength / 2 - (frameInset / 2));
pinZ = frameHeight - 2;

difference() {
    
    // outer frame with pins
    union() {
        cube(size=[frameWidth, frameLength, frameHeight], center=true);
        
        translate([pinX, pinY, pinZ]) 
        cylinder(h=pinHeight, d=pinDiameter, $fn=pinResolution);
        
        translate([-pinX, pinY, pinZ]) 
        cylinder(h=pinHeight, d=pinDiameter, $fn=pinResolution);
        
        translate([pinX, -pinY, pinZ]) 
        cylinder(h=pinHeight, d=pinDiameter, $fn=pinResolution);
        
        translate([-pinX, -pinY, pinZ]) 
        cylinder(h=pinHeight, d=pinDiameter, $fn=pinResolution);
    }
    
    // cut out the center
    cube(size=[frameWidth - (frameInset * 2), 
            frameLength - (frameInset * 2), 
            frameHeight + 1], 
        center=true
    );
}
