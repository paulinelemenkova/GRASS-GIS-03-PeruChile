#!/bin/sh
# GRASS GIS script for neighborhood analysis of raster DEM
d.mon wx0
g.region raster=pct_relief -p
r.colors pct_relief col=elevation
d.rast pct_relief
#d.mon wx1
#r.neighbors pct_relief out=pct_relief_smooth5 method=average size=5
#r.colors pct_relief_smooth5 col=elevation
#d.rast pct_relief_smooth5
d.mon wx1
r.neighbors pct_relief out=pct_relief_smooth7 method=diversity size=7
r.colors pct_relief_smooth7 col=elevation
d.rast pct_relief_smooth7
r.info pct_relief_smooth7
d.vect pct_bbox color=red width=3 fill_color="none"
r.contour pct_relief out=TopoPCT step=2500 --overwrite
d.vect TopoPCT color='100:93:134' width=0
d.grid size=5 color=grey border_color=yellow width=0.1 fontsize=8 text_color=red
d.legend raster=pct_relief_smooth7 range=1,49 title=SmoothTopo title_fontsize=8 font=Arial fontsize=8 bgcolor=white label_step=10 border_color=gray thin=8 units=m -v -t -b
d.text text="Topography" color='0:0:51' size=1.5 font=Arial
d.text text="SRTM15_PLUS" color='0:0:51' size=1.5 font=Arial
d.text text="Spatial analysis" color='0:0:51' size=1.5 font=Arial
d.text text="Neighborhood" color='0:0:51' size=1.5 font=Arial
d.text text="Method diversity" color='0:0:51' size=1.5 font=Arial
