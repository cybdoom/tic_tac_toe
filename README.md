# TicTacToe
This program is the solution of test task, listed here: https://gist.github.com/thenanyu/8b865b1b9ac8a0a022655966323a196b

## Requirements
1. Ruby-2.1.2p95
2. Any console terminal

## Installation
Simply copy the source code somewhere

## Run
To play run:
> ruby new_game.rb

## Gameplay
When it is Your turn to make a move, enter one of the following commands and press <ENTER>:

1. Integer coordinates of the desired move. Example:
>...
>
>Player_1: make your move!
>
>**2 1**
2. Symbol "!" to abort the game.
3. Symbol "@" to restart the game.

## Short architecture overview, potential improvements
./new_game.rb is the main executable script, it operates with all other source classes.
With current architecture it is easy to extend the game in several ways, manipulating with decleared constants values and arguments being passed to Game and Field constructors. Examples:

1. Change field size
Edit constant **FIELD_SIZE** decleared in ./new_game.rb

2. Change match count, required for victory
Edit constant **MATCH_TO_WIN** decleared in ./new_game.rb

3. Add more players
Just extend **PLAYERS_CHIPS** array with some additional symbols
Decleared in ./new_game.rb

4. Add different player types (AI, etc)
To implement other player behaviour it is enough to inherit from class Player::Base and override **get_input** method
