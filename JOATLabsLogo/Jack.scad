
HullCenter = 9; 	//sphere size of center
armLength = 40;		//length of all arms
HullEndPercent = .4;	//diameter of hull on arm end as percentage of HullCenter
points = 11;	//size of point balls
$fn = 60;

Jack();


module Jack(){
	for(i= [[0,0,0],
			[90,0,0],
			[180,0,0],
			[270,0,0],
			[0,90,0],
			[0,270,0]]){
		rotate(i){
		hull(){
			sphere(HullCenter);
			cylinder(armLength,r=HullCenter*HullEndPercent);
		}
		translate([0,0,armLength+points*.85])
		sphere(points);
		}
	}
	//sphere(11.3);
}

//              This is for JOATLABS!!