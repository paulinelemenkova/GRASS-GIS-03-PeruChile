#!/bin/sh
# GRASS GIS script for plotting slope, aspect, profile and tangential curvature maps
d.mon wx0
g.region raster=pct_relief
r.slope.aspect elevation=pct_relief slope=PCTslope aspect=PCTaspect pcurvature=PCTpcurv tcurvature=PCTtcurv
# set color tables for output raster maps
r.colors map=PCTtcurv color=grey255
# display maps
#
# display slope map
d.mon wx1
r.colors -a map=PCTslope color=srtm
d.rast PCTslope
d.legend raster=PCTslope
d.text text="Slope map" color=blue size=6
#
# display aspect map
d.mon wx0
r.colors map=PCTaspect color=aspectcolr
d.rast PCTaspect
d.grid size=5 color='252:242:180' border_color=blue width=0.1 fontsize=8 text_color=blue
d.legend raster=PCTaspect title=Aspect,grad title_fontsize=8 font=Arial fontsize=8 -t -b bgcolor=white label_step=30 border_color=gray thin=8
d.text text="Aspect map" color=blue size=1.0 font="Arial" linespacing=0.7
#
# display profile curvature map
d.mon wx3
r.colors map=PCTpcurv color=curvature
d.rast PCTpcurv
d.vect TopoPCT color='100:93:134' width=0
d.legend raster=PCTpcurv title=Curvature range=-1049.713,108.0787 title_fontsize=8 font=Arial fontsize=8 -t -b bgcolor=white label_step=100 border_color=gray thin=8
r.info PCTpcurv
d.grid size=5 color='grey' border_color=blue width=0.1 fontsize=8 text_color=blue
d.text text="Profile curvature" color=blue size=1.0 font="Arial" linespacing=0.7
#
# display tangential curvature map
d.mon wx4
r.colors -n map=PCTtcurv color=ndwi
d.rast PCTtcurv
d.legend raster=PCTtcurv title=Tang_curv,m title_fontsize=8 font=Arial fontsize=7 -t -b bgcolor=white border_color=gray thin=8
d.text text="Tangential curvature" color=blue size=5
#
r.colors -a map=pct_relief color=elevation
d.rast pct_relief
r.info pct_relief
d.legend raster=pct_relief title=Elevation,m title_fontsize=8 font=Arial fontsize=7 -t -b bgcolor=white label_step=1000 border_color=gray thin=8
r.contour pct_relief out=TopoPCT1500 step=1500 --overwrite
d.vect TopoPCT1500 color='100:93:134' width=0
d.grid size=5 color='172:219:250' border_color=red width=0.1 fontsize=7 text_color=blue
d.text text="Elevation map" color=blue size=1.0 font="Arial" linespacing=0.7



r.patch in=PCTtcurv,PCTslope out=overlay --overwrite
r.colors.stddev map=overlay
r.colors -a map=overlay color=elevation
d.rast overlay
d.legend raster=overlay title=Elevation,m title_fontsize=8 font=Arial fontsize=7 -t -b bgcolor=white border_color=gray thin=8
#
r.colors -a map=PCTslope color=elevation
r.colors.stddev map=PCTslope
d.rast PCTslope
