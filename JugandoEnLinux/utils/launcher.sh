# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#!/bin/bash
# Fecha: 16 Mayo 2020
# Version: 0.1.0
# Escrito por: Raúl González <rafex@rafex.dev>

function create_launcher () {
  clear
  local answer
  local path
  local file_exe
  green_text "Inserta la ruta (ubicación) de la carpeta dónde programa"
  yellow_text "Ejemplo: /home/linux/Descargas/Pro Evolution Soccer 2016/"
  echo ""
  read path
  echo ""
  blue_text "La ruta de la carpeta es: "
  echo $path
  echo ""

  green_text "Inserta el EXE del programa"
  yellow_text "Ejemplo: PES2016.exe"
  echo ""
  read file_exe
  echo ""
  blue_text "El ejecutable es: "
  echo $file_exe
  echo ""
  # echo "Es correcta [S]i o [N]o:"
  # read answer
  # while true
  # do
  #   case "$answer" in
  #    si) continue ;;
  #    no) reinstall_pro_evolution_soccer_2016 && green_text "\nFinalizo ${option_2}\n" ;;
  #
  #   esac
  # done
  local GAME=$1
  local PATH_JUGANDO_EN_LINUX=${HOME}/.local/share/applications/${JUGANDO_EN_LINUX}
  mkdir -p  $PATH_JUGANDO_EN_LINUX
  cp -v assets/JugandoEnLinux_logo.png ${PATH_JUGANDO_EN_LINUX}
  cat > ${HOME}/.local/bin/${GAME}-${JUGANDO_EN_LINUX} << EOF
#!/bin/bash

PATH_ORIG=\$(pwd)
cd '${path}'
env WINEPREFIX="${WINEPREFIX}" /usr/bin/wine '${path}/${file_exe}'
cd \$PATH_ORIG
EOF
  chmod +x ${HOME}/.local/bin/${GAME}-${JUGANDO_EN_LINUX}
  rm -v ${PATH_JUGANDO_EN_LINUX}/${GAME}-${JUGANDO_EN_LINUX}.desktop
  cat > ${PATH_JUGANDO_EN_LINUX}/${GAME}-${JUGANDO_EN_LINUX}.desktop << EOF
[Desktop Entry]
Name=${GAME} ${JUGANDO_EN_LINUX}
Exec=${HOME}/.local/bin/${GAME}-${JUGANDO_EN_LINUX}
Type=Application
StartupNotify=true
Path=${path}
Icon=${PATH_JUGANDO_EN_LINUX}/JugandoEnLinux_logo.png
StartupWMClass=${file_exe}.exe
EOF
  cat ${PATH_JUGANDO_EN_LINUX}/${GAME}-${JUGANDO_EN_LINUX}.desktop
}
