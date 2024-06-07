# System artwork for any theme

## What's the issue with most system artwork ?

There are several sets of gaming systems pictures on the web. However, the darkest pictures do not always display well on dark themes. Same with light over light. On the MuOS Discord, @joyrider3774 helped me by downloading hi res pictures for each system from [Screencraper.fr](https://www.screenscraper.fr/) using the API. He has conveniently stored the results on [Mega](https://mega.nz/folder/s8oSiRBD#USPpSPL4Qzb5wgeJnVLlzg). BTW, he also helped me for the convert commands of the script.

There are color logos, B&W logos and pictures of the consoles/systems. To give an example, I will focus on [system pictures](https://github.com/gerpy/muos-artwork/tree/master/system-scraping/system-pictures/shadow-invert) and [color logos](https://github.com/gerpy/muos-artwork/tree/master/system-scraping/system-logos/shadow-invert).

Here are original white and black logos, as displayed on your current GitHub theme (yes there are 2 logos tight below).

<kbd>
  <img src="https://github.com/gerpy/muos-artwork/blob/master/system-scraping/system-logos/Playstation%204_wor_1.png">
</kbd>

<kbd>
  <img src="https://github.com/gerpy/muos-artwork/blob/master/system-scraping/system-logos/Nintendo%20DS_wor_1.png">
</kbd>

![white](https://github.com/gerpy/muos-artwork/blob/master/system-scraping/system-logos/Playstation%204_wor_1.png)
![black](https://github.com/gerpy/muos-artwork/blob/master/system-scraping/system-logos/Nintendo%20DS_wor_1.png)

We want that, with a small border to underline logo :

![white](https://github.com/gerpy/muos-artwork/blob/master/system-scraping/system-logos/shadow-invert/Playstation%204_wor_1.png)
![black](https://github.com/gerpy/muos-artwork/blob/master/system-scraping/system-logos/shadow-invert/Nintendo%20DS_wor_1.png)

## How does it work ?

The script calculates the average color of an image and applies a surrounding shadow of the inverse color. For colored logos, it turns like that :
![white](https://github.com/gerpy/muos-artwork/blob/master/system-scraping/system-logos/shadow-invert/Game%20Boy_wor_1.png)

Additional features are :
- Rotate landscape logos if desired (change the adaquate variable at the begining of the script)
- Resize with a pixel number, and not witdh or height so as to balance long and square logos (change the adaquate variable at the begining of the script). A pixel number of 19400 is nice for logos since even long ones won't go over the 396px height of the visible part of the screen on a 640x480 device running MuOS.
- Adjust the radius of the shadow in proportion of the image size (change the adaquate variable at the begining of the script)

The script accepts one parameter : 
```add-shadow.sh /path/to/pictures/folder```

New pictures are output in subfolders of the parameter folder.
