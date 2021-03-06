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

JUGANDO_EN_LINUX_INSTALADOR_VERSION="0.1.0-SNAPSHOT"
DIA=`date +"%d-%m-%Y"`
HORA=`date +"%H-%M"`

find . -type f -iname "*.sh" -exec chmod a+x {} +
# find . -type f -iname "*.sh" -exec chmod +x {} \;

tar -zcvf JugandoEnLinux_${JUGANDO_EN_LINUX_INSTALADOR_VERSION}-${DIA}_${HORA}.tar.gz --exclude=.DS_Store --exclude=.git* JugandoEnLinux/
sha512sum JugandoEnLinux_${JUGANDO_EN_LINUX_INSTALADOR_VERSION}-${DIA}_${HORA}.tar.gz | tee JugandoEnLinux_${JUGANDO_EN_LINUX_INSTALADOR_VERSION}-${DIA}_${HORA}.sha512sum
