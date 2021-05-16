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
################################################################################
#!/bin/bash
# Fecha: 29 June 2019
# Versión: 0.1.0
# Escrito por: Raúl González <rafex@rafex.dev>

. utils/is-root.sh
. utils/color.sh
. utils/distro.sh
. utils/network.sh
. utils/random.sh
. utils/arch.sh
. utils/profile.sh
. utils/path.sh
. utils/wine.sh
. utils/exit.sh
. juegos/juegos.sh



if is_root; then
    red_text "Error: necesitas ejecutar este script como usuario normal, ¡no debes ser root!"
    exit 1
fi

JUGANDO_EN_LINUX_INSTALADOR_VERSION="0.1.0-SNAPSHOT"
JUGANDO_EN_LINUX_INSTALADOR_RUTA=$(pwd)

function vamos_a_jugar_menu () {
  local opcion_1="Juegos"
  trap '' 2  # ignora control + c
  while true
  do
    local respuesta
    local entrada
    clear # clear screen for each loop of menu
    red_text "Version: ${JUGANDO_EN_LINUX_INSTALADOR_VERSION}"
    green_text        "================================"
    green_text        "================================"
    echo              "-------------      -------------"
    blue_text         "------------- Menú -------------"
    echo              "-------                  -------"
    echo              "---    Sistema operativo     ---"
    what_os_are_you
    what_distribution_are_you_v2
    echo              "-----------          -----------"
    green_text        "================================"
    green_text        "================================"
    echo " "
    echo "Enter 1) ${opcion_1}"
    echo " "
    red_text "Presiona la letra 's' y <Enter> para salir."
    yellow_text "Seleciona una opción y presiona <Enter>"
    read respuesta
    case "$respuesta" in
     1) juegos_menu ;;
     s) good_bye ;;
    esac
    red_text "Presiona la tecla <Enter> para continuar"
    read entrada
  done
}

vamos_a_jugar_menu
