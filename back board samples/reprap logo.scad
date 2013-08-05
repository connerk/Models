///////////////////////////////////////////////////////////////////////////////OpenSCAD///////////////////
/*///////////////////////////////////////////////////

date started:	6/13/2013
date finished:
modeler:			Patrick Conner
copyright:		N/A

*/


//////////////////////////////////////////////////////////////////////////////perameters////////////////////////////////////////////////////////////////////

include<Write.scad>

h = 6;

t = 4;

width = 25;

height = 45;

//////////////////////////////////////////////////////////////////////////////renders///////////////////////////////////////////////////////////////////////


reprap_logo();





//////////////////////////////////////////////////////////////////////////////modules///////////////////////////////////////////////////////////////////////

module example(){
	for(x = [0:1/3:1]){
		translate([x*height*4,0,0])
			for(y = [0:1/5:1]){
				translate([0,y*width*8,0])
					color([x,y,y-x],1)
						reprap_logo();
			}
	}
}

module reprap_logo(){
	union(){
		difference(){
			translate([-height/3,-width/2,0])
				cube([height,width,5]);
			translate([0,0,2])
				rotate([0,-90,0])
					TearDrop((width-5)/2,6);
		}
			translate([height/2-8,-5,5])
				rotate([0,0,90])
					write("Rep",center=true);
			translate([height/2+1,5,5])
				rotate([0,0,90])
					write("Rap",center=true);
	}
}	

module TearDrop(radius,depth)
{
  teardiff = (	sqrt(	( (radius * 2) * (radius * 2) ) * 2 ) - (radius * 2) ) / 2;
  translate(v = [depth/2,0,-teardiff / 2])
  rotate(a = [0,-90,0])
  union()
  {
    cylinder(h=depth,r=radius, center = true);
    intersection()
    {
      rotate(a = [0,0,45])
      cube([2*radius,2*radius,depth], center = true);
      translate([1.65*radius, 0, 0])
      cube([2*radius,2*radius,depth], center = true);
    }
  }
}