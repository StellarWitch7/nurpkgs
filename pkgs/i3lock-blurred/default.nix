{ writeShellScriptBin
, scrot
, imagemagick
, i3lock }:

writeShellScriptBin "i3lock-blurred" ''
    img=/tmp/i3lock-blurred.png

    # suspend message display
    pkill -u "$USER" -USR1 dunst
    sleep 1

    # take screenshot
    ${scrot.out}/bin/scrot -o $img

    # blur screenshot
    ${imagemagick.out}/bin/convert $img -scale 10% -scale 1000% $img

    # lock the screen
    ${i3lock.out}/bin/i3lock -nb -i $img

    # resume message display
    pkill -u "$USER" -USR2 dunst
''
