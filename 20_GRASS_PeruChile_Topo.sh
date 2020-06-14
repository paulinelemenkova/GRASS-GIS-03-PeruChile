#!/bin/sh
g.list rast
r.info pct_relief
d.mon wx0
g.region raster=pct_relief -p
v.in.region output=pct_bbox
g.list vect
v.info map=pct_bbox
r.colors --help
r.colors pct_relief col=srtm_plus
d.rast pct_relief
d.redraw
r.contour pct_relief out=TopoPCT step=2500 --overwrite
d.vect TopoPCT color='100:93:134' width=0
d.grid size=5 color='172:219:250' border_color=yellow width=0.1 fontsize=8 text_color=red
d.vect pct_bbox color=red width=3 fill_color="none"
r.info pct_relief
d.legend raster=pct_relief range=-8100,6600 title=Topography,m title_fontsize=8 font=Arial fontsize=8 -t -b bgcolor=white label_step=500 border_color=gray thin=8
d.text text="Topography" color='0:0:51' size=1.5 font=Arial
d.text text="SRTM15_PLUS" color='0:0:51' size=1.5 font=Arial
d.text text="Peru-Chile region" color='0:0:51' size=1.5 font=Arial
d.text text="South America" color='0:0:51' size=1.5 font=Arial
