# Explanation

Entry Point:
main() calls runApp(RockPaperScissorsApp()), which sets up a MaterialApp with RockPaperScissorsScreen() as its home.

Stateful Widget:
RockPaperScissorsScreen maintains game state with variables for the players choice and computers choice and their scores.

User Interaction:
When a player taps a button , the playGame() method sets the player choice and randomly selects the computers choice. Then it calls _updateScores() to compare choices and update scores.

UI Updates:
The choices which are displayed as emojis and scores are shown in text widgets with setState() ensuring the ui reflects any changes.

Reset Functionality:
a reset button calls _resetGame(), clearing choices and resetting scores.
