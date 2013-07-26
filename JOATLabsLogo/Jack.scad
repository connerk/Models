
HullCenter = 9; 	//sphere size of center
armLength = 40;		//length of all arms
HullEndPercent = .4;	//diameter of hull on arm end as percentage of HullCenter
points = 11;	//size of point balls


$fn = 60;
ArmEndRad = HullCenter*HullEndPercent;
pointArmLengthSagitta = sqrt(points*points-ArmEndRad*ArmEndRad);

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
			cylinder(armLength,r=ArmEndRad);
		}
		translate([0,0,armLength+pointArmLengthSagitta])
		sphere(points);
		}
	}
	//sphere(11.3);
}

//              This is for JOATLABS!!