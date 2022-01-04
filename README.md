# SortingHat

An app for having two phones communicate where one phone app makes the other phone app speak using the speaker. A nodejs server is in between the 2 apps.

Non commercial project

## Server

This server listens on port 3000 on the public ip of where it sits. It will keep the last item which was sent to it through the post request and then return that alongside a randomly generated number when asked for through the get request

## Speaker

This is the godot app which will produce sounds when the server gets a new utterance.

To add more sounds, add them within the "sounds" folder, and they will be read automatically. The ip address within the app needs to be changed to that of the server when the app is opened. The name/string of the utterance coming from the server must be the same as the name of the item in the sound folder, without the '.wav' file extension part.

## Resorce credits

**Images**:

* Sorting hat: <https://harrypotter.fandom.com/wiki/Sorting_Hat>
* House Banners, Hogwarts: <https://www.wizardingworld.com/>
* Great Hall: <https://screenrant.com/harry-potter-hogwarts-great-hall-hidden-details/>
* Wand: <https://www.pinclipart.com/pindetail/xxwhbw_harrypotter-wand-varinha-harry-potter-penn-mariner-rod/>

**Fonts**:

* Wizardry Night: <https://www.dafont.com/wizardry-night.font>
