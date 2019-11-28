xelatex testgls
makeindex -s simplegloss.ist -o testgls.gls -t testgls.glg testgls.glo
xelatex testgls