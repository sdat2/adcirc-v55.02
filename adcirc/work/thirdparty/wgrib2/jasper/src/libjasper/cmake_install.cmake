# Install script for directory: /work/n02/n02/sdat2/adcirc-swan/adcirc/thirdparty/wgrib2/jasper/src/libjasper

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "0")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib64" TYPE STATIC_LIBRARY FILES "/work/n02/n02/sdat2/adcirc-swan/adcirc/work/CMakeFiles/libjasper.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/jasper" TYPE FILE FILES
    "/work/n02/n02/sdat2/adcirc-swan/adcirc/thirdparty/wgrib2/jasper/src/libjasper/include/jasper/jas_cm.h"
    "/work/n02/n02/sdat2/adcirc-swan/adcirc/work/thirdparty/wgrib2/jasper/src/libjasper/include/jasper/jas_config.h"
    "/work/n02/n02/sdat2/adcirc-swan/adcirc/thirdparty/wgrib2/jasper/src/libjasper/include/jasper/jas_debug.h"
    "/work/n02/n02/sdat2/adcirc-swan/adcirc/thirdparty/wgrib2/jasper/src/libjasper/include/jasper/jas_dll.h"
    "/work/n02/n02/sdat2/adcirc-swan/adcirc/thirdparty/wgrib2/jasper/src/libjasper/include/jasper/jas_fix.h"
    "/work/n02/n02/sdat2/adcirc-swan/adcirc/thirdparty/wgrib2/jasper/src/libjasper/include/jasper/jas_getopt.h"
    "/work/n02/n02/sdat2/adcirc-swan/adcirc/thirdparty/wgrib2/jasper/src/libjasper/include/jasper/jas_icc.h"
    "/work/n02/n02/sdat2/adcirc-swan/adcirc/thirdparty/wgrib2/jasper/src/libjasper/include/jasper/jas_image.h"
    "/work/n02/n02/sdat2/adcirc-swan/adcirc/thirdparty/wgrib2/jasper/src/libjasper/include/jasper/jas_init.h"
    "/work/n02/n02/sdat2/adcirc-swan/adcirc/thirdparty/wgrib2/jasper/src/libjasper/include/jasper/jas_malloc.h"
    "/work/n02/n02/sdat2/adcirc-swan/adcirc/thirdparty/wgrib2/jasper/src/libjasper/include/jasper/jas_math.h"
    "/work/n02/n02/sdat2/adcirc-swan/adcirc/thirdparty/wgrib2/jasper/src/libjasper/include/jasper/jasper.h"
    "/work/n02/n02/sdat2/adcirc-swan/adcirc/thirdparty/wgrib2/jasper/src/libjasper/include/jasper/jas_seq.h"
    "/work/n02/n02/sdat2/adcirc-swan/adcirc/thirdparty/wgrib2/jasper/src/libjasper/include/jasper/jas_stream.h"
    "/work/n02/n02/sdat2/adcirc-swan/adcirc/thirdparty/wgrib2/jasper/src/libjasper/include/jasper/jas_string.h"
    "/work/n02/n02/sdat2/adcirc-swan/adcirc/thirdparty/wgrib2/jasper/src/libjasper/include/jasper/jas_tmr.h"
    "/work/n02/n02/sdat2/adcirc-swan/adcirc/thirdparty/wgrib2/jasper/src/libjasper/include/jasper/jas_tvp.h"
    "/work/n02/n02/sdat2/adcirc-swan/adcirc/thirdparty/wgrib2/jasper/src/libjasper/include/jasper/jas_types.h"
    "/work/n02/n02/sdat2/adcirc-swan/adcirc/thirdparty/wgrib2/jasper/src/libjasper/include/jasper/jas_version.h"
    )
endif()

