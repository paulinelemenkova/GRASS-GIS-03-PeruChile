#!/bin/sh
# GRASS GIS script for marine free-air gravity grid (gravPCT.grd) for Peru-Chile trenches
r.in.gdal -o curvPCT.grd out=pct_gravity_v
g.list rast
d.mon wx
d.erase
g.region res=0.001
g.region raster=pct_gravity_v -p
r.colors --help
r.colors pct_gravity_v col=celsius
#celsius
d.rast pct_gravity_v
d.redraw
d.grid size=5 color='252:242:180' border_color=yellow width=0.1 fontsize=8 text_color=yellow
r.info pct_gravity_v
d.legend raster=pct_gravity_v title=V_grav,mGal title_fontsize=8 font=Arial fontsize=8 -t -b bgcolor=white label_step=5 border_color=gray thin=8
d.text text="Vertical free-air gravity" color=blue bgcolor=white size=1.0 font="Times New Roman" linespacing=0.7
