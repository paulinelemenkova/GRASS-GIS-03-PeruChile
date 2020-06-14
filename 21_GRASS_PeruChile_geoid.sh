#!/bin/sh
# GRASS GIS script for geoid model grid (pct_geoid.nc) for Peru-Chile trenches
r.in.gdal -o pct_geoid.nc out=pct_geoid
g.list rast
d.mon wx0
d.erase
g.region res=0.001
g.region raster=pct_geoid -p -w -m nsres=0.0001 ewres=0.0001 res=0.0001
r.colors pct_geoid col=roygbiv
d.rast pct_geoid
d.redraw
d.grid size=5 color=white border_color=yellow width=0.1 fontsize=8 text_color=red
r.info pct_geoid
d.legend raster=pct_geoid range=-12,53 title=Geoid,mGal title_fontsize=8 font=Helvetica fontsize=8 -t -b bgcolor=white label_step=5 border_color=gray thin=8
d.text text="Geoid: EGM96 grid" color=yellow size=1.0 font="Times New Roman" linespacing=0.7



gdalinfo pct_geoid.nc
gdalwarp -tr 0.012 0.012 pct_geoid.nc pct_geoid_012.nc
gdalinfo pct_geoid_012.nc
r.in.gdal -o pct_geoid_012.nc out=pct_geoid_012
d.rast pct_geoid
g.region raster=pct_geoid_012 -p
r.colors pct_geoid_012 col=roygbiv
d.rast pct_geoid_012
