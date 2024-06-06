# muos-artwork

[MuOS|https://muos.dev] is a great OS for the supported handheld retro emulation consoles. It is as fast as the fastest systems yet customizable to your needs. But it lags behind heavuer systems such Knulli when it comes to artwork. In this project, I share a couple of ressources that I use for myself. Nothing is super-polished and it comes with no warranty whatsoever. But I hope it can prove useful for other people. //If ROMs are mentioned here below, note as usual that you should own the right to use your ROM files. Piracy is a felony ;-)//

## Building artwork for 640x480 devices

I want the MuOS text list of games gently fade under boxart. So alpha channel transarency is required. Skraper doesn't support that so let me use Skyscraper. It is CLI and should install flawlessly on MacOS or Linux. On Windows, unike the docuentation, I'd recommend to install a Linux distro thanks to the Windows 11 WSL and within the emulated Linux, install Skyscraper as on any Linux system. I'm using the following fork : https://github.com/Gemba/skyscraper

### Scraping all the games in system subfolders

I coudn't find how to scrape multiple systems at once using Skyscraper. The following sh script scrapes everything in a folder, assuming that depth=1 subfolders contain ROMs of a particular system. The first parameter is mandatory and permits to select an operation mode :

To fill Skyscraper cache (this is the long part). You need to edit the script and put your [screenscraper.fr](https://www.screenscraper.fr/) credentials.
To 
