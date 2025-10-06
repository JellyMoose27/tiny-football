# Tiny Football

A Game Programming project developed by Group 5 using the Godot Engine version 4.5

# Game concept

Tiny Footbal is a one-on-one Pong-like fighting game developed by Group 5 of class CC01 on the Godot Engine 4.5, the core gameplay of Tiny Football is players will compete to take control of the ball to score as much as possible. Each players will control a character on each side of the screen, with player 1 on the left, and player 2 on the right. The player's objective is to kick the ball into the other player's goal on the opposite side and do it as many times as possible.

**Fully detailed Game Design Document can be seen ![here](https://docs.google.com/document/d/1DZB3DOdCDvatDOHOyQoA1dfMkeiWyGJW_97vBWZ8FY0/edit?usp=sharing)**

# Control scheme

Player 1:
- WASD to move and jump
- F to kick

Player 2:
- Arrow keys to move and jump
- Slash ("/") to kick

Player 1 is indicated by the character with red coat and white hair, while Player 2 is indicated by blue coat and hair

# How to run the game

Option 1: Simply download the repository and run the ``TinyFootball.exe`` program to play the game

Option 2:
- Download the repository
- Install the latest version of Godot (4.5) (recommneded to install on Steam)
- Import the project folder and load it on startup
- Click "Run Project" on the top right corner of the screen or press F5 to play the game

# Known Issues
**No pause menu**:
  - Lack of a pause menu means that the only way to go back to the title screen is to re-launch the game.
    
**No win condition**:
  - The gameplay is currently endless as there is no limit to the number of goals scored or time limit.
    
**Tunneling**:
  - Despite a fail-safe implemented to prevent softlocking, the ball can tunnel through the walls every now and then. A possible solution to this is to use a Raycast2D object from Godot, however due to time constraints this has not yet been implemented.
    
**No sound effects**:
  - Lack of sound effects can make the game somewhat lifeless and empty.
    
**No PVE**:
  - Currently the game only supports local multiplayer with player 1 and player 2. Player AI has not yet been implemented
    
 **No player-to-player collision**:
  - Lack of player-to-player collision can cause players to phase through each other

# Asset Credits
**Characters**
- Character sprites are ripped from the character ![Ragna](https://www.dustloop.com/w/BBCF/Ragna_the_Bloodedge) from the fighting game ![BlazBlue Centralfiction](https://www.dustloop.com/w/BBCF). With player 2 sprites modified using Aseprite (full spritesheet can be found ![here](https://www.spriters-resource.com/pc_computer/blazbluecentralfiction/asset/92445/))
  
**Background music**
- Title screen and gameplay music are taken from the 3D fighting game ![Tekken 8](https://tekken.fandom.com/wiki/TEKKEN_8_ORIGINAL_SOUNDTRACK).
- The title screen's BGM is called ![Liberation](https://youtu.be/9e4heRDhJ94?si=l17TGQtcu6tzPBOD)
- The gameplay's BGM is called ![Streak of Blue](https://youtu.be/S4Lit6cTGv0?si=0BUUhktopjwphguj)
  
**Others**
- Asset sprites for clouds, ball, goal, heart (unused) and title logo are drawn using Aseprite
