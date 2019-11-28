guide star(int n = 5, real r0 = 1)
{
    guide unitstar;
    if (n < 5) return nullpath;
    real theta = 180/n;
    real r = Cos(2theta) / Cos(theta);
    for (int k = 0; k < n; ++k)
        unitstar = unitstar -- dir(90+2k*theta)
            -- r * dir(90+(2k+1)*theta);
    unitstar = unitstar -- cycle;
    return scale(r0) * unitstar;
}
for (int i = 5; i <= 8; ++i)
    filldraw(shift(i*2cm,0) * star(i,1cm), lightgray, gray+1mm);
