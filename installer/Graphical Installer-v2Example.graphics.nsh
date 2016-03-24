; ########################################
; #      Graphical Installer for NSIS    #
; #         Version 4.2.01 (Norka)       #
; #       Copyright (c) 2006 - 2016      #
; #          unSigned, s. r. o.          #
; #  http://www.graphical-installer.com  #
; #        http://www.unsigned.sk        #
; ########################################
; #           Graphics file              #
; ########################################
 
; *********************************************
; * This file contains setting for graphical  *
; * interface. Modify them freerly.           *
; ********************************************* 
 
; Script generated with Graphical Installer Wizard
 
!echo "Graphical Installer for NSIS, v4.2.01 (Norka), Copyright (c) 2006 - 2016 unSigned, s. r. o. Graphics file."
 
; This file was generated from Script file with this GRAPHICAL_INSTALLER_PROJECT_UID: {GraphicalInstaller-v2Example}
 
; Compression
SetCompressor bzip2

!define MUI_LICENSEPAGE_RADIOBUTTONS true
 
; Installer icon
;!define MUI_ICON "..\graphical-installer.ico"
; unInstaller icon
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"
 
; Installer graphic resources
; Splash image - comment out this line if you wish not to show a splash
!define GRAPHICAL_INSTALLER_SPLASH_BITMAP "D:\Development\MachSecure.Launcher\installer\splash.bmp"
!define GRAPHICAL_INSTALLER_SPLASH_BITMAP_TIME 5000 # miliseconds
 
!define GRAPHICAL_INSTALLER_BACKGROUND_BITMAP "D:\Development\MachSecure.Launcher\installer\bubbles.bmp" ; 690x496 px
!define GRAPHICAL_INSTALLER_SMALL_BITMAP "D:\Development\MachSecure.Launcher\installer\bubbles-inner.bmp" ; 450x228 px
 
; Color of labels
!define GRAPHICAL_INSTALLER_LABELS_TEXT_COLOR "0xFFFFFF" ; Format: 0xRRGGBB
; Color of texts  
!define GRAPHICAL_INSTALLER_HEADER_TEXT_COLOR "0xFFFFFF" ; Format: 0xRRGGBB 
 
; See included manual for Button details
!define GRAPHICAL_INSTALLER_BUTTON_BITMAP "${NSISDIR}\Graphical Installer\Buttons\button-9.bmp" ; 4 states, 83x104px

; Color of button text for Normal, Focused, pressed and Disabled state
!define GRAPHICAL_INSTALLER_BUTTONS_TEXT_COLOR "0x000000" ; Format: 0xRRGGBB
!define GRAPHICAL_INSTALLER_BUTTONS_TEXT_COLOR_FOCUSED "0x404040" ; Format: 0xRRGGBB
!define GRAPHICAL_INSTALLER_BUTTONS_TEXT_COLOR_PRESSED "0x808080" ; Format: 0xRRGGBB
!define GRAPHICAL_INSTALLER_BUTTONS_TEXT_COLOR_DISABLED "0xC3C3C3" ; Format: 0xRRGGBB
 
; End of file (EOF)
