set terminal epslatex size 8cm,4cm
set output 'sine-epslatex.tex'
set size 1,1
set xlabel '$x$'
set ylabel '$y$'
set xtics ('$-\pi$' -pi, '$-\frac12\pi$' -pi/2, 0, \
    '$\frac12\pi$' pi/2, '$\pi$' pi)
set ytics (-1, 0, 1)
set format y "$%g$"
plot [-pi:pi] [-1:1] sin(x) title '$\sin x$'
