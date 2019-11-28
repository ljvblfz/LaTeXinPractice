// xiantu.asy
// 弦图

pen helpline = gray + 0.4;
pen zhu = black + 0.8;
pen huang = black + 0.8;

path[] grid(pair z1, pair z2, real xstep = 1, real ystep = xstep)
{
    path[] g;
    pair lb = minbound(z1, z2);
    pair rt = maxbound(z1, z2);
    for (real x = ceil(lb.x/xstep)*xstep; x <= rt.x; x += xstep)
	g.push((x, lb.y) -- (x, rt.y));
    for (real y = ceil(lb.y/ystep)*ystep; y <= rt.y; y += ystep)
	g.push((lb.x, y) -- (rt.x, y));
    return g;
}

unitsize(1cm);
settings.tex = "xelatex";

usepackage("xeCJK");
texpreamble(
"\setCJKmainfont[RawFeature={script=hani:language=CHN:vertical:+valt}]
{FZSongHeiTi_GB18030}");
defaultpen(fontsize(10.5)); // 五号

Label vert(Label L)
{
    return rotate(-90) * L;
}

path huangshi = box((3,3), (4,4));
path[] zhushi = (0,3)--(4,0)--(7,4)--(3,7)--cycle ^^ reverse(huangshi);
fill(zhushi, palegray);
fill(huangshi, lightgray);
draw(grid((0,0), (7,7)), helpline);
draw(shift(4)*rotate(degrees((3,4)))*grid((0,0), (5,5)), helpline);
draw(zhushi, zhu);
draw((0,3)--(4,3) ^^ (4,0)--(4,4) ^^ (7,4)--(3,4) ^^ (3,7)--(3,3), zhu);

label(vert("中黃實"), (3.5,3.5));
label(vert("朱實"), (2,4), right);
label(vert("弦實"), (5,4), left);
label(Label("句三",MidPoint,Rotate(down)), (4,0)--(4,3), LeftSide);
label(Label("股四",MidPoint,Rotate(left)), (0,3)--(4,3), RightSide);
label(Label("弦五",MidPoint,Rotate((4,-3))), (0,3)--(4,0), LeftSide);

