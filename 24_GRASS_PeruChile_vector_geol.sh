#!/bin/sh
# GRASS GIS script for importing GMT files and plotting vector lines
v.in.ogr ridge.gmt out=ridge
v.in.ogr trench.gmt out=trench
v.in.ogr volcanoes.gmt out=volcanoes
v.in.ogr transform.gmt out=transform

d.mon wx0

g.region rast=pct_relief -p
v.in.region output=pct_bbox
v.info map=pct_bbox
d.rast pct_relief
d.vect pct_bbox color=red width=5 fill_color="none" # plotting border around a map


g.region vector=ridge
d.vect ridge
d.vect trench
d.vect volcanoes
d.vect transform


ophiolites.gmt
volcanoes.gmt
LIPS.2011.gmt
LIPS.2001.points.gmt
hotspots.gmt
transform.gmt
GSFML_SF_FZ_KM.gmt
GSFML_SF_FZ_RM.gmt
GSFML.global.picks.gmt
trench.gmt

d.vect -c trench_mask
v.info map=trench

d.erase
d.vect -c trench siz=2

v.info map=pct_bbox
v.overlay ain=pct_bbox bin=trench out=trench_mask op=and

d.rast pct_relief
d.erase d.vect -c width=integer

