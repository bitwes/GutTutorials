# Requirements

#### Ball
* Bouncing off of ceiling and floor changes `y` direction as a reflection.
* Bouncing off of paddle will give the ball a random `y` speed and reverses `x` direction.
* Ball increases in speed by a constant amount every time it bounces off of a paddle.
* The ball cannot increase speed above a max speed.

#### Paddles
* Paddles move up and down at a constant speed.
* Left paddle and right paddle have separate up/down keys.
* Paddles start centered vertically.
* Paddles cannot move off of the top/bottom of screen.
* Paddles move as long as the direction button is depressed.
* If both up/down buttons are depressed the paddle does not move.

#### Game
* Ball starts in the center of the screen moving left at `BASE_SPEED`.
* First to score 5 points wins.
* When the ball goes past the paddle the other paddle gets a point.
* Score is displayed.
* Upon scoring
  * The ball resets to center of screen
  * The ball resets to `BASE_SPEED`
  * The ball begins moving towards the side that scored.
  * There is a 1 second delay before the ball starts moving.
  * The paddles reset to center.
* When the game ends
  * A "New Game" button appears in the middle of the screen.
  * The ball does not respawn.
  * The paddles remain where they are.
* New Game:
  * Paddles and ball reset to starting positions and speeds.
  * Score resets to 0/0
  * "New Game" button disappears.
