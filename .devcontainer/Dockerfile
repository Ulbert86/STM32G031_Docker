#####################################################################
# Docker file contains the following things
#
#    - JLink integration
#    - ARM GCC
#    - make
#    - cmake
#####################################################################

##############################################
# Starting OS packadge
##############################################
#get the latest LTS version of ubuntu
FROM ubuntu:20.04

##############################################
# LABELING
##############################################
ARG BUILD_DATE
ARG REVISON

LABEL maintainer="Janos Ulbert <ulbert86@gmail.com>" \
    org.opencontainers.image.title="STM32 Development environment" \
    org.opencontainers.image.description="This image is made for STM micro controller development" \
    org.opencontainers.image.authors="Janos Ulbert <ulbert86@gmail.com>" \
    #org.opencontainers.image.vendor="" \
    #org.opencontainers.image.documentation="" \
    #org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.version="1.0.0" \
    #org.opencontainers.image.url="" \
    #org.opencontainers.image.source="" \
    org.opencontainers.image.revision=$REVISON \
    org.opencontainers.image.created=$BUILD_DATE

##############################################
# PREPARTIONS
##############################################
# wget is needed to get the toolchain
RUN apt-get update && apt-get upgrade -y

# add cpio is needed ... I don't exatly remember why is it needed:)
RUN apt-get install -y cpio libncurses5

########################
# INSTALL DOWNLOAD TOOLS
########################
RUN apt-get install -y wget 
RUN apt-get install -y dpkg

##############################################
# USEFULL APPS
##############################################
RUN apt-get install -y make=4.2.1-1.2
RUN apt-get install -y cmake=3.16.3-1ubuntu1

##############################################
# ARM TOOLCHAIN
##############################################
# Download ARM  toolchain

# download ARM GCC
RUN wget -O /opt/gcc-arm-none-eabi.tar.bz2 \ 
    https://developer.arm.com/-/media/Files/downloads/gnu-rm/10-2020q4/gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2

# extract tar file
RUN tar jxf /opt/gcc-arm-none-eabi.tar.bz2 -C /opt/

# remove archive file
RUN rm /opt/gcc-arm-none-eabi.tar.bz2

# Add environment variable for the GCC path
ENV GCC_PATH="/opt/gcc-arm-none-eabi-10-2020-q4-major/bin"

##############################################
# SEGGER JLINK DEBUGGER TOOL
##############################################
# dowload J-Link from webside
# --post-data="accept..." you need to accept the licence agreement at the SEGGER website to start the download
# PS: The latest version of J-Link at Segger website don not have version number ... funny guys
RUN wget --post-data="accept_license_agreement=accepted" -O \ 
    /opt/JLink_Linux_V700a_x86_64.deb \ 
    https://www.segger.com/downloads/jlink/JLink_Linux_V700a_x86_64.deb

# install JLink tools
RUN dpkg -i /opt/JLink_Linux_V700a_x86_64.deb

# remove the install file
RUN rm /opt/JLink_Linux_V700a_x86_64.deb

# Add environment variable for the JLink path
ENV JLINK_PATH="/opt/SEGGER/JLink"

##############################################
# EXPOSE SOCKETS
##############################################
#Exopose port for remote debugging in VS code
EXPOSE 4000

#Expose port for SEGGER J-Link remote debugging
EXPOSE 19020

##############################################
# ATTACH VOLUMES
##############################################
#VOLUME /workspace
#WORKDIR /workspace