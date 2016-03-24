; ########################################
; #      Graphical Installer for NSIS    #
; #         Version 4.2.01 (Norka)       #
; #       Copyright (c) 2006 - 2016      #
; #          unSigned, s. r. o.          #
; #  http://www.graphical-installer.com  #
; #        http://www.unsigned.sk        #
; ########################################

; Script generated with Graphical Installer Wizard

; Unique identifier of project (Comment out this symbol to switch the design of installer)
!define GRAPHICAL_INSTALLER_PROJECT_UID "{GraphicalInstaller-Example}"

; Include files for Modern UI 2
!include "MUI2.nsh"

; Include file with Graphical settings
!include "Graphical Installer-v2Example.graphics.nsh"

; Include files for Graphical Installer functions
!include "${NSISDIR}\Graphical Installer\GraphicalInstaller_functions.nsh"

; Wizard common defines
!define PRODUCT_NAME "Graphical Installer Basic Example"
!define PRODUCT_VERSION "1.0"
!define PRODUCT_PUBLISHER "unSigned"
!define PRODUCT_WEB_SITE "http://www.unsigned.sk"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

Name "${PRODUCT_NAME}"
OutFile "BasicExample.exe"
InstallDir "$PROGRAMFILES\Graphical Installer Basic Example"
Caption "${PRODUCT_NAME}"
ShowInstDetails show
ShowUnInstDetails show
; Branding text
BrandingText " " ; No branding text

; ===================
;  Installer pages    
; ===================

; Comment out this line if You do not want to show confirm dialog when Cancel button is pressed
!define MUI_ABORTWARNING
!define MUI_WELCOMEPAGE_TITLE_3LINES
; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
!define MUI_PAGE_CUSTOMFUNCTION_SHOW GraphicalInstallerRedraw
!insertmacro MUI_PAGE_LICENSE "..\..\readme.txt"
; UI for Installer and Uninstaller
${GraphicalInstallerChangeUI}
XPStyle on
; Components page
!define MUI_PAGE_CUSTOMFUNCTION_SHOW GraphicalInstallerRedraw
!insertmacro MUI_PAGE_COMPONENTS
; Directory page
!define MUI_PAGE_CUSTOMFUNCTION_SHOW GraphicalInstallerRedraw
!insertmacro MUI_PAGE_DIRECTORY
; Instfiles page
!define MUI_PAGE_CUSTOMFUNCTION_SHOW GraphicalInstallerRedraw
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_SHOWREADME "$INSTDIR\GraphicalInstallerManual.chm"
!define FINISHPAGE_NOAUTOCLOSE
!insertmacro MUI_PAGE_FINISH

; ===================
;  unInstaller pages 
; ===================
!define MUI_WELCOMEPAGE_TITLE_3LINES
!insertmacro MUI_UNPAGE_WELCOME
!define MUI_PAGE_CUSTOMFUNCTION_SHOW un.GraphicalInstallerRedraw
!insertmacro MUI_UNPAGE_CONFIRM
!define MUI_PAGE_CUSTOMFUNCTION_SHOW un.GraphicalInstallerRedraw
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

; ======================
;  Language settings       
; ======================
!insertmacro MUI_LANGUAGE "English"
; Reserve files
!insertmacro MUI_RESERVEFILE_LANGDLL

;  Installers properties
VIProductVersion "4.2.0.1"
VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductName" "${PRODUCT_NAME}" 
VIAddVersionKey /LANG=${LANG_ENGLISH} "Comments" "Graphical Installer for NSIS. Copyright (c) 2006 - 2016 unSigned, s. r. o. http://graphical-installer.com/"
VIAddVersionKey /LANG=${LANG_ENGLISH} "CompanyName" "${PRODUCT_PUBLISHER}"  
VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalCopyright" "Copyright (c) 2016 ${PRODUCT_PUBLISHER}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileDescription" "${PRODUCT_NAME}" 
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileVersion" "${PRODUCT_VERSION}" 
VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductVersion" "${PRODUCT_VERSION}" 
VIAddVersionKey /LANG=${LANG_ENGLISH} "InternalName" "Setup.exe"
VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalTrademarks" "Copyright (c) 2016 ${PRODUCT_PUBLISHER}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "OriginalFilename" "Setup.exe"

; Language strings - captions of sections
LangString DESC_Section00 ${LANG_ENGLISH} " " ; No description
LangString DESC_Section01 ${LANG_ENGLISH} "Basic Example"

; =================
;  Install Data
; =================

Function .onInit
  ; Splash Bitmap
  InitPluginsDir
  !ifdef GRAPHICAL_INSTALLER_SPLASH_BITMAP
     File /oname=$PLUGINSDIR\splash.bmp "${GRAPHICAL_INSTALLER_SPLASH_BITMAP}"
     advsplash::show ${GRAPHICAL_INSTALLER_SPLASH_BITMAP_TIME} 1500 1500 0xFF00FF $PLUGINSDIR\splash
     Pop $0 ; $0 has '1' if the user closed the splash screen early, '0' if everything closed normally, and '-1' if some error occurred.
     Delete $PLUGINSDIR\splash.bmp
  !endif
FunctionEnd

; Invisible section - required for proper initialization, do not delete this section!
  Section "" Section00
  SectionIn RO
  SetDetailsPrint both
  SetDetailsView show

  ; Initialization of Install page
  ${GraphicalInstallerInitInstallPage}
SectionEnd

Section "MainSection" Section01
  SetOutPath "$INSTDIR"
  SetOverwrite on
  File "..\..\GraphicalInstallerManual.chm"
  File "Readme.txt"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd

Function .onGUIEnd
; Unloading of GraphicalInstaller plug-in
  GraphicalInstaller::UnInitButtons
FunctionEnd

; Macro for components descriptions
!insertmacro GRAPHICAL_INSTALLER_FUNCTION_DESCRIPTION_BEGIN
  FindWindow $R0 "#32770" "" $HWNDPARENT
  GetDlgItem $R0 $R0 1043 ; Description item (must be added to the UI)
  ShowWindow $R0 ${SW_HIDE}
  ShowWindow $R0 ${SW_SHOW}
  !insertmacro GRAPHICAL_INSTALLER_DESCRIPTION_TEXT ${Section01} $(DESC_Section01)
  ShowWindow $R0 ${SW_HIDE}
!insertmacro GRAPHICAL_INSTALLER_FUNCTION_DESCRIPTION_END

; =============
; UnInstaller     
; =============

Section Uninstall
  SetDetailsPrint both
  SetDetailsView show

; Initialization of Uninstall page
  ${GraphicalInstallerInitInstallPage}
  
  Delete "$INSTDIR\uninst.exe"
  Delete "$INSTDIR\Readme.txt"
  Delete "$INSTDIR\GraphicalInstallerManual.chm"

  RMDir "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  SetAutoClose true
  SetOutPath "$INSTDIR"
SectionEnd

Function un.onGUIEnd
; Unloading of GraphicalInstaller plug-in
  GraphicalInstaller::UnInitButtons
FunctionEnd
