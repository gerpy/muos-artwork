# Scraping games artwork with Skyscraper

I want the MuOS text list of games gently fade under boxart. So alpha channel transparency is required. Skraper doesn't support that so let me use Skyscraper. It is CLI and should install flawlessly on MacOS or Linux. On Windows, unike advised in the documentation, I'd recommend to install a Linux distro within the Windows 11 WSL and from there, install Skyscraper as on any Linux system. I'm using the following fork : https://github.com/Gemba/skyscraper

## Workflow

1. Get the masks from https://github.com/gerpy/muos-artwork/tree/master/games-scraping/resources
2. Get an XML mix from https://github.com/gerpy/muos-artwork/tree/master/games-scraping/mixes
3. Get the scrape script from https://github.com/gerpy/muos-artwork/tree/master/games-scraping/scripts
4. Run the script and enjoy !

## Samples

See samples here : https://github.com/gerpy/muos-artwork/tree/master/games-scraping/samples

![](https://github.com/gerpy/muos-artwork/blob/master/games-scraping/samples/Advance%20Wars%20-%20Dual%20Strike%20(USA%2C%20Australia).png)
![](https://github.com/gerpy/muos-artwork/blob/master/games-scraping/samples/1941.png)
![](https://github.com/gerpy/muos-artwork/blob/master/games-scraping/samples/Mario%20Kart%2064%20(USA).png)
![](https://github.com/gerpy/muos-artwork/blob/master/games-scraping/samples/Sega%20Rally%20Championship%20(USA).png)

