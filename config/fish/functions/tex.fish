function tex --description "enter tex environment"
  if test (count $argv) -eq 0
    # cd into default directory
    cd ~/Documents/doc/tex/
  else if [ "$argv[1]" = "clean" ]
    # find and remove unnecessary aux files
    find ~/Documents/doc/tex -type f -name '*.aux' -ls -delete;
    find ~/Documents/doc/tex -type f -name '*.fls' -ls -delete;
    find ~/Documents/doc/tex -type f -name '*.log' -ls -delete;
    find ~/Documents/doc/tex -type f -name '*.synctex.gz' -ls -delete;
    find ~/Documents/doc/tex -type f -name '*.fdb_latexmk' -ls -delete;
  else if [ "$argv[1]" = "init" ]
    # initialize empty .tex file from template
    switch (command pwd)
      case '*/Documents/doc/tex*'
        set -g name "default"
        set -g temp "pset"
        if test (count $argv) -eq 2
          echo "No template given. Defaulting to template-pset.tex..."
          set -g name $argv[2]
        else if test (count $argv) -gt 2
          set -g name "$argv[2]"
          set -g temp "$argv[3]"
          echo "Generating $name.tex file from template-$temp.tex..."
        else
          echo "No name given. Defaulting to default.tex..."
          echo "No template given. Defaulting to template-pset.tex..."
        end
        cp ~/Documents/doc/tex/template/template-$temp.tex $name.tex
        echo 'Open with (0) nothing, (1) vim, (2) texshop'
        read QUERY
        if [ "$QUERY" = "1" ]
          vim $name.tex
        else if [ "$QUERY" = "2" ]
          open -a texshop $name.tex
        else
          echo 'File not opened.'
        end
      case '*'
        echo ''Error: keep .tex files in the correct directory! Defaulting to base directory...
        tex
        tex init $argv
    end
  else
    # cd into a specific tex directory
    cd ~/Documents/doc/tex/$argv
  end
end
