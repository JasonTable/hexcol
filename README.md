# hexcol

![Mod Screenshot](screenshot.png)

## 4096 Coloured blocks for minetest.

This mod contains solid colour nodes for every possible 3 digit HEX colour value. From `#000` to `#FFF`.

Update: This mod now uses colour palettes. so there are 16 nodes instead of 4096.
and each node uses a 256 colour palette.

Here is how it works. For the red channel, the blocks are changed, for the blue and green, the param2 is changed.

Lets say you place down the colour `#49f` the node that is placed down is `hexcol:4xx` the last 2 hex digits are converted to decimal and placed in the param2 therefore defining a colour from one of the 16 palette images generated by the PHP script in this repo.

The upside to this approch is that load times are much faster for players, and less nodes are registered so other big mods can use the use the space instead. 

The downside is that its harder to use with worldedit and when placing the nodes using the craftitem, the colour is delayed. So if you place `#49f` it wll show up as `#400` for a split second depending on server ping as it places down `hexcol:4xx` and then sets the param2 to `0x9f`. UPDATE: the colour delay is a thing of the past if you use minetest 5.8.0 or newer.

This mod is currently only for use with creative mode. There is no way to obtain the nodes in survival. Anyone is welcome to make a mod to provide such a method.

If you already have a world using the old version of this mod and want to update, all the old nodes will become unknown. So i made this [converter](https://github.com/JasonTable/hexcol-colvert) to help with that.

If for whatever reason, you would rather have 4096 separate nodes instead of using the color palettes, just delete `init.lua` and rename `init-old.lua` to `init.lua`.

## Settings

* `hexcol_inv` (bool Default: true) Show hexcol nodes in creative inventory.

## Features

* LOTS of colours good for decorative builds such as pixel art.
* Small. Mod code is small.

## Drawbacks

* Floods the creative inventory if hexcol_inv is true (default)

## License

Code is licensed under the MIT license. Image assets are CC0. Though the block texture is just a pain white image so I dont think I could copyright it even if I wanted to lol.
