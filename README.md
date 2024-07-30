
This project ports the English translation of **Never7 - the end of infinity** VN to PSP.

### Useful Links

[**Patch Downloads**](https://github.com/bibarub/N7-psp-english/releases)

[Thread on Gbatemp.net](https://gbatemp.net/threads/release-never7-the-end-of-infinity-psp-english-translation.557697/)

[All endings flowchart](https://gamefaqs.gamespot.com/pc/715439-never7-the-end-of-infinity/map/9294-all-endings-flowchart)

Credits for English translation go to [TLWiki team](https://web.archive.org/web/20180905090319/http://tlwiki.org/index.php?title=Never_7) (now defunct) and [malucart](https://github.com/malucard)


Current status
-----------

Scenes: Translated, but text overflows the text box in a few places. (Move the text box up a bit in game settings)
<br>
Shortcuts (init.bin): Translated.
<br>
TIPS (init.bin): Translated.
<br>
Names (init.bin): Translated.
<br>
Menus (BOOT.BIN): Translated. HOME menu - Translated.
<br>
Font (FONT00.FOP): Tweaked for English text, reduced spacing. EN glyphs are brightened and sharpened.


For Developers
-----------

This project is a bunch of scripts and programs in bash, python and C. Python and C programs unpack and repack game resources, decode text, fonts etc. Shell scripts automate the process of applying the translation. They should should work both on macos and linux.

For the full run

1. Put the Never7 iso at `iso/Never7-jap.iso`

2. Run `./release.sh`

3. Result iso will be at `iso/n7-repacked.iso`

`./generate-patch.sh` can be used to generate an xdelta3 diff file.

For further details, read the content of shell scripts (and other source files).

##### Dependencies:

The following tools should be available in your PATH:

`7z mkisofs gcc python3`

- `mkisofs` is a part of `cdrtools` package - google it.

- Brew command for macos to install dependencies: `brew install p7zip cdrtools python3`.

- Last tested to be working with python 3.12, will likely work with later versions too.
