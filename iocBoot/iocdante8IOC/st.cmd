#!../../bin/linux-x86_64/dante8IOC

#- SPDX-FileCopyrightText: 2003 Argonne National Laboratory
#-
#- SPDX-License-Identifier: EPICS

#- You may have to change dante8IOC to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"

epicsEnvSet ("STREAM_PROTOCOL_PATH", "${TOP}/db")

## Register all support components
dbLoadDatabase "dbd/dante8IOC.dbd"
dante8IOC_registerRecordDeviceDriver pdbbase

## Load record instances
#dbLoadRecords("db/dante8IOC.db","user=xlabsrv2")
dbLoadTemplate("db/dante8IOC.val","user=xlabsrv2")

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=xlabsrv2"
seq sncdet_fake,"user=dante8IOC,server=xlabsrv2,card=1,axis=1"
seq sncdet_fake,"user=dante8IOC,server=xlabsrv2,card=1,axis=2"
seq sncdet_fake,"user=dante8IOC,server=xlabsrv2,card=1,axis=3"
