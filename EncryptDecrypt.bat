ECHO OFF
cd C:\Windows\Microsoft.NET\Framework\v2.0.50727
c:

SET /p Mode="Do you want to Encrypt or Decrypt Appsettings/connectionStrings? (e/d)"
IF /i "%Mode%"=="e" GOTO encryption
IF /i "%Mode%" == "d" GOTO decryption
ECHO Invalid Option
GOTO end

:: Encrypt or Decrypt web.config

:encryption

SET /p environment="Do you want to Encrypt Appsettings/connectionStrings? (a/c)"
IF /i "%environment%" == "a" GOTO appsetting
IF /i "%environment%" == "c" GOTO connectionstring
ECHO Invalid Option
GOTO end

	:: Encrypt appsettings in web.config
	:appsetting
	set /p Input1=To Encrypt Appsettings Enter Folder path:
 
		aspnet_regiis.exe -pef "appSettings" %Input1% -prov "DataProtectionConfigurationProvider"
	goto end

	:: Encrypt connectionstring in web.config
	:connectionstring
	set /p InputConn=To Encrypt Connection Strings Enter Folder path:
		aspnet_regiis.exe -pef "connectionStrings" %InputConn% -prov "DataProtectionConfigurationProvider"
	goto end

goto end



:decryption

SET /p Decenvironment="Do you want to Decrypt Appsettings/connectionStrings? (a/c)"
IF /i "%Decenvironment%" == "a" GOTO Dappsetting
IF /i "%Decenvironment%" == "c" GOTO Dconnectionstring
ECHO Invalid Option
GOTO end

	:: Decrypt appsettings in web.config
	:Dappsetting
		set /p DecInput=To Decrypt Appsettings Enter Folder path:
		aspnet_regiis.exe -pdf "appSettings" %DecInput%
	goto end

	:: Decrypt connectionstring in web.config
	:Dconnectionstring
		set /p DecInputConn=To Decrypt Connection Strings Enter Folder path:
		aspnet_regiis.exe -pdf "connectionStrings" %DecInputConn%

	goto end

goto end

:end
PAUSE


 