# Build a MuOS catalogue from artwork and gamemlists

To be displayed, the text and pictures about games must be placed in a folder hierarchy according a strict naming convention as described here : https://muos.dev/help/artwork. Such a folder structure is called a catalogue.

## Prerequisites

1. The scripts requires that you have already scraped artwork in a folder (here `D:\Emulation\MEDIA`. This folder must contain subfolders with artwork corresponding to ROM files. Only `covers` and `screenshots` folders are mandatory.

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
2. In each system folder (`amiga`, `arcade70`, `arcade80`...), there must also be a `gamelist.xml` file as produced by Skyscraper, Skraper or ARRM for instance.
3. In each system folder which is not named according to the MuOS naming scheme for systems, there must be a `muos-system.txt` file with the MuOS system name as the first line. The MuOS system names can be found here for instance : https://github.com/antiKk/muOS-internal/blob/main/init/MUOS/info/assign.json
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
The script extracts the descriptions from the `gamelist.xml` files and adds `text` folders each containing `txt` files named as the `gamelist.xml` entries. MuOS can display the text information if adequately put in the catalogue.
```
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
```

```
PS D:\Emulation\MEDIA> ls .\arcade70\text
Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a---l        07/06/2024     10:41           2353 asteroid.txt
-a---l        07/06/2024     10:41            189 atetris.txt
-a---l        07/06/2024     10:41           1427 btime.txt
-a---l        07/06/2024     10:41            651 bwidow.txt
...
...
-a---l        07/06/2024     10:41           1934 trackfld.txt
-a---l        07/06/2024     10:41           2516 tron.txt
-a---l        07/06/2024     10:41            350 zaxxon.txt
```

## Copy text and artwork according to a MuOS catalogue structure

You can edit the `media2muos.ps1` to change the destination folder of the catalogue files. Then launch the script (yes there are warnings, the script is dirty).
```
PS D:\Emulation\MEDIA> .\media2muos.ps1
```
In the destination, you get a different folder structure but with boxart, previews ans texts for each system. Note that if multiple media folder have `muos-system.txt` files with the same content, there are all merged per system. Here for instance, I have multiple folders with `Arcade` games (as named by MuOS) : `arcade70`, `arcade80` and `arcade90`.
```
PS D:\Emulation\MEDIA> tree '..\MuOS Catalogue\'
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
You may now copy the system folders in your MuOS SD card such as described here : https://muos.dev/help/artwork
