morse = [0,1,0,0,1,1,0,0,0,1,1,1];

//offset = 0;
count = 12;

for (a = [0 : len(morse) - 1]) {
    
     translate([a,morse[a],a])
    {
   if(morse[a] == 1)
    {
    translate([a,morse[a],a]){
                cube(1);
        }
    }
}
//$morse(a) = $morse(a);
}