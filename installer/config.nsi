
; Include files for Modern UI 2
!include "MUI2.nsh"

; Wizard common defines
!define PRODUCT_NAME "Launcher"
!define PRODUCT_VERSION "1.0"
!define PRODUCT_PUBLISHER "ME"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"
!define SRCDIR "D:\Development\MachSecure.Launcher\dist\MachSecure.Launcher-win32-ia32"
!define EXEC "MachSecure.Launcher.exe"

Name "${PRODUCT_NAME}"

OutFile "D:\Development\MachSecure.Launcher\dist\installer\${PRODUCT_NAME}Setup.exe"
InstallDir "C:\MHAServices\${PRODUCT_NAME}"
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
!insertmacro MUI_PAGE_COMPONENTS
;!insertmacro MUI_PAGE_LICENSE "..\..\readme.txt"
XPStyle on
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
;!define MUI_FINISHPAGE_SHOWREADME "$INSTDIR\GraphicalInstallerManual.chm"
!define FINISHPAGE_NOAUTOCLOSE
!insertmacro MUI_PAGE_FINISH

; ===================
;  unInstaller pages
; ===================
!define MUI_WELCOMEPAGE_TITLE_3LINES
!insertmacro MUI_UNPAGE_WELCOME
!insertmacro MUI_UNPAGE_CONFIRM
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
VIAddVersionKey /LANG=${LANG_ENGLISH} "Comments" " "
VIAddVersionKey /LANG=${LANG_ENGLISH} "CompanyName" "${PRODUCT_PUBLISHER}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalCopyright" "Copyright (c) 2016 ${PRODUCT_PUBLISHER}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileDescription" "${PRODUCT_NAME}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileVersion" "${PRODUCT_VERSION}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductVersion" "${PRODUCT_VERSION}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "InternalName" "${PRODUCT_NAME}Setup.exe"
VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalTrademarks" "Copyright (c) 2016 ${PRODUCT_PUBLISHER}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "OriginalFilename" "${PRODUCT_NAME}Setup.exe"

; =================
;  Install Data
; =================

Section
  SetOutPath "$INSTDIR"
  SetOverwrite on
  File /r "${SRCDIR}\*"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\${PRODUCT_NAME}Uninstall.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\${PRODUCT_NAME}Uninstall.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd

; =============
; UnInstaller
; =============

Section Uninstall
  SetDetailsPrint both
  SetDetailsView show

  Delete "$INSTDIR\${exec}"
  Delete "$INSTDIR\${PRODUCT_NAME}Uninstall.exe"

  RMDir /r "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  SetAutoClose true
SectionEnd