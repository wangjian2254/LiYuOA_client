; �ýű�ʹ�� ������װ(az.eliang.com) ������
; ��װ�����ʼ���峣��
!define PRODUCT_NAME "�����ճ̹���"
!define PRODUCT_VERSION "1.0.3"
!define PRODUCT_PUBLISHER "����"
!define PRODUCT_WEB_SITE "http://liyuoa.duapp.com"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\CalendarOA_AIR.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"
!define PRODUCT_STARTMENU_REGVAL "NSIS:StartMenuDir"

SetCompressor lzma

; ������װ����Ȩ��(vista,win7,win8)
RequestExecutionLevel admin

; ------ MUI �ִ����涨�� ------
!include "MUI2.nsh"

; MUI Ԥ���峣��
!define MUI_ABORTWARNING
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "${NSISDIR}\Contrib\Graphics\Header\eliang-install.bmp"
!define MUI_HEADERIMAGE_UNBITMAP "${NSISDIR}\Contrib\Graphics\Header\eliang-uninstall.bmp"
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\eliang-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\eliang-uninstall.ico"
!define MUI_WELCOMEFINISHPAGE_BITMAP "${NSISDIR}\Contrib\Graphics\Wizard\eliang-install.bmp"
!define MUI_UNWELCOMEFINISHPAGE_BITMAP "${NSISDIR}\Contrib\Graphics\Wizard\eliang-uninstall.bmp"

; ��ӭҳ��
!insertmacro MUI_PAGE_WELCOME
; ���Э��ҳ��
!insertmacro MUI_PAGE_LICENSE "${NSISDIR}\license.txt"
; ��װĿ¼ѡ��ҳ��
!insertmacro MUI_PAGE_DIRECTORY
; ��ʼ�˵�����ҳ��
var ICONS_GROUP
!define MUI_STARTMENUPAGE_NODISABLE
!define MUI_STARTMENUPAGE_DEFAULTFOLDER "�����ճ̹���"
!define MUI_STARTMENUPAGE_REGISTRY_ROOT "${PRODUCT_UNINST_ROOT_KEY}"
!define MUI_STARTMENUPAGE_REGISTRY_KEY "${PRODUCT_UNINST_KEY}"
!define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "${PRODUCT_STARTMENU_REGVAL}"
!insertmacro MUI_PAGE_STARTMENU Application $ICONS_GROUP
; ��װ����ҳ��
!insertmacro MUI_PAGE_INSTFILES
; ��װ���ҳ��
!define MUI_FINISHPAGE_RUN "$INSTDIR\CalendarOA_AIR.exe"
!insertmacro MUI_PAGE_FINISH

; ��װж�ع���ҳ��
!insertmacro MUI_UNPAGE_WELCOME
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

; ��װ�����������������
!insertmacro MUI_LANGUAGE "SimpChinese"

; ------ MUI �ִ����涨����� ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "LiYuOA.exe"
ELiangID 3DAFE9FEI9     /*  ��װͳ�������ƣ����ճ̹���  */
InstallDir "$PROGRAMFILES\�����ճ̹���"
InstallDirRegKey HKLM "${PRODUCT_UNINST_KEY}" "UninstallString"
ShowInstDetails show
ShowUninstDetails show
BrandingText " "

;��װ���汾�Ÿ�ʽ����Ϊx.x.x.x��4������,ÿ��������Χ0~65535,��:2.0.1.2
;��ʹ������ͳ��,�汾�Ž��������ֲ�ͬ�汾�İ�װ���,��ʱ�����û������д��ȷ�İ汾��
!define INSTALL_VERSION "1.0.2.0"

VIProductVersion "${INSTALL_VERSION}"
VIAddVersionKey /LANG=${LANG_SimpChinese} "ProductName"      "�����ճ̹���"
VIAddVersionKey /LANG=${LANG_SimpChinese} "Comments"         "�����ճ̹���(����)"
VIAddVersionKey /LANG=${LANG_SimpChinese} "CompanyName"      "����"
VIAddVersionKey /LANG=${LANG_SimpChinese} "LegalCopyright"   "����(http://liyuoa.duapp.com)"
VIAddVersionKey /LANG=${LANG_SimpChinese} "FileDescription"  "�����ճ̹���"
VIAddVersionKey /LANG=${LANG_SimpChinese} "ProductVersion"   "${INSTALL_VERSION}"
VIAddVersionKey /LANG=${LANG_SimpChinese} "FileVersion"      "${INSTALL_VERSION}"

Section "MainSection" SEC01
  SetOutPath "$INSTDIR"
  File /r "D:\GitProject\LiYuOA_client\LiYuOA\*.*"
  File "D:\GitProject\LiYuOA_client\LiYuOA\CalendarOA_AIR.exe"

; ������ʼ�˵���ݷ�ʽ
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
  CreateDirectory "$SMPROGRAMS\$ICONS_GROUP"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\�����ճ̹���.lnk" "$INSTDIR\CalendarOA_AIR.exe"
  CreateShortCut "$DESKTOP\�����ճ̹���.lnk" "$INSTDIR\CalendarOA_AIR.exe"
  CreateShortCut "$SMPROGRAMS\Startup\�����ճ̹���.lnk" "$INSTDIR\CalendarOA_AIR.exe"

  !insertmacro MUI_STARTMENU_WRITE_END
SectionEnd

Section -AdditionalIcons
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
  WriteINIStr "$INSTDIR\${PRODUCT_NAME}.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\���������ճ̹�����ҳ.lnk" "$INSTDIR\${PRODUCT_NAME}.url"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\ж�������ճ̹���.lnk" "$INSTDIR\uninst.exe"
  !insertmacro MUI_STARTMENU_WRITE_END
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\CalendarOA_AIR.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\CalendarOA_AIR.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd

/******************************
*  �����ǰ�װ�����ж�ز���  *
******************************/

Section Uninstall
  !insertmacro MUI_STARTMENU_GETFOLDER "Application" $ICONS_GROUP
  Delete "$INSTDIR\${PRODUCT_NAME}.url"
  Delete "$INSTDIR\uninst.exe"
  Delete "$INSTDIR\CalendarOA_AIR.exe"

  Delete "$SMPROGRAMS\$ICONS_GROUP\���������ճ̹�����ҳ.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\ж�������ճ̹���.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\�����ճ̹���.lnk"
  Delete "$DESKTOP\�����ճ̹���.lnk"

  RMDir "$SMPROGRAMS\$ICONS_GROUP"

  RMDir /r "$INSTDIR\Adobe AIR"
  RMDir /r "$INSTDIR\assets"
  RMDir /r "$INSTDIR\META-INF"

  RMDir "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
SectionEnd

/* ���� NSIS �ű��༭����,���� Function ���α�������� Section ����֮���д,�Ա��ⰲװ�������δ��Ԥ֪������. */

Function un.onInit
FunctionEnd

Function un.onUninstSuccess
FunctionEnd
