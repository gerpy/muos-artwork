# Build a MuOS catalogue

## Prerequisite

1. These scripts are written in Windows Powershell. They can be placed anywhere : the working directories are passed as parameters. It requires that you have already scraped artwork in a folder (here `D:\Emulation\MEDIA`. This folder must contain subfolders with artwork corresponding to ROM files.

```
PS D:\Emulation\MEDIA> tree
D:.
├───amiga
│   ├───covers
│   ├───marquees
│   ├───screenshots
│   ├───textures
│   └───wheels
├───arcade70
│   ├───covers
│   ├───marquees
│   ├───screenshots
│   ├───textures
│   └───wheels
├───arcade80
│   ├───covers
│   ├───marquees
│   ├───screenshots
│   ├───textures
│   └───wheels
```
2. In each system folder (`amiga`, `arcade70`, `arcade80`...), there must be a proper `gamelist.xml` file produced by Skyscraper, Skraper or ARRM for instance.
3. In each system folder which is not named according to the MuOS default naming scheme for system, there must be a `muos-system.txt` file with the MuOS system name as the first line.
```
PS D:\Emulation\MEDIA> cat .\amiga\muos-system.txt
Commodore Amiga
PS D:\Emulation\MEDIA> cat .\snes\muos-system.txt
Nintendo SNES - SFC
PS D:\Emulation\MEDIA> cat .\arcade70\muos-system.txt
Arcade
PS D:\Emulation\MEDIA> cat .\arcade80\muos-system.txt
Arcade
```
4. The scripts must be at the root of your ROM folder
```
PS D:\Emulation\MEDIA> dir
Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d----l        07/06/2024     08:59                amiga
d----l        07/06/2024     08:59                arcade70
d----l        07/06/2024     08:59                arcade80
...
...
d----l        07/06/2024     09:02                saturn
d----l        07/06/2024     09:01                snes
-a---l        30/05/2024     18:51           1282 gamelists2text.ps1
-a---l        30/05/2024     16:46           2599 media2muos.ps1
-a---l        30/05/2024     16:44           3150 xml2txt.ps1
```

## Extract text from the gamelist.xml files

Run the `gamelists2text.ps1`script
```
PS D:\Emulation\MEDIA> .\gamelists2text.ps1
```

To work, 


```
PS D:\Emulation\MEDIA> .\gamelists2text.ps1



PS D:\Emulation\MEDIA> tree
Structure du dossier pour le volume Data
Le numéro de série du volume est BE81-76EF
D:.
├───amiga
│   ├───covers
│   ├───marquees
│   ├───screenshots
│   ├───text
│   ├───textures
│   └───wheels
├───arcade70
│   ├───covers
│   ├───marquees
│   ├───screenshots
│   ├───text
│   ├───textures
│   └───wheels
├───arcade80
│   ├───covers
│   ├───marquees
│   ├───screenshots
│   ├───text
│   ├───textures
│   └───wheels

PS D:\Emulation\MEDIA> ls .\arcade70\text


    Répertoire : D:\Emulation\MEDIA\arcade70\text


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a---l        07/06/2024     10:41           2353 asteroid.txt
-a---l        07/06/2024     10:41            189 atetris.txt
-a---l        07/06/2024     10:41           1427 btime.txt
-a---l        07/06/2024     10:41            651 bwidow.txt
-a---l        07/06/2024     10:41           1103 bzone.txt
-a---l        07/06/2024     10:41           1981 defender.txt
-a---l        07/06/2024     10:41            372 digdug.txt
-a---l        07/06/2024     10:41            593 frogger.txt
-a---l        07/06/2024     10:41            707 galaga.txt
-a---l        07/06/2024     10:41            671 galaxian.txt
-a---l        07/06/2024     10:41           1088 gyruss.txt
-a---l        07/06/2024     10:41            785 invaders.txt
-a---l        07/06/2024     10:41           1830 joust.txt
-a---l        07/06/2024     10:41           1348 jrpacman.txt
-a---l        07/06/2024     10:41           1282 junofrst.txt
-a---l        07/06/2024     10:41           2513 llander.txt
-a---l        07/06/2024     10:41           1288 mhavoc.txt
-a---l        07/06/2024     10:41           1211 milliped.txt
-a---l        07/06/2024     10:41            870 missile.txt
-a---l        07/06/2024     10:41           1830 mpatrol.txt
-a---l        07/06/2024     10:41           1057 mspacman.txt
-a---l        07/06/2024     10:41            361 pacman.txt
-a---l        07/06/2024     10:41            520 qbert.txt
-a---l        07/06/2024     10:41            987 rallyx.txt
-a---l        07/06/2024     10:41           1501 robotron.txt
-a---l        07/06/2024     10:41            576 tempest.txt
-a---l        07/06/2024     10:41           1934 trackfld.txt
-a---l        07/06/2024     10:41           2516 tron.txt
-a---l        07/06/2024     10:41            350 zaxxon.txt


PS D:\Emulation\MEDIA> .\media2muos.ps1


PS D:\Emulation\MEDIA> tree '..\MuOS Catalogue\'
Structure du dossier pour le volume Data
Le numéro de série du volume est BE81-76EF
D:\EMULATION\MUOS CATALOGUE
├───Arcade
│   ├───box
│   ├───preview
│   └───text
├───Commodore Amiga
│   ├───box
│   ├───preview
│   └───text
├───Nintendo DS
│   ├───box
│   ├───preview
│   └───text
├───Nintendo Game Boy
│   ├───box
│   ├───preview
│   └───text
```


