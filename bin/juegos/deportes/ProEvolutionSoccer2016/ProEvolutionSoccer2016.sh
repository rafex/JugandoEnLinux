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

# . ../../utils/color.sh
# . ../../utils/is-root.sh

function winetricks_pro_evolution_soccer_2016 () {
  local GAME="ProEvolutionSoccer2016"
  mkdir -p ${HOME}/.local/share/wineprefixes/${GAME}.${JUGANDO_EN_LINUX}/
  export WINEPREFIX=${HOME}/.local/share/wineprefixes/${GAME}.${JUGANDO_EN_LINUX}/
  env WINEPREFIX=${HOME}/.local/share/wineprefixes/${GAME}.${JUGANDO_EN_LINUX}/ wineboot
  while read line; do
    winetricks prefix=${GAME}.${JUGANDO_EN_LINUX} --optout -q $line
  done < juegos/deportes/${GAME}/winetricks.dependencies
  blue_text "WINEPREFIX ${HOME}/.local/share/wineprefixes/${GAME}.${JUGANDO_EN_LINUX}/"
}

function winetricks_force_pro_evolution_soccer_2016 () {
  local GAME="ProEvolutionSoccer2016"
  mkdir -p ${HOME}/.local/share/wineprefixes/${GAME}.${JUGANDO_EN_LINUX}/
  export WINEPREFIX=${HOME}/.local/share/wineprefixes/${GAME}.${JUGANDO_EN_LINUX}/
  env WINEPREFIX=${HOME}/.local/share/wineprefixes/${GAME}.${JUGANDO_EN_LINUX}/ wineboot
  while read line; do
    winetricks prefix=${GAME}.${JUGANDO_EN_LINUX} --optout --force -q $line
  done < juegos/deportes/${GAME}/winetricks.dependencies
  blue_text "WINEPREFIX ${HOME}/.local/share/wineprefixes/${GAME}.${JUGANDO_EN_LINUX}/"
}

function pre_pro_evolution_soccer_2016 () {
  local NAME_OF_THE_MODULE="Pro Evolution Soccer 2016"
  green_text "Inicio de Pre instalación de ${NAME_OF_THE_MODULE}"
  wine_is_installed
  winetricks_is_installed
  green_text "Finalizo la Pre instalación de ${NAME_OF_THE_MODULE}"
  echo ""
}

function path_pro_evolution_soccer_2016 () {
  clear
  local answer
  local input
  green_text "Inserta la ruta (ubicación) donde esta el archivo PES2016.exe"
  yellow_text "Ejemplo: /home/linux/Descargas/Pro Evolution Soccer 2016/PES2016.exe"
  echo ""
  read input
  echo ""
  blue_text "La ruta del archivo es: "
  echo $input
  echo ""
  local GAME="ProEvolutionSoccer2016"
  local PATH_JUGANDO_EN_LINUX=${HOME}/.local/share/applications/wine/Programs/${JUGANDO_EN_LINUX}
  local PATH_JUGANDO_EN_LINUX_GAME=${PATH_JUGANDO_EN_LINUX}/${GAME}
  mkdir -p  $PATH_JUGANDO_EN_LINUX
  mkdir -p  $PATH_JUGANDO_EN_LINUX_GAME
  cp -v assets/JugandoEnLinux_logo.png ${PATH_JUGANDO_EN_LINUX}
  rm -v ${PATH_JUGANDO_EN_LINUX_GAME}/${GAME}-${JUGANDO_EN_LINUX}.desktop
  cat > ${PATH_JUGANDO_EN_LINUX_GAME}/${GAME}-${JUGANDO_EN_LINUX}.desktop << EOF
[Desktop Entry]
Name=${GAME}-${JUGANDO_EN_LINUX}
Exec=env WINEPREFIX="${WINEPREFIX}" wine '${input}'
Type=Application
StartupNotify=true
#Path=${input}
Icon=${PATH_JUGANDO_EN_LINUX}/JugandoEnLinux_logo.png
StartupWMClass=${GAME}.exe
EOF
 cat ${PATH_JUGANDO_EN_LINUX_GAME}/${GAME}-${JUGANDO_EN_LINUX}.desktop
}

function reinstall_pro_evolution_soccer_2016 () {
  pre_pro_evolution_soccer_2016
  winetricks_force_pro_evolution_soccer_2016
  path_pro_evolution_soccer_2016
}

function install_pro_evolution_soccer_2016 () {
  pre_pro_evolution_soccer_2016
  winetricks_pro_evolution_soccer_2016
  path_pro_evolution_soccer_2016
}

function nginx_compile_menu () {
  local NAME_OF_THE_MODULE="Pro Evolution Soccer 2016"
  local MODULE_VERSION="1.0"
  local INITIAL_TEXT="Vamos a instalar ${NAME_OF_THE_MODULE}"
  local option_1="Instalar en nuevo prefix"
  local option_2="Re-Instalar en nuevo prefix"
  trap '' 2  # ignore control + c
  while true
  do
    local answer
    local input
    clear # clear screen for each loop of menu
    green_text "================================"
    green_text "================================"
    echo "-----------          -----------"
    red_text "${NAME_OF_THE_MODULE} - ${MODULE_VERSION}"
    echo "-----------          -----------"
    green_text "================================"
    green_text "================================"
    echo " "
    blue_text "${INITIAL_TEXT}"
    echo " "
    echo "Enter 1) ${option_1}"
    echo "Enter 2) ${option_2}"
    echo " "
    red_text "Presiona la letra 's' y <Enter> para salir."
    yellow_text "Seleciona una opción y presiona <Enter>"
    read answer
    case "$answer" in
     1) install_pro_evolution_soccer_2016 && green_text "\nFinalizo ${option_1}\n" ;;
     2) reinstall_pro_evolution_soccer_2016 && green_text "\nFinalizo ${option_1}\n" ;;
     s) good_bye ;;
    esac
    red_text "Presiona la tecla <Enter> para continuar"
    read input
  done
}
