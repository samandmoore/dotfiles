function allthecolors --description 'Print all 256 terminal colors'
    set --local reset (tput op)
    set --local width (math $COLUMNS - 6)
    set --local bar (string repeat --count $width '=')
    for i in (seq 0 256)
        set --local num (string pad --width 3 --char 0 $i)
        echo -e "$num $(tput setaf $i; tput setab $i)$bar$reset"
    end
end
