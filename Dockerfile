FROM mcr.microsoft.com/windows/servercore:10.0.19042.1889-amd64
ADD https://download.uipath.com/versions/23.6.1-beta.13324/UiPathStudio.msi C:\\UiPathStudio.msi
RUN C:\\UiPathStudio.msi ADDLOCAL=DesktopFeature,Robot APPLICATIONFOLDER=C:\\UiPath 
#CMD ["UiRobot.exe", "--connect", "-url", "https://cloud.uipath.com/anikaMCsystems/AnikaSystemsDefault/orchestrator_", "-key", "a08cd937-8c48-477b-8a49-897509887eae"]
#RUN powershell Start-Sleep -s 1000
COPY Test.ps1 . 
#WORKDIR /UiPath
ENTRYPOINT [ "powershell", "./Test.ps1" ]