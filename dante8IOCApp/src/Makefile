# SPDX-FileCopyrightText: 2003 Argonne National Laboratory
#
# SPDX-License-Identifier: EPICS

TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = dante8IOC
# dante8IOC.dbd will be created and installed
DBD += dante8IOC.dbd

# dante8IOC.dbd will be made up from these files:
dante8IOC_DBD += base.dbd

# Include dbd files from all support applications:
#dante8IOC_DBD += xxx.dbd
dante8IOC_DBD += stream-base.dbd
dante8IOC_DBD += drvAsynIPPort.dbd
dante8IOC_DBD += asyn.dbd
dante8IOC_DBD += calc.dbd

# Add all the support libraries needed by this IOC
#dante8IOC_LIBS += xxx
dante8IOC_LIBS += stream
dante8IOC_LIBS += asyn
dante8IOC_LIBS += calc

# dante8IOC_registerRecordDeviceDriver.cpp derives from dante8IOC.dbd
dante8IOC_SRCS += dante8IOC_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
dante8IOC_SRCS_DEFAULT += dante8IOCMain.cpp
dante8IOC_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#dante8IOC_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Link QSRV (pvAccess Server) if available
ifdef EPICS_QSRV_MAJOR_VERSION
	dante8IOC_LIBS += qsrv
	dante8IOC_LIBS += $(EPICS_BASE_PVA_CORE_LIBS)
	dante8IOC_DBD += PVAServerRegister.dbd
	dante8IOC_DBD += qsrv.dbd
endif

# Finally link to the EPICS Base libraries
dante8IOC_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

