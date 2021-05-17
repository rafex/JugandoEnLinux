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
# Date: 16 Mayo 2020
# Version: 0.1.0
# Escrito por: Raúl González <rafex@rafex.dev>

function wine_is_installed (){
  local command="wine"
  type ${command}
  if [[ "$?" -ne 0 ]] ; then
    echo "Install ${command}"
    exit 1
  fi
}

function winetricks_is_installed (){
  local command="winetricks"
  type ${command}
  if [[ "$?" -ne 0 ]] ; then
    echo "Install ${command}"
    exit 1
  fi
}
