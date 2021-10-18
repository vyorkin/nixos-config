{ bash, networkmanager, iconfont, config, modemmanager, ... }: ''
  #!${bash}/bin/bash
  CONNECTIONS=$(${networkmanager}/bin/nmcli con show --active | tail +2 | tr -s ' ' | rev | cut -d' ' -f3 | rev)
  text=""
  for connection in $CONNECTIONS
  do
    grep wifi <<< $connection > /dev/null && {
      # SIGNAL=$(${networkmanager}/bin/nmcli d w | grep '^\*' | tr -s ' ' | cut -d' ' -f7)
      # if [[ $SIGNAL -lt 20 ]]
      # then
      #   text+=冷
      # elif [[ $SIGNAL -lt 40 ]]
      # then
      #   text+=爛
      # elif [[ $SIGNAL -lt 60 ]]
      # then
      #   text+=嵐
      # elif [[ $SIGNAL -lt 80 ]]
      # then
      #   text+=襤
      # else
      #   text+=蠟
      # fi
      text=
    }
    grep ethernet <<< $connection > /dev/null && text+=""
  done
  code=0
  [[ $text == "" ]] && {
    text=
    code=33
  }
  echo "<span font='${iconfont}'>$text</span>"
  exit $code
''
