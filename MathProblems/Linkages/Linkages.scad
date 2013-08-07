
//common Vals
baseline = 300; //distance between static points of inputCrank and outputCrank
commonWidth = 10;
commonHeight = 4;

//inputCrank Vals
inputCrankLength = 100;
inputCrankAngle = $t*360;

//OutputCrank Vals
outputCrankLength = 200;

//ConnectingRod Vals
ConnectingRodLength = 300;


inputCrankStartPoint = [0,baseline/2,0];
inputCrankEndpoint = [-inputCrankLength*cos(inputCrankAngle), inputCrankLength*sin(inputCrankAngle)+inputCrankStartPoint[1],0];

outputCrankStartPoint = [0,0,0];
outputCrankEndpoint = [0,-baseline/2,0];

ConnectingRodStartPoint = inputCrankEndpoint
ConnectingRodEndpoint


//INPUT CRANK
color("red")rod(inputCrankLength, commonWidth, commonHeight, inputCrankStartPoint,inputCrankEndpoint);
//OUTPUT CRANK

rod(outputCrankLength, commonWidth, commonHeight,outputCrankStartPoint,outputCrankEndpoint);  
//CONNECTING ROD
translate([0,0,commonHeight])
color("green")rod(ConnectingRodLength,commonWidth, commonHeight,inputCrankEndpoint, outputCrankStartPoint);
 
 
 

 

 
module rod(Length,Width,Height, Startpoint, Endpoint){		
		hull(){
			translate(Startpoint)
			cylinder(Height,r = Width/2);
			translate(Endpoint)
			cylinder(Height,r = Width/2);
			
		}

}