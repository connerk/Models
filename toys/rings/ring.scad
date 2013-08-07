//////////////////////////////////////////////////////////////////////////////Ring//////////////////////
/*//////////////////////////////////////////////////







*/
phi = 1.618; //do not change

pi = 3.141; //do not change
///////////////////////////////////////////////////////////////////////////////parameters///////////////////////////////////////////////////////////////////

$fn = 30;

inner_diameter = 20;

thickness_ratio = [1,5];

ring_width = 6;





diamond = 0;
		
		diamond_height_top = 1.5;
		
		diamond_height_bottom = 3;
		
		diamond_diameter_top = 3.5;
		
		diamond_diameter_middle = 5;
		
		diamond_diameter_bottom = 2;
		
		little_diamond_size = 1;
		
		facets = 12;

spiral = 1;
		
		density = 50;

		width = .55;

		angle = 45;
		


//////////////////////////////////////////////////////////////////////////////renders///////////////////////////////////////////////////////////////////////

ring_base();






//////////////////////////////////////////////////////////////////////////////modules///////////////////////////////////////////////////////////////////////


module ring_base(style){
	rotate([90,0,0])
		difference(){
			rotate_extrude()
				translate([inner_diameter/2,0,0])
					resize(thickness_ratio)
						circle(ring_width);
			cylinder(ring_width*thickness_ratio[1]*2,inner_diameter/2-ring_width/2,inner_diameter/2-ring_width/2,center = true);

			if(spiral)rotate([90,0,0]) spiralMod();
		}
	translate([0,0,inner_diameter/2]){
		if(diamond)diamondMod();
	}
}

module diamondMod(){
	
	intersection(){
		union(){
			cylinder(diamond_height_bottom,
						diamond_diameter_bottom,
						diamond_diameter_middle,
						$fn=facets);
			translate([0,0,diamond_height_bottom])
				cylinder(diamond_height_top,
							diamond_diameter_middle,
							diamond_diameter_top,
							$fn=facets);
		}
			rotate([0,0,360/facets/2])
			cylinder(diamond_height_bottom+diamond_height_top,
							r=diamond_diameter_middle-(little_diamond_size*.01),$fn = facets);
		
	}
}

module spiralMod(){
	for(r = [0:360/density:360]){
		rotate([0,r,0])
			translate([inner_diameter/2+width/2,0,0])
				rotate([angle,0,0])
					cube([width,ring_width*thickness_ratio[1]/2,width],center=true);
	}	
}











