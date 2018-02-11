## lua-board-display

Displays a blank board, then periodically calls the provided function at a given rate.

That function can then update the image at a given coordinate.

Run [main.lua](./src/main.lua) to see an example. It fills up the screen with Xs.

## Weird things
When you run the application, you need to click on the screen to close it.

I can't figure out how to get the display to be anything other than 800x600 on my computer. It may work on other computers.

## Dependencies
`sudo apt install libgirepository1.0-dev`

`luarocks install lgi`
