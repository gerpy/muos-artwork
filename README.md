# MuOS artwork

MuOS (https://muos.dev] is a great OS for the supported handheld retro emulation consoles. It is as fast as the fastest systems yet customizable to your needs. But it lags behind heavuer systems such Knulli when it comes to artwork. In this project, I share a couple of ressources that I use for myself. Nothing is super-polished and it comes with no warranty whatsoever. But I hope it can prove useful for other people. //If ROMs are mentioned here below, note as usual that you should own the right to use your ROM files.//

## Building artwork for 640x480 devices

I want the MuOS text list of games gently fade under boxart. So alpha channel transarency is required. Skraper doesn't support that so let me use Skyscraper. It is CLI and should install flawlessly on MacOS or Linux. On Windows, unike the docuentation, I'd recommend to install a Linux distro thanks to the Windows 11 WSL and within the emulated Linux, install Skyscraper as on any Linux system. I'm using the following fork : https://github.com/Gemba/skyscraper

### Scraping all the games in system subfolders

I coudn't find how to scrape multiple systems at once using Skyscraper. The following sh script scrapes everything in a folder, assuming that depth=1 subfolders contain ROMs of a particular system. The first parameter is mandatory and permits to select an operation mode :

  - To fill Skyscraper cache (this is the long part). You need to edit the script and put your [screenscraper.fr](https://www.screenscraper.fr/) credentials.
  - To process the artwork
  - For both

### Masks

The following masks are 640*480. The left part is transparent and a gradient starts at x=320. At x=400 and above, there is no transparency at all. Overall, this lets 1/2 of the screen completely transparent. The masks are go=iven in PNG format, along with the Photoshop file used to produce them.

The PNG files need to be put in your ~/.skyscraper/ressources folder. In the following, we assume that you put them in a  ~/.skyscraper/ressources/tokumeino-mix.

### Mix XML style

The following style is for Skyscraper and not Skraper since the latter doen't handle transparency masks. Edit the XML file to change the type of mask. I provide two versions of the style :

  - gradient-full.xml covers the whole height of the screen, from the first to the last line
  - gradient-bars.xml doesn't cover the 42pix on top and bottom that MuOS saves for the status icons and button help ; these areas are thus left to the theme

Each theme is taylored for the worst wase. GBA screenshots come 2:3 vertical, with the two screens stacked. So the area is set to 



