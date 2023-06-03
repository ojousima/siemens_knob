$fa = 0.1;
knob_dia = 35;
knob_height = 21;
knob_thickness = 3;
knob_faces = 12;
knob_face_height = knob_height / 2;
knob_face_width = 10;
knob_face_depth = 1;

inner_dia = 15;
inner_solid_height = 15;
inner_spike_height = 35;
inner_thickness = 1;

inner_wall_thickness = 1;
inner_wall_height = 13;

slot_1_thickness = 4;
slot_2_thickness = 6;


// Knob 
difference(){
    cylinder(h=knob_height, r=knob_dia/2);
    translate([0,0, knob_thickness]){
        cylinder(h=knob_height, 
                r=knob_dia/2 - knob_thickness);
    }
    translate([0,0, knob_height-2]){
        cylinder(h=3, 
                r=knob_dia/2 - inner_thickness);
    }
    translate([0,0, inner_wall_height]){
        cylinder(h=(knob_height-inner_wall_height-1.9), 
                r1=knob_dia/2 - knob_thickness,
                r2=knob_dia/2 - inner_thickness);
    }
    translate([0,0, knob_thickness]){
        cylinder(h=knob_height, 
                r=knob_dia/2 - knob_thickness);
    }
}

// Interior
difference(){
    union(){
    cylinder(h=inner_spike_height-3, r=inner_dia/2);
    translate([0,0,inner_spike_height-3]){
            minkowski(){
            cylinder(h=2, r=inner_dia/2-1);
            sphere(1);
            }
    }
    translate([0,0, inner_wall_height/2]){
        cube([  inner_wall_thickness, 
                knob_dia-knob_thickness, 
                inner_wall_height], 
                true);
        cube([  knob_dia-knob_thickness, 
                inner_wall_thickness,
                inner_wall_height], 
                true);
            }
    }
    translate([0,0, knob_thickness]){
        cylinder(h=inner_spike_height, 
                r=inner_dia/2 - inner_thickness);
    }
    translate([0,0, inner_spike_height/2 + inner_solid_height]){
        cube([slot_1_thickness,inner_dia,inner_spike_height], true);
    }
    translate([0,-5, inner_spike_height/2 + inner_solid_height]){
        cube([slot_2_thickness,inner_dia,inner_spike_height], true);
    }
    translate([0,inner_dia/2,inner_spike_height]){
        rotate(a=45, v=[1,0,0]){
            cube([10,5,10], center = true);
            }
        }
    translate([0,-inner_dia/2,inner_spike_height]){
        rotate(a=-45, v=[1,0,0]){
            cube([20,5,10], center = true);
            }
        }

}



// Faces
for(I = [1:1:knob_faces]){
    rotate(a=360/knob_faces*I, v=[0,0,1]){
        translate([-knob_face_width/2, 
                    knob_dia/2-knob_face_depth,
                    0]){
        cube([  knob_face_width, 
                knob_face_depth,
                knob_face_height],
                false);   
        }
    }
}

