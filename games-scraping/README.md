# Scraping games artwork with Skyscraper

I want the MuOS text list of games gently fade under boxart. So alpha channel transparency is required. Skraper doesn't support that so let me use Skyscraper. It is CLI and should install flawlessly on MacOS or Linux. I'm using the following fork : https://github.com/Gemba/skyscraper

On Windows, unike advised in the documentation https://github.com/Gemba/skyscraper/blob/master/win32/README.md, I'd recommend to install a Linux distro within the Windows 11 WSL and from there, install Skyscraper as on any Linux system https://github.com/Gemba/skyscraper?tab=readme-ov-file#how-to-install-skyscraper. 

## Workflow

1. Get the masks from https://github.com/gerpy/muos-artwork/tree/master/games-scraping/masks
2. Get an XML mix from https://github.com/gerpy/muos-artwork/tree/master/games-scraping/mixes
3. Get the scrape script from https://github.com/gerpy/muos-artwork/tree/master/games-scraping/scripts
4. Run the script and enjoy !

## Samples

See samples here : https://github.com/gerpy/muos-artwork/tree/master/games-scraping/mixes

