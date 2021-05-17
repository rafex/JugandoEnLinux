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

function reinstall_default_pro_evolution_soccer_2016 () {
  local NAME_OF_THE_MODULE="Pro Evolution Soccer 2016"
  valid_pre_install $NAME_OF_THE_MODULE

  local GAME="ProEvolutionSoccer2016"
  local DEPENDENCIES=juegos/deportes/${GAME}/winetricks.dependencies
  re-create_prefix_jugando_en_linux $GAME $DEPENDENCIES
  create_launcher ${GAME}
}

function install_default_pro_evolution_soccer_2016 () {
  local NAME_OF_THE_MODULE="Pro Evolution Soccer 2016"
  valid_pre_install $NAME_OF_THE_MODULE

  local GAME="ProEvolutionSoccer2016"
  local DEPENDENCIES=juegos/deportes/${GAME}/winetricks.dependencies
  create_prefix_jugando_en_linux $GAME $DEPENDENCIES
  create_launcher ${GAME}
}

function reinstall_pro_evolution_soccer_2016 () {
  local NAME_OF_THE_MODULE="Pro Evolution Soccer 2016"
  valid_pre_install $NAME_OF_THE_MODULE

  local GAME="ProEvolutionSoccer2016"
  local DEPENDENCIES=juegos/deportes/${GAME}/winetricks.dependencies
  re-create_prefix_for_game $GAME $DEPENDENCIES
  create_launcher ${GAME}
}

function install_pro_evolution_soccer_2016 () {
  local NAME_OF_THE_MODULE="Pro Evolution Soccer 2016"
  valid_pre_install $NAME_OF_THE_MODULE

  local GAME="ProEvolutionSoccer2016"
  local DEPENDENCIES=juegos/deportes/${GAME}/winetricks.dependencies
  create_prefix_for_game $GAME $DEPENDENCIES
  create_launcher ${GAME}
}

function nginx_compile_menu () {
  local NAME_OF_THE_MODULE="Pro Evolution Soccer 2016"
  local MODULE_VERSION="1.0"
  local INITIAL_TEXT="Vamos a instalar ${NAME_OF_THE_MODULE}"
  local option_1="Instalar en prefix JugandoEnLinux (recomendado)"
  local option_2="Re-Instalar en prefix JugandoEnLinux (descargara todo de nuevo)"
  local option_3="Instalar en un prefix independiente para ${NAME_OF_THE_MODULE}"
  local option_4="Re-Instalar en un prefix independiente para ${NAME_OF_THE_MODULE}"
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
    echo "Enter 3) ${option_3}"
    echo "Enter 4) ${option_4}"
    echo " "
    red_text "Presiona la letra 's' y <Enter> para salir."
    yellow_text "Seleciona una opción y presiona <Enter>"
    read answer
    case "$answer" in
      1) install_default_pro_evolution_soccer_2016 && green_text "\nFinalizo ${option_1}\n" ;;
      2) reinstall_default_pro_evolution_soccer_2016 && green_text "\nFinalizo ${option_2}\n" ;;
      3) install_pro_evolution_soccer_2016 && green_text "\nFinalizo ${option_3}\n" ;;
      4) reinstall_pro_evolution_soccer_2016 && green_text "\nFinalizo ${option_4}\n" ;;
      s) good_bye ;;
    esac
    red_text "Presiona la tecla <Enter> para continuar"
    read input
  done
}
