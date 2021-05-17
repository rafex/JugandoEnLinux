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

function create_prefix_jugando_en_linux () {
  local PREFIX="JugandoEnLinux"
  mkdir -p ${HOME}/.local/share/wineprefixes/${PREFIX}
  export WINEPREFIX=${HOME}/.local/share/wineprefixes/${PREFIX}/
  env WINEPREFIX=${HOME}/.local/share/wineprefixes/${PREFIX} wineboot
  while read line; do
    winetricks prefix=${PREFIX} --optout -q $line
  done < winetricks.JugandoEnLinux
  blue_text "WINEPREFIX ${HOME}/.local/share/wineprefixes/${PREFIX}/"
}

function re-create_prefix_jugando_en_linux () {
  local PREFIX="JugandoEnLinux"
  mkdir -p ${HOME}/.local/share/wineprefixes/${PREFIX}
  export WINEPREFIX=${HOME}/.local/share/wineprefixes/${PREFIX}/
  env WINEPREFIX=${HOME}/.local/share/wineprefixes/${PREFIX} wineboot
  while read line; do
    winetricks prefix=${PREFIX} --optout --force -q $line
  done < winetricks.JugandoEnLinux
  blue_text "WINEPREFIX ${HOME}/.local/share/wineprefixes/${PREFIX}/"
}

function create_prefix_for_game () {
  local GAME=$1
  mkdir -p ${HOME}/.local/share/wineprefixes/${GAME}.${JUGANDO_EN_LINUX}/
  export WINEPREFIX=${HOME}/.local/share/wineprefixes/${GAME}.${JUGANDO_EN_LINUX}/
  env WINEPREFIX=${HOME}/.local/share/wineprefixes/${GAME}.${JUGANDO_EN_LINUX}/ wineboot
  while read line; do
    winetricks prefix=${GAME}.${JUGANDO_EN_LINUX} --optout -q $line
  done < $2
  blue_text "WINEPREFIX ${HOME}/.local/share/wineprefixes/${GAME}.${JUGANDO_EN_LINUX}/"
}

function re-create_prefix_for_game () {
  local GAME=$1
  mkdir -p ${HOME}/.local/share/wineprefixes/${GAME}.${JUGANDO_EN_LINUX}/
  export WINEPREFIX=${HOME}/.local/share/wineprefixes/${GAME}.${JUGANDO_EN_LINUX}/
  env WINEPREFIX=${HOME}/.local/share/wineprefixes/${GAME}.${JUGANDO_EN_LINUX}/ wineboot
  while read line; do
    winetricks prefix=${GAME}.${JUGANDO_EN_LINUX} --optout --force -q $line
  done < $2
  blue_text "WINEPREFIX ${HOME}/.local/share/wineprefixes/${GAME}.${JUGANDO_EN_LINUX}/"
}
