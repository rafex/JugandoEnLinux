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

. juegos/deportes/ProEvolutionSoccer2016/ProEvolutionSoccer2016.sh

function deportes_menu () {
  local name_of_menu="Juegos/Deportes"
  local option_1="ProEvolutionSoccer2016"

  trap '' 2  # ignore control + c
  while true
  do
    local answer
    local input
    clear # clear screen for each loop of menu
    green_text "================================"
    green_text "================================"
    echo "-------------        -------------"
    red_text "${name_of_menu}"
    echo "-----------            -----------"
    green_text "================================"
    green_text "================================"
    echo " "
    echo "Enter 1) ${option_1}"
    echo " "
    red_text "Presiona la letra 's' y <Enter> para salir."
    yellow_text "Seleciona una opción y presiona <Enter>"
    read answer
    case "$answer" in
     1) nginx_compile_menu ;;
     s) good_bye ;;
    esac
    red_text "Presiona la tecla <Enter> para continuar"
    read input
  done
}
