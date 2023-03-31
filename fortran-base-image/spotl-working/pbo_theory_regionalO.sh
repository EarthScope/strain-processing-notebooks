#!/bin/bash
#
#  pbo_tide_regionalO.sh                 
#
#  This script generates the  predicted Eee+Enn, Eee-Enn, Een tides                        
# 
#  This script assumes that the user is supplying a regional tidal model
#  in addition to a global ocean model.

#  Usage: pbo_tide_regionalO.sh    $1 $2 $3 $4 $5 $6 $7
#
#  argument 1 station name
#  argument 2 lat
#  argument 3 long
#  argument 4 ht
#  argument 5 ocean model  e.g., csrt3  , tpxo62
#  argument 6 regional ocean model e.g. sfbay, gefu
#  argument 7 Green function eg contap
#
#  The strain line in the nloadf tide files is of the format:
#	"s	Eee_amp  Eee-phase  Enn_amp  Enn_phase  Een_amp  Een_phase
#  amplitude is in nanostrain, pahse in degrees
#
   bin="/opt/spotl/bin"
   work="/opt/spotl/working"
   here=`pwd`;
   cd $work

#  Calculate the M2 ocean load for the ocean model but exclude the area in poly.$6

   $bin/nloadf $1 $2 $3 $4   $work/m2.$5      $work/green.$7.std  l   $work/poly.$6     - > $here/ex1m2.f1 


#  Calculate the M2 ocean lead for the regional model ($6) but only for the region in poly.$6

   $bin/nloadf $1 $2 $3 $4   $work/m2.$6      $work/green.$7.std  l   $work/poly.$6     + > $here/ex1m2.f2 

#  Add the M2 loads computed above together

   cat $here/ex1m2.f1 $here/ex1m2.f2 | $bin/loadcomb c >  $here/tide.m2

#  Calculate the O1 ocean load for the ocean model but exclude the area in poly.$6

   $bin/nloadf $1 $2 $3 $4   $work/o1.$5      $work/green.$7.std  l   $work/poly.$6     - > $here/ex1o1.f1 

#  Calculate the O1 ocean lead for the regional model ($6) but only for the region in poly.$6

   $bin/nloadf $1 $2 $3 $4   $work/o1.$6      $work/green.$7.std  l   $work/poly.$6     + > $here/ex1o1.f2 

#  Add the O1 loads computed above together

   cat $here/ex1o1.f1 $here/ex1o1.f2 | $bin/loadcomb c >  $here/tide.o1

#  Combine ocean load and solid earth tides

   cat  $here/tide.m2 | $bin/loadcomb t  >  $here/m2.tide.total 
   cat  $here/tide.o1 | $bin/loadcomb t  >  $here/o1.tide.total 

   cat  $here/tide.m2 | $bin/loadcomb t  >  $here/$1.tide.total
   cat  $here/tide.o1 | $bin/loadcomb t  >>  $here/$1.tide.total


#  Create real and imaginary numbers

   grep "^s" $here/m2.tide.total | awk '{ pi=22/7 ; print $2*cos($3*pi/180) , $2*sin($3*pi/180), $4*cos($5*pi/180) , $4*sin($5*pi/180), $6*cos($7*pi/180) , $6*sin($7*pi/180) }' > $here/m2.ri.txt  
   grep "^s" $here/o1.tide.total | awk '{ pi=22/7 ; print $2*cos($3*pi/180) , $2*sin($3*pi/180), $4*cos($5*pi/180) , $4*sin($5*pi/180), $6*cos($7*pi/180) , $6*sin($7*pi/180) }' > $here/o1.ri.txt  

#  Combine to make Eee+Enn, Eee-Enn, 2*Een 

   awk '{ print $1+$3, $2+$4, $1-$3, $2-$4 ,  2*$5, 2*$6 }' $here/m2.ri.txt > $here/m2.t.txt
   awk '{ print $1+$3, $2+$4, $1-$3, $2-$4 ,  2*$5, 2*$6 }' $here/o1.ri.txt > $here/o1.t.txt

#  Convert back to amplitude (nanostrain ) and phase (degrees)

   echo "pbo_tide_regionalO.sh	$1	$2	$3	$4	m2.$5	green.$7.std	poly.$6 \n " > $here/$1.theory.txt

   awk '{ pi=22/7 ; print "Eee+Enn M2	Amp\t"sqrt($1*$1+$2*$2) "\tphase\t" atan2($2,$1)*180/pi, "\nEee-Enn M2	Amp\t"sqrt($3*$3+$4*$4) "\tphase\t" atan2($4,$3)*180/pi "\n2Een M2		Amp\t"sqrt($5*$5+$6*$6) "\tphase\t"  atan2($6,$5)*180/pi "\n"}' $here/m2.t.txt >> $here/$1.theory.txt
   awk '{ pi=22/7 ; print "Eee+Enn O1	Amp\t"sqrt($1*$1+$2*$2) "\tphase\t" atan2($2,$1)*180/pi, "\nEee-Enn O1	Amp\t"sqrt($3*$3+$4*$4) "\tphase\t" atan2($4,$3)*180/pi "\n2Een O1		Amp\t"sqrt($5*$5+$6*$6) "\tphase\t"  atan2($6,$5)*180/pi "\n"}' $here/o1.t.txt >> $here/$1.theory.txt
   
#  write out complex numbers for processing
	awk '{ print $1+$3,  $1-$3,  2*$5 }' $here/o1.ri.txt >  $here/$1.theory.complex
	awk '{ print $2+$4,  $2-$4 , 2*$6 }' $here/o1.ri.txt >> $here/$1.theory.complex
        awk '{ print $1+$3,  $1-$3,  2*$5 }' $here/m2.ri.txt >> $here/$1.theory.complex
        awk '{ print $2+$4,  $2-$4 , 2*$6 }' $here/m2.ri.txt >> $here/$1.theory.complex

# For batch output

   echo $1 > $here/$1.summary.txt
   awk  ' /s    / { printf $0" " }' $here/$1.tide.total  >> $here/$1.summary.txt
   echo " $5 $6 "  >> $here/$1.summary.txt


#  Clean up

#   rm $here/ex1m2.f1 $here/ex1m2.f2 $here/ex1o1.f1 $here/ex1o1.f2 $here/tide.o1   $here/tide.m2
#   rm $here/m2.ri.txt $here/o1.ri.txt $here/m2.t.txt $here/o1.t.txt $here/o1.tide.total $here/m2.tide.total 
#	rm $here/$1.tide.total 


