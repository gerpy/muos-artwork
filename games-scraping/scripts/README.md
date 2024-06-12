# Script to scrape multiple systems at once from Skycraper

## Prerequisites

The following examples are drawn from an Unbuntu virtual machine under Windows 11, with all the files on my `D:` drive

1. A folder with ROMS organised by gaming systems subfolders
```
pierre@Legion:~$ ls -l ~
total 8
lrwxrwxrwx  1 pierre pierre   23 May 27 19:17 artwork -> /mnt/d/Emulation/MEDIA/
lrwxrwxrwx  1 pierre pierre   51 Jun  7 08:42 mixes -> '/mnt/d/Emulation/MuOS Artwork/games-scraping/mixes/'
lrwxrwxrwx  1 pierre pierre   22 May 27 14:24 roms -> /mnt/d/Emulation/ROMS/
drwxr-xr-x  2 pierre pierre 4096 Jun  7 08:49 scripts
drwxr-xr-x 12 pierre pierre 4096 May 27 14:24 skysource
```
```
pierre@Legion:~$ ls ~/roms
amiga     arcade90  dreamcast  gbc               mastersystem  n3ds   naomi2  ngpc   psp     scummvm  vectrex
arcade70  c64       gb         gc                megacd        n64    nds     pico8  psx     snes     wii
arcade80  dos       gba        m3u-generator.py  megadrive     naomi  nes     ps2    saturn  switch
```
2. The PNG masks at the right place and the XML file properly set up with the mask you prefer
3. The script installed whenever you prefer
```
pierre@Legion:~$ ls -l ~/scripts/
total 4
lrwxrwxrwx 1 pierre pierre 69 Jun  7 08:49 skyscrape-all.sh -> '/mnt/d/Emulation/MuOS Artwork/games-scraping/scripts/skyscrape-all.sh'
```
4. In the system folder, `.sky` empty files with names corresponding to the gaming system name as in Skyscraper. They can be obtained using the command `Skyscraper --help`.
```
pierre@Legion:~$ find roms/ -name *.sky
roms/amiga/amiga.sky
roms/arcade70/arcade.sky
roms/arcade80/arcade.sky
roms/arcade90/arcade.sky
roms/dreamcast/dreamcast.sky
roms/gb/gb.sky
roms/gba/gba.sky
roms/gbc/gbc.sky
roms/mastersystem/mastersystem.sky
roms/megacd/segacd.sky
roms/megadrive/megadrive.sky
roms/n64/n64.sky
roms/nds/nds.sky
roms/nes/nes.sky
roms/ngpc/ngpc.sky
roms/pico8/pico8.sky
roms/psx/psx.sky
roms/saturn/saturn.sky
roms/scummvm.sky
roms/snes/snes.sky
```

## Run the script

### Adapt the script

- You need to modify the script to point to the XML mix you want to use
- You also need to replace `login:password` by your Screenscraper.fr credentials

### Usage

```
scrape-all-systems <mode> <sourceFolder> <destFolder>
```

- `<mode>` is mandatory :
  - `PULL` (download from the net and fill the cache)
  - `ART`  (compose artwok according to XML mix)
  - `BOTH` (both)
- `<sourceFolder>` is mandatory ; refers to the ROMs root folder (which contains emulated system folders)
- `<destinationFolder>` is optional ; root folder where the scraped media and gamelist will be written

If `<destinationFolder>` is not provided, <sourceFolder> is used by default

Subfolders are created in <destinationFolder>, replicating the ROMs system folders
The script assumes that there is a <system>.sky empty file in each rom system folder <system> refers to skyskraper system names as listed by Skyscraper --help 

If no `<system>.sky`, the script skips the folder

### Example

```
pierre@Legion:~$ ./scripts/skyscrape-all.sh BOTH ~/roms ~/artwork
```

### After

```
pierre@Legion:~$ ls ~/artwork
amiga     arcade80  dreamcast           gb   gbc           media2muos.ps1  megadrive  nds  ngpc   psx     snes
arcade70  arcade90  gamelists2text.ps1  gba  mastersystem  megacd          n64        nes  pico8  saturn  xml2txt.ps1
```
