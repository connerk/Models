$fn = 40;
//$t = .7;
r1 = 100;
r2 = $t*r1;
s = sqrt(r1*r1-r2*r2);

circle(r1);
translate([0,0,.1]){
color("blue")square([1,r1]);
color("red")square([s,1]);
translate([s,-r2,0])
color("green")square([1,r2*2]);
}
