// logo.asy
// 弦图的 logo
import trembling;
trembleAngle=10;
trembleFrequency=0.5;
trembleRandom=4;

path[] tremble(path[] g,
             real angle=trembleAngle,
             real frequency=trembleFrequency,
             real random=trembleRandom,
             real fuzz=trembleFuzz())
{
    path[] g_trembled;
    for (path g0: g) {
	g_trembled = g_trembled ^^ tremble(g0, angle, frequency, random, fuzz);
    }
    return g_trembled;
}

pen operator %(pen p, real x) {return p + opacity(x/100);}

settings.outformat="pdf";
size(1.5cm);

pen zhu = red + 0.8;
pen huang = yellow + 0.8;

path huangshi = box((3,3), (4,4));
path[] zhushi = (0,3)--(4,0)--(7,4)--(3,7)--cycle ^^ reverse(huangshi);
path[] inner = (0,3)--(4,3) ^^ (4,0)--(4,4) ^^ (7,4)--(3,4) ^^ (3,7)--(3,3);

huangshi = tremble(huangshi);
zhushi = tremble(zhushi);
inner = tremble(inner);

filldraw(zhushi, zhu%20, zhu);
fill(huangshi, huang%70);
draw(inner, zhu);


