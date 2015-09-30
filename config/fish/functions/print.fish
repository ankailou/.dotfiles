function print --description "print to Dreese Lab printers"

  set -g FILE $argv
  set -g PRINTLINE "ssh loua@stdlinux.cse.ohio-state.edu"

  if [ -z "$FILE" ]
    echo "No file provided. Enter file name"
    read FILE
  end

  echo "Room Printer:"
  read PRINTER
  set -g PRINTLINE $PRINTLINE' lp -d lj_dl_'$PRINTER'_a '

  echo "Two-sided printing? [y/n]"
  read TWOSIDES
  if [ "$TWOSIDES" = "y" ]
    set -g PRINTLINE $PRINTLINE'-o sides=two-sided-long-edge '
  end

  echo "Six sheets per page? [y/n]"
  read SIXSHEETS
  if [ "$SIXSHEETS" = "y" ]
    set -g PRINTLINE $PRINTLINE'-o number-up=6 '
  end

  set -g PRINTLINE "cat $FILE | $PRINTLINE"

  echo $PRINTLINE
  eval $PRINTLINE
end
