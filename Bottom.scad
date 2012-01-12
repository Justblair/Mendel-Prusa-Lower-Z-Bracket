// ****************************************************************************
// Prusa Rigid Bottom Piece
//  By Blair Thompson
// www.justblair.co.uk
// ****************************************************************************

// Variables
// ****************************************************************************
threaded_rod_diameter = 8.9;
smooth_rod_diameter = 9.1;
bracket_thickness = 4;
vertex_rod_2_smooth_rod = 100;
base_width = 100;
base_height =60;

// Calculated Variabels
// ****************************************************************************
outer_diameter = threaded_rod_diameter + bracket_thickness*2; 

// Here Comes the Code!
// ****************************************************************************
difference(){
base();
rod_holes();
translate([vertex_rod_2_smooth_rod, base_width/2,2])
	cylinder(r=smooth_rod_diameter/2, h=base_height+2);
translate([outer_diameter/2,-1,outer_diameter*1.5])	
rotate([270,0,0])
cylinder(r=threaded_rod_diameter/2, h=base_width+2);
}// end difference
//ower_z_brace();
// Modules
// ****************************************************************************

module base(){
	hull (){
		translate([vertex_rod_2_smooth_rod, threaded_rod_diameter/2 + bracket_thickness, outer_diameter/2])
		rotate([270,0,90])
			lower_shape(20);
		// color([1,0,0])
		translate([vertex_rod_2_smooth_rod ,base_width - (threaded_rod_diameter/2 + bracket_thickness), outer_diameter/2])
		rotate([270,0,90])
			lower_shape(20);
	} // end hull
	
	translate([vertex_rod_2_smooth_rod,threaded_rod_diameter/2 + bracket_thickness, outer_diameter/2])
	rotate([270,0,90])
		lower_shape(vertex_rod_2_smooth_rod);
	// color([1,0,0])
	translate([vertex_rod_2_smooth_rod ,base_width - (threaded_rod_diameter/2 + bracket_thickness), outer_diameter/2])
	rotate([270,0,90])
		lower_shape(vertex_rod_2_smooth_rod);

	hull(){
		//translate([0, base_width/2-outer_diameter/2,])
		cube([outer_diameter, outer_diameter, outer_diameter*2]);
	translate([vertex_rod_2_smooth_rod, base_width/2,])
		cylinder(r=outer_diameter/2, h= base_height);
		} // end hull
	hull(){
		translate([0, base_width-outer_diameter,])
		cube([outer_diameter, outer_diameter, outer_diameter*2]);
	translate([vertex_rod_2_smooth_rod, base_width/2,])
		cylinder(r=outer_diameter/2, h= base_height);
		} // end hull
	cube([outer_diameter, base_width, outer_diameter*2]);
} //end module base

module lower_shape(cyl_length){
		cylinder(r=outer_diameter/2, h=cyl_length);
		translate([-outer_diameter/2, 0,0])
			cube ([outer_diameter, outer_diameter/2, cyl_length]);
} // end module

module rod_holes(){
		translate([vertex_rod_2_smooth_rod+1 ,base_width - (threaded_rod_diameter/2 + bracket_thickness), outer_diameter/2])
		rotate([270,0,90])
			cylinder(r=threaded_rod_diameter/2, h=vertex_rod_2_smooth_rod + 2);
		translate([vertex_rod_2_smooth_rod + 1,threaded_rod_diameter/2 + bracket_thickness, outer_diameter/2])
		rotate([270,0,90])
			cylinder(r=threaded_rod_diameter/2, h=vertex_rod_2_smooth_rod + 2);
} // end module