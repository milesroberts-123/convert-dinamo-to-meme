#!/bin/bash
while getopts i:o:l: option; do
		case "${option}" in
			i) INFILE=${OPTARG};;
			o) OUTFILE=${OPTARG};;
			l) LENGTH=${OPTARG};;
		esac
	done

echo Converting dinamo-formatted motifs in $INFILE to MEME motif format saved in $OUTFILE...
sed "/^#.*$/d" $INFILE | sed "s/letter-probability matrix:/letter-probability matrix: alength= 4 w= "$LENGTH" nsites= 1 E= 0/g" | sed '/^[[:space:]]*$/d' | sed -e 's/^MOTIF/\nMOTIF/g' | sed -e 's/Background/\nBackground/g' | sed -e 's/strands/\nstrands/g' | sed -e 's/ALPHABET/\nALPHABET/g' > $OUTFILE
echo Done.
