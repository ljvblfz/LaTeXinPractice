import solids;
size(4cm);
currentprojection = orthographic(1, 1, 1);
real a = 4;
real h = 2.2a;
draw(scale3(a) * unitsphere, white);
draw(shift((a/2,0,-h/2)) * scale(a/2,a/2,h) * unitcylinder, gray);
