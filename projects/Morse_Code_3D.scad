morse = [0,1,0,0,1,1,0,0,0,1,1,1,1,0];

//offset = 0;
count = 12;
offset = 0.3;

for (a = [0 : len(morse) - 1]) {
    translate([a + (offset*a) ,0,0])
    {
        if(morse[a] == 0)
        {
            cube(size = [1,1,1]);
        }
        if(morse[a] == 1)
        {
            cube(size = [1,1,2]);
        }
    }
}
cube(size = [len(morse)+ (offset*len(morse)),1,0.5]);
