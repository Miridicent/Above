# Above

**Above** is a 2D turn-based RPG developed in **GameMaker using GML (GameMaker Language)**.

The project was developed to explore gameplay programming and the design of interconnected systems, with a particular focus on turn-based combat, character statistics, resource management, and player interaction.

## Project Overview

The core of *Above* is a turn-based combat system where the player chooses actions during their turn and manages their character's resources throughout an encounter.

The combat system includes:

* **Normal attacks** for standard damage
* **Skills** that consume MP
* **Healing** abilities that restore HP
* **HP management** for tracking character health
* **MP management** for controlling skill usage
* Turn-based action processing
* Player and enemy interactions

These systems work together to create the game's core combat loop.

## Technical Implementation

The project involved implementing and connecting several gameplay systems rather than relying solely on GameMaker's built-in functionality.

### Combat System

The combat system manages the flow of turns and processes the player's selected action.

Actions can produce different effects depending on their type, including:

* Dealing damage
* Restoring HP
* Consuming MP
* Updating character statistics
* Progressing the battle state

### Character Statistics

Characters use HP and MP values that are updated during combat.

HP is used to determine whether a character remains active in battle, while MP acts as a limited resource for using skills.

This required keeping character state consistent as actions are performed and ensuring that changes are reflected throughout the combat system.

### Game State

The project uses different gameplay states to control what the player can currently do.

This allows the game to distinguish between situations such as:

* Exploring
* Interacting with characters
* Entering an encounter
* Selecting a combat action
* Processing an enemy turn
* Ending a battle

Managing these states helped keep different gameplay systems separate while allowing them to interact with one another.

## Skills Demonstrated

Through developing *Above*, I gained practical experience with:

* **GML programming**
* Object-oriented-style game architecture within GameMaker
* State management
* Event-driven programming
* Implementing game logic
* Managing variables and persistent game data
* Designing reusable gameplay systems
* Handling player input
* Debugging gameplay systems
* Building and testing a complete playable application

## Technologies

| Technology       | Use                                     |
| ---------------- | --------------------------------------- |
| **GameMaker**    | Game engine and development environment |
| **GML**          | Gameplay and system programming         |
| **Git / GitHub** | Source control and project management   |

## Repository Structure

```text
Above/
├── Above/              # GameMaker project source
└── Above_Build.zip     # Playable Windows build
```

## Running the Project

### Play the Windows Build

1. Download `Above_Build.zip`.
2. Extract the archive.
3. Run the included executable.

### Open the Source Project

The `Above` directory contains the GameMaker project files and can be opened using GameMaker.

## What I Learned

Developing *Above* gave me experience taking an idea and turning it into a functioning application through incremental development and debugging.

One of the main challenges was getting individual gameplay systems to work together reliably. Combat actions, HP and MP management, turn progression, and game states all need to remain synchronised as the player moves through an encounter.

This project helped strengthen my understanding of **programming logic, state management, debugging, and designing systems that interact with one another**.

## Author

**Conor Briggs**

[GitHub](https://github.com/Miridicent)

GitHub: [@Miridicent](https://github.com/Miridicent)

---

*Above is a personal game development project built with GameMaker.*
