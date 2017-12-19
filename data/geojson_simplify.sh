#!/bin/bash

# Script name: geojson_simplify.sh
#
# Author: Paul Geil
# Date: 12/17
# 
# For examples and refs:
# https://ben.balter.com/2013/06/26/how-to-convert-shapefiles-to-geojson-for-use-on-github/
# https://lukesingham.com/map-of-australia-using-osm-psma-and-shiny/

display_usage() { 
	echo "This program is used to reduce the size of a geojson file." 
	echo "Usage: $(basename "$0") [-h] [-r p] filename.geojson"
	echo "where:"
	echo "    -h  show this help text"
	echo "    -r  set the final reduced file size percentage (default: 10)"
  echo "Output: filename_simplified.geojson"
	}

final_red_pc=10
while getopts ':hr:' option; do
  case "$option" in
    h) display_usage
       exit 0
       ;;
    r) final_red_pc=$OPTARG
	   if [ $# -le 2 ]; then
    		echo "Illegal number of parameters."
    		display_usage
    		exit 1
	   fi
       ;;
    :) printf "Missing argument for -%s\n" "$OPTARG" >&2
       display_usage
       exit 1
       ;;
   \?) printf "Illegal option: -%s\n" "$OPTARG" >&2
       display_usage
       exit 1
       ;;
  esac
done

if [ $# -lt 1 ]; then
    echo "Illegal number of parameters."
    display_usage
    exit 1
fi

shift $((OPTIND - 1))

filein=$1
filein_no_ext=${filein%.*}
fileout="${filein_no_ext}_simplified.geojson"

echo "Simplifying geojson datafile..."
echo "Input = ${filein}"
echo "Reduce to ${final_red_pc}%"
echo "Output = ${fileout}"

mapshaper -i ${filein} -simplify ${final_red_pc}% -o ${fileout}

echo "...Simplified"