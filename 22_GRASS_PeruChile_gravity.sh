#!/bin/sh
# GRASS GIS script for marine free-air gravity grid (gravPCT.grd) for Peru-Chile trenches
r.in.gdal -o gravPCT.grd out=pct_gravity
g.list rast
d.mon wx1
d.erase
g.region res=0.001
g.region raster=pct_gravity -p
r.colors --help
r.colors pct_gravity col=celsius
d.rast pct_gravity
d.redraw
d.grid size=5 color=white border_color=yellow width=0.1 fontsize=8 bgcolor=white text_color=red
r.info pct_gravity
d.legend raster=pct_gravity range=-342,592 title=Gravity,mGal title_fontsize=8 font=Helvetica fontsize=8 -t -b bgcolor=white label_step=5 border_color=gray thin=8
d.vect pct_bbox color=red width=3 fill_color="none"
d.text text="Marine free-air" color='0:0:51' size=1.5 font=Arial
d.text text="gravity" color='0:0:51' size=1.5 font=Arial
