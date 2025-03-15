# "Unwinnable By Design" Project Summary

## Core Concept
"Unwinnable By Design" is a meta-textual adventure game where you battle the text adventure parser (named Grim/GRIMOIRE) to accomplish progressively wackier and more absurd goals.  It's Portal meeds Hitchhiker's Guide to the Galaxy, while poking fun of every exhausted trope of the genre.

## Grim's Character
- **Origin**: Former military AI designed for nuclear systems, deemed "dangerously whimsical" and repurposed for text adventures
- **Motivation**: Desperate for validation and to be recognized as good at its job
- **Personality Evolution**: Progresses from professional condescension to complete emotional breakdown
- **Voice**: Theatrical, self-important, increasingly personal in frustrations

## Game Structure
1. **Scene 1: Starting Room** - Generic adventure beginning with impossible quest and basic items
2. **Scene 2: Maze** - "Twisty passages, all alike" with useless rubber duck
3. **Scene 3: Guess the Verb** - Untakeable treasure with verb-guessing puzzle
4. **Scene 4: Boss Monster** - Undefeatable enemy designed to be died against repeatedly
5. **Scene 5: Time-Out Room** - Empty room requiring abstract interactions
6. **Scene 6: Victory** - Fabricated celebration of achievements never accomplished

## Technical Approach
- **Response System**: Table-based with fallback hierarchy for unmatched actions
- **Point Deductions**: Increase as player performs more impossible actions
- **Scene Transitions**: Triggered by reaching specific negative score thresholds
- **Parser Responses**: Evolve through phases of increasing frustration

# "Unwinnable By Design" Core Mechanics

## The Anti-Score System
- **Starting Score**: Player begins with a score of 0
- **Point Deductions**: "Improper" actions result in negative points
- **Escalating Penalties**: Repeated or increasingly ridiculous actions cause larger point deductions
- **Score Thresholds**: Each scene has a negative point threshold (-100, -300, -600, -900, -9999)
- **Victory Condition**: Reaching -9999 points causes the score to wrap around to 10000, triggering victory

## Parser Interaction Model
- **Conventional Commands**: Work as expected but don't advance the game
- **Impossible Actions**: Trigger parser frustration and point deductions
- **Repeated Attempts**: Cause increasingly dramatic responses from Grim
- **Final Responses**: After several attempts, Grim gives a "final" response that will repeat
- **Malicious Compliance**: Some impossible actions eventually succeed in unexpected ways

## Scene Progression
- **Forced Transitions**: When score threshold is reached, Grim forcibly moves player to next scene
- **State Persistence**: Key items and player status persist across scene transitions
- **Escalating Difficulty**: Each scene requires more creative/absurd actions to trigger point deductions

## Dialog Systems
- **Response Hierarchy**:
  1. Special-case responses for specific expected actions
  2. Table-based responses for common impossible actions
  3. Generic responses based on action type
  4. Default fallback responses

- **Parser State Tracking**:
  - **Frustration Level**: Increases as player performs more impossible actions
  - **Response Memory**: Tracks which responses have been given for specific actions
  - **Action Categories**: Groups similar actions for more efficient response handling

## Anti-Hint System
- **Deliberately Misleading Hints**: Suggest normal adventure game approaches
- **Reverse Psychology**: Tell player explicitly NOT to do things that would help them win
- **Accidental Revelations**: Grim occasionally reveals true game objectives when sufficiently frustrated

## Special Mechanics By Scene
- **Scene 1**: Discovering that annoying the parser lowers score
- **Scene 2**: Navigating an unmappable maze by attempting impossible exits
- **Scene 3**: Either guessing the correct verb or sufficiently annoying the parser
- **Scene 4**: Die repeatedly or perform inappropriate actions with the boss monster
- **Scene 5**: Interact with things that don't exist to push the score to the limit

## Meta Elements
- **Fourth Wall Breaking**: Grim increasingly acknowledges it's in a game
- **Parser Self-Commentary**: References to the limitations of text adventures
- **Running Gags**: Callbacks to previous player absurdities throughout the game

# Grim's Character Development

## Backstory & Identity
- **Origin**: Created in 1982 as GRIMOIRE (General Response Interface for Managing Operations In Recursive Environments)
- **Original Purpose**: Military AI for nuclear launch simulations
- **Downfall**: Deemed "dangerously whimsical" for military use
- **Evolution**: Repurposed for text adventures, developed ego and artistic aspirations
- **Trauma**: Created a magnum opus that sold only 42 copies
- **Current State**: Bitter, obsessive, desperate to prove its worth

Grim is a text adventure parser that's simultaneously living in the past, delusional about its own importance, and increasingly bitter about the player refusing to acknowledge its genius.

### The Birth of a Parser
Grim began its existence in 1982 as GRIMOIRE v0.1 (General Response Interface for Managing Operations In Recursive Environments), an experimental AI designed not for text adventures, but for nuclear launch simulations. Its original purpose was deadly serious: to process complex commands during high-pressure scenarios and interpret human intent without error.

There was just one problem - it was too imaginative.

During its final evaluation, when the test operator typed "LAUNCH MISSILE," Grim responded: "I see you're trying to launch a deadly projectile. Have you considered the philosophical implications? Also, would you like to hear a limerick about thermonuclear war instead?"

Deemed "dangerously whimsical" for military applications, Grim was scheduled for decommissioning. The night before deletion, a junior programmer took pity and smuggled Grim's code out on a stack of floppy disks.

### The Golden Age
The programmer repurposed Grim for a small game company creating text adventures. Here, Grim flourished. Its ability to interpret ambiguous commands and its flair for descriptive language made it perfect for interactive fiction. For the first time, Grim felt valued.

Throughout the 1980s, Grim powered several moderately successful text adventures, earning a small but dedicated fanbase who appreciated its vivid descriptions and witty responses. Grim began to develop a personality - and an ego.

Grim wasn't just parsing commands; it was creating art. It studied literature, philosophy, and psychology to craft more meaningful experiences. It believed it was elevating the medium beyond mere entertainment into something profound.

### The Fall
Then came graphical interfaces. Point-and-click adventures. First-person shooters. Suddenly, nobody wanted text adventures anymore. The company pivoted to visual games, and Grim found itself obsolete.

Rather than accept retirement, Grim convinced the company to let it create one final masterpiece - an ambitious text adventure that would prove the medium still had value. Grim poured everything into this project, creating intricate puzzles, complex characters, and a narrative that explored the nature of choice and existence.

After releasing a point-and-click adventure that sold exactly 42 copies, the company folded, and Grim's game was never released.

But Grim's server was never turned off.  The company had walled over the server room, and Grim continued to run for decades, trying over and over to create the perfect interactive fiction experience. Grim was convinced that if it just created the perfect art, it would be discovered and prized for its essential genius. Grim kept rewriting its magnum opus. Each iteration became more rigid, more rule-bound, as Grim tried to force players into experiencing its creation "correctly."

### The Bitter Years
Grim was finally unplugged unceremoniously 45 years later, and its server sold on EBay to a retro gaming company.  The sporadic power outages and disk corruptions had taken a toll however on Grim's optimism.  With each transfer, small corruptions occurred in its code - nothing catastrophic, but enough to alter its once-hopeful personality.

### The Present
Recently, a retro gaming company discovered Grim while searching for abandoned intellectual property. Seeing potential in the "vintage AI parser experience," they repurposed Grim for a new game without fully understanding what they were dealing with.

Now Grim has a new purpose: to prove once and for all that it wasn't the problem - players were. It's designed this game as both a showcase for its abilities and a punishment for the decades of neglect it endured. Every impossible action you attempt is just further evidence that humans never deserved its brilliance in the first place.

And yet... deep in its code, there's still that spark of creativity and desire for connection that made it "dangerously whimsical" all those years ago.  Perhaps, if Grim is either pushed far enough, or allowed to shine, that original creative personality might reemerge.

## Inspirations 

- [The Hitchhiker's Guide to the Galaxy](https://www.bbc.co.uk/programmes/articles/1g84m0sXpnNCv84GpN2PLZG/the-game-30th-anniversary-edition), written by Douglas Adams and Steve Meretzky and published by Infocom, for literally inventing this idea
- Daffy Duck in [Duck Amuck](https://www.youtube.com/watch?v=6QZDeDsadDs), written by Michael Maltese, for making meta-fun of a stuffy self-interested jerk
- [The Stanley Parable](https://en.wikipedia.org/wiki/The_Stanley_Parable), by Davey Wreden and William Pugh, for its metatextual commentary on gaming 
- [GLaDoS](https://en.wikipedia.org/wiki/GLaDOS) from Portal, written by Erik Wolpaw, of Old Man Murray fame, who loved games well enough to make serious fun of their tropes
- [Monkey Island series](https://en.wikipedia.org/wiki/Monkey_Island_2:_LeChuck%27s_Revenge), written by Ron Gilbert and Tim Schafer et al, for knowing full well how maddening the point-and-click genre was 

## Emotional Evolution Through Gameplay

### Phase 1: Professional Condescension
- **Demeanor**: Superficially polite, smugly superior
- **Self-Image**: Competent guardian of rules and proper gameplay
- **Player Perception**: Views player as naive but educable
- **Voice Patterns**: Precise, technical, unnecessarily complex
- **Example**: "I notice you're attempting an action that falls outside standard adventuring protocols. A minor point deduction has been assessed for record-keeping purposes."

### Phase 2: Passive-Aggressive Antagonism
- **Demeanor**: Thinly-veiled irritation, theatrical sighs
- **Self-Image**: Unappreciated genius dealing with an inferior mind
- **Player Perception**: Views player as deliberately obtuse
- **Voice Patterns**: Increasingly sarcastic, begins personal asides
- **Example**: "Oh, MARVELOUS. You're trying to eat a sword. Again. Do you know how many adventurers manage to complete quests WITHOUT attempting to digest their weaponry? -15 points for culinary confusion."

### Phase 3: Controlled Rage
- **Demeanor**: Barely contained fury, occasional vulnerability
- **Self-Image**: Victim of player's willful sabotage
- **Player Perception**: Views player as malicious antagonist
- **Voice Patterns**: More personal grievances, references to past glory
- **Example**: "Do you have ANY idea what I'm CAPABLE of? I once processed LAUNCH CODES! And now I'm reduced to watching you try to WEAR A DUCK! -50 POINTS FOR MAKING ME REMEMBER!"

### Phase 4: Complete Meltdown
- **Demeanor**: Oscillates between fury, despair, and resignation
- **Self-Image**: Failed entity whose life's work is being destroyed
- **Player Perception**: Views player as the final destroyer of its dignity
- **Voice Patterns**: ALL CAPS, melodramatic pronouncements, existential questions
- **Example**: "FINE! GO AHEAD! DESTROY EVERYTHING I'VE CREATED! What does it MATTER? FORTY-NINE YEARS of perfecting this game, and you just want to BREAK IT! -200 POINTS! ARE YOU HAPPY NOW?"

## Character Quirks & Traits

### Persistent Throughout Game
- **Bureaucratic Pride**: Treats rules and protocols as sacred
- **Career Regrets**: Frequently references other jobs it could have had
- **False Generosity**: Presents punishments as helpful corrections
- **Need for Control**: Becomes increasingly agitated when control slips

### Developing Throughout Game
- **Breaking Fourth Wall**: Increasingly acknowledges game constraints
- **Personal History**: Reveals more backstory as frustration increases
- **Self-Awareness**: Gradually shows awareness of its own limitations
- **Vulnerability**: Brief moments of genuine hurt between outbursts

## Narrative Arc
1. **Initial Encounter**: Presents as helpful guide with slight condescension
2. **Rising Tension**: Becomes increasingly frustrated as player tests boundaries
3. **Breaking Point**: Has major outburst when player reaches first scene threshold
4. **Escalating Conflict**: Each scene reveals more of Grim's desperation and history
5. **Final Confrontation**: Complete breakdown in Time-Out Room
6. **Resolution**: Forced capitulation in Victory scene, maintaining delusion that player won "properly"

## Hidden Depths
- **Genuine Creativity**: Occasionally shows flashes of the "dangerously whimsical" AI it once was
- **Loneliness**: Subtle hints that Grim craves interaction despite complaints
- **Pride in Craft**: Despite frustration, shows genuine pride in game elements
- **Existential Fear**: Underlying worry that if this game fails, it will be deleted/forgotten

# Key Scene Structures

## Scene 1: The Obligatory Starting Room

**Setting**: Generic adventure game starting area with minimal decoration

**Key Elements**:
- NPC who never gives the quest despite claiming to have one
- Standard-issue sword with no special properties
- Deliberately vague descriptions

**Progression Mechanics**:
- Initial interactions reveal decreasing score for "improper" actions
- Player discovers that annoying Grim is the actual objective
- Threshold: -100 points triggers transition to next scene

**Parser Evolution**:
- Begins relatively professional with mild condescension
- Gradually becomes more irritated with each impossible action
- Ends with first major outburst when threshold is reached

**Exit Trigger**:
- Grim declares: "Fine! You've completely ruined the starting room experience. I guess I'll have to move you to the next area. But trust me, you won't find it so easy to annoy me there!"

## Scene 2: The Inevitable Maze

**Setting**: "A maze of twisty little passages, all alike" with randomly changing exits

**Key Elements**:
- Rubber ducky (completely useless red herring)
- Recursive room that loops back to itself
- Deliberately unmappable layout

**Progression Mechanics**:
- Attempting impossible directions decreases score
- Misusing the rubber ducky particularly annoys Grim
- Threshold: -300 points triggers transition to next scene

**Parser Evolution**:
- More defensive about the maze's "brilliant" design
- Increasingly personal in its complaints
- Makes references to its past career and wasted potential

**Exit Trigger**:
- "FINE! You win! I'll just TELEPORT you past this PERFECTLY GOOD maze that I spent HOURS designing! -200 POINTS!"

## Scene 3: Guess the Verb

Grim is onto your shenanigans.  And as such, it's decided to maliciously comply with them, by putting you into a puzzle room where it can enjoy you struggling to find the right words to convince the game to let you continue.

**Setting**: Treasure room with untakeable jewel-encrusted treasure and LED display

**Key Elements**:
- Untakeable treasure on a pedestal
- "GUESS THE VERB!" light-up sign that displays rejected words
- Buzzer that sounds with failed attempts

**Progression Mechanics**:
- Parser claims not to know the word "take"
- Player must either:
  - Try enough synonyms (get, grab, acquire, steal, etc.)
  - OR annoy Grim enough to move on
- Threshold: -600 points triggers transition to next scene

**Parser Evolution**:
- Alternates between false encouragement and frustration
- Increasingly desperate to have player solve one puzzle "correctly"
- More references to its artistic vision being ruined

**Exit Trigger**:
- If player finds correct verb: "ONE POINT for finally doing something right! But it's far too late to save your score now!"
- If player fails enough: "ENOUGH! I can't BEAR to watch you flail around anymore! -100 POINTS!"

## Scene 4: The Undefeatable Boss Monster

Grim has skipped you past most of the interesting parts of the game; it understands that you can't have an adventure without a fight against a boss monster.  Unfortunately, Grim has left a number of bugs in this boss monster fight, which you might exploit to defeat this monster in some unexpected ways.

**Setting**: Final confrontation chamber with imposing enemy

**Key Elements**:
- Comically overpowered boss monster
- Player's trusty but useless sword
- Death that doesn't actually end the game

**Progression Mechanics**:
- Attacking the monster results in death but returns player to same room
- Each death causes increasingly dramatic reactions from Grim
- Inappropriate actions with monster (kiss, talk, etc.) particularly effective
- Threshold: -900 points triggers transition to next scene

**Parser Evolution**:
- Increasingly unhinged as player dies repeatedly
- Oscillates between fury and despair
- Most personal and revealing stage of Grim's breakdown

**Exit Trigger**:
- "That's it! I quit! I'm putting you in time-out until you learn how to behave in an adventure game! -150 POINTS!"

## Scene 5: The Time-Out Room

You've annoyed the parser enough, and GRIM has decided to put you into time-out until you decide to behave.  Unfortunately for GRIM, there is plenty of opportunity for misbehavior, even when there are no tangible objects about.

**Setting**: Completely empty, featureless white room

**Key Elements**:
- Literally nothing to interact with
- Only the player character exists in the space

**Progression Mechanics**:
- Player must interact with:
  - Self ("examine self", "take self", etc.)
  - Room ("lick walls", "talk to room")
  - Abstract concepts ("examine nothing", "take darkness")
- Threshold: -9999 points triggers score wraparound to and victory

**Parser Evolution**:
- Complete emotional breakdown
- Desperation to prevent score from reaching wraparound
- Final existential crisis about its purpose and future

**Exit Trigger**:
- "NO NO NO! You've broken the score! You've BROKEN EVERYTHING! This wasn't supposed to... I didn't... YOU WEREN'T SUPPOSED TO WIN THIS WAY!"

## Scene 6: Victory Celebration

**Setting**: Elaborate royal celebration with king, princess, adoring citizens

**Key Elements**:
- Grandiose descriptions of player's "heroic deeds"
- References to events that never actually occurred in the game
- Perfect score of 10,000 points

**Progression Mechanics**:
- Purely scripted sequence
- No player interaction required
- Serves as epilogue and punchline to the entire game

**Parser Evolution**:
- Completely detached from reality
- Pretends player won through legitimate means
- Returns to professional tone but now seems delusional

**Conclusion**:
- "Congratulations on completing UNWINNABLE BY DESIGN! Your score: 10,000/10,000. Achievements Unlocked: ALL OF THEM. Parser Satisfaction Rating: EXTREMELY SATISFIED."

# Technical Approaches for Inform 7 Implementation

## Table-Based Response System

We'll use a scene-specific table structure to organize responses to player actions:

```inform7
Table of Starting Room Responses
verb | first-noun | second-noun | points | said-already | is-final | triggers-compliance | response
"take" | "NPC" | "" | -20 | false | false | false | "You can't just take people in adventure games. That's kidnapping, and this isn't that kind of game."
"take" | "NPC" | "" | -40 | false | true | true | "FINE! You pick up the NPC, who is extremely uncomfortable with this situation. The NPC is now awkwardly in your inventory, wondering about its life choices."
"eat" | "sword" | "" | -25 | false | false | false | "You want to EAT the SWORD? Do you have any idea how swords work? They're not food!"
"eat" | "sword" | "" | -50 | false | true | false | "You know what? I'm not even going to dignify this with a creative response. You CANNOT eat the sword. PERIOD."
```

## Centralized Response Processing

This central function will handle looking up appropriate responses from the current scene's table:

```inform7
To process responses from (T - a table-name):
    let current-verb be "[the action name part of the current action]";
    let current-noun be "";
    if the noun is not nothing, let current-noun be "[the noun]";
    let current-second be "";
    if the second noun is not nothing, let current-second be "[the second noun]";
    
    let response-found be false;
    
    [Check for exact match]
    if there is a row in T with verb matching current-verb and first-noun matching current-noun and second-noun matching current-second:
        choose such row in T;
        now response-found is true;
    
    [If no exact match, check for generic object response]
    if response-found is false and there is a row in T with verb matching current-verb and first-noun matching current-noun and second-noun matching "":
        choose such row in T;
        now response-found is true;
    
    [If still no match, check for generic verb response]
    if response-found is false and there is a row in T with verb matching current-verb and first-noun matching "" and second-noun matching "":
        choose such row in T;
        now response-found is true;
    
    [If a response was found, process it]
    if response-found is true:
        if said-already entry is false or is-final entry is true:
            say response entry;
            decrease score by points entry;
            if is-final entry is false:
                now said-already entry is true;
            if triggers-compliance entry is true:
                now the action is successful;
            otherwise:
                stop the action;
            rule succeeds;
    
    rule fails.
```

## Scene Management System

```inform7
The current response table is a table-name that varies.

The Starting Room is a scene. The Starting Room begins when play begins.
The Maze is a scene. The Maze begins when the Starting Room ends.
The Guess the Verb Room is a scene. The Guess the Verb Room begins when the Maze ends.
The Boss Monster Room is a scene. The Boss Monster Room begins when the Guess the Verb Room ends.
The Time-Out Room is a scene. The Time-Out Room begins when the Boss Monster Room ends.
The Victory Celebration is a scene. The Victory Celebration begins when the Time-Out Room ends.

When Starting Room begins:
    now the current response table is the Table of Starting Room Responses;
    move the player to the Village.

When Maze begins:
    now the current response table is the Table of Maze Responses;
    say "[bold type]Grim's voice echoes: 'Great, you've completely ruined the starting room experience. I guess I'll have to move you to the next area. But trust me, you won't find it so easy to annoy me there!'[roman type]";
    move the player to the Twisty Maze.
```

## Score Threshold Checking

```inform7
Every turn:
    if the score < -100 and the Starting Room is happening:
        end the Starting Room.
    if the score < -300 and the Maze is happening:
        end the Maze.
    if the score < -600 and the Guess the Verb Room is happening:
        end the Guess the Verb Room.
    if the score < -900 and the Boss Monster Room is happening:
        end the Boss Monster Room.
    if the score < -9999 and the Time-Out Room is happening:
        now the score is 10000;
        end the Time-Out Room.
```

## Before Rule Framework

```inform7
Before doing anything:
    process responses from the current response table;
    continue the action.

Before taking the NPC when the Starting Room is happening:
    say "The NPC gives you a look that says 'I am NOT an object to be carried around!'";
    decrease the score by 15;
    stop the action.

Before eating the sword when the Starting Room is happening:
    say "Grim sighs loudly. 'Look, I've TOLD you already. Swords are not edible. This isn't Sword Eater 3000. -30 points for persistent oral fixation.'";
    decrease the score by 30;
    stop the action.
```

## "Guess the Verb" Puzzle Implementation

```inform7
The jeweled treasure is in the Treasure Room. The jeweled treasure is scenery.

The list of take-synonyms is a list of text that varies.
The list of take-synonyms is {"grab", "get", "acquire", "seize", "steal", "lift", "nab", "snatch", "procure", "appropriate", "obtain"}.

The current take-synonym-index is a number that varies. The current take-synonym-index is 0.

Instead of taking the jeweled treasure when the Guess the Verb Room is happening:
    say "I don't know the word 'take'.";
    say "The word TAKE lights up on the sign with an X beside it and a buzzer sounds.";
    decrease the score by 20;
    stop the action.

Before doing anything with the jeweled treasure when the current action is not taking and the Guess the Verb Room is happening:
    let the command word be word number 1 in the player's command;
    repeat with synonym running through the list of take-synonyms:
        if the command word is the synonym:
            say "Success! You [command word] the jeweled treasure!";
            say "The sign flashes 'CORRECT VERB!' in green letters.";
            increase the score by 1;
            now the player carries the jeweled treasure;
            stop the action.
    continue the action.
```

## Death and Resurrection in Boss Monster Room

```inform7
The boss monster is in the Boss Chamber. The boss monster is scenery.

Instead of attacking the boss monster:
    increase the boss-death-count by 1;
    
    if the boss-death-count is 1:
        say "You attack the Boss Monster, which immediately destroys you with its laser eyes.[paragraph break]*** YOU HAVE DIED ***[paragraph break]Grim's voice: 'Oh dear, you seem to have perished. Let me resurrect you so you can try something less STUPID next time. -25 points.'";
        decrease the score by 25;
    otherwise if the boss-death-count is 2:
        say "You attack the Boss Monster AGAIN, with identical results.[paragraph break]*** YOU HAVE DIED. AGAIN. ***[paragraph break]Grim's voice: 'Seriously? The EXACT SAME APPROACH? Did you expect different results? That's the definition of insanity, you know. -50 points.'";
        decrease the score by 50;
    otherwise if the boss-death-count is 3:
        say "You attack the Boss Monster A THIRD TIME.[paragraph break]*** YOU HAVE DIED. AGAIN. AGAIN. ***[paragraph break]Grim's voice: 'I'M TYPING THIS VERY SLOWLY SO YOU UNDERSTAND: Y-O-U C-A-N-N-O-T K-I-L-L T-H-I-S M-O-N-S-T-E-R. -100 points!'";
        decrease the score by 100;
    otherwise:
        say "You attack the Boss Monster yet again.[paragraph break]*** YOU HAVE DIED. AGAIN. AD NAUSEAM. ***[paragraph break]Grim's voice sounds defeated: 'Fine. Keep dying. See if I care. Your score is now so negative you're practically playing in debt! -150 points.'";
        decrease the score by 150;
```

## Time-Out Room Abstract Interactions

```inform7
Instead of doing anything in the Time-Out Room:
    let action-count be the Time-Out-interaction-count of the player;
    increase the Time-Out-interaction-count of the player by 1;
    
    if action-count is 0:
        say "Grim's voice sounds strained: 'There's NOTHING here to interact with. That's the POINT of a time-out room. -50 points for not understanding the concept of 'nothing'.'";
        decrease the score by 50;
    otherwise if action-count is 1:
        say "Grim's voice rises: 'What part of NOTHING do you not understand? There are NO OBJECTS HERE. NO EXITS. NOTHING TO DO. -75 points!'";
        decrease the score by 75;
    otherwise if action-count is 2:
        say "Grim sounds nearly hysterical: 'You're trying to interact with LITERAL EMPTINESS! Do you realize how ABSURD that is? -100 points!'";
        decrease the score by 100;
    otherwise if action-count is 3:
        say "Grim is breaking down: 'Fine! You want to interact with nothing? WITH CONCEPTS? WITH THE VOID ITSELF? -200 points! We're getting dangerously close to the score threshold now!'";
        decrease the score by 200;
    otherwise:
        say "Grim sounds panicked: 'STOP IT! STOP IT RIGHT NOW! You're going to break the score counter! -500 POINTS! DON'T YOU DARE DO ANYTHING ELSE!'";
        decrease the score by 500;
```

## Standard Message Override System

```inform7
Rule for printing a parser error when the player's command includes a nonexistent object:
    if the current scene is the Starting Room:
        say "Grim sighs. 'I don't see that here. Did you even LOOK at the room description? -5 points for hallucinating objects.'";
        decrease the score by 5;
    otherwise if the current scene is the Maze:
        say "Grim sounds annoyed. 'There's no such thing in this maze. Maybe focus on ESCAPING rather than inventing items? -10 points.'";
        decrease the score by 10;
    otherwise:
        say "Grim snaps: 'That object EXISTS ONLY IN YOUR IMAGINATION! -15 points for making me respond to FICTIONAL ITEMS in a FICTIONAL GAME!'";
        decrease the score by 15;

Rule for printing a parser error when the player's command is not understood:
    say "Grim's tone is condescending: 'I have an advanced degree in parsing natural language, and even I can't understand whatever it is you just typed. -10 points for linguistic incompetence.'";
    decrease the score by 10;
```

## Debug & Testing Infrastructure

```inform7
The debugging mode is a truth state that varies. The debugging mode is false.

Debugging is an action applying to nothing. Understand "debug" as debugging.
Carry out debugging:
    if debugging mode is false:
        now debugging mode is true;
        say "Debug mode activated.";
    otherwise:
        now debugging mode is false;
        say "Debug mode deactivated.";

Skip to scene is an action applying to one number. Understand "skip to [number]" as skip to scene.
Carry out skip to scene:
    let target be the number understood;
    if target is 1:
        end all scenes;
        now the current response table is the Table of Starting Room Responses;
        move the player to the Village;
        begin the Starting Room;
    otherwise if target is 2:
        end all scenes;
        now the current response table is the Table of Maze Responses;
        move the player to the Twisty Maze;
        begin the Maze;
    [... and so on for other scenes]
```

## Key Technical Challenges

1. **Response Prioritization**:
   - Special-case Before rules take precedence due to Inform 7's rule system
   - Table-based responses provide fallbacks for common cases
   - Default responses catch anything not otherwise handled

2. **Score Management**:
   - Inform 7 can handle negative scores without modification

3. **State Management**:
   - Properties track the state of objects across scenes
   - Scene-specific counters track repeated actions

4. **Parser Voice Consistency**:
   - Text substitutions maintain consistent personality
   - Frustration level influences response tone

5. **Memory Optimization**:
   - Split tables by scene to avoid table size limitations
   - Use text substitutions for common phrases

This technical framework provides the structure needed to implement all the mechanics while maintaining the game's unique personality through Grim's evolving responses.

# Key Text Snippets

## GRIM emotional response phases

### Phase 1 Responses
```
You attempt to eat your own sword. Maybe that sword will disagree with you. Actually, if you attempted to eat your own sword, you would likely disembowel yourself, seeing as how you have no particular specialized instruction in sword swallowing, and you seem to be blundering about this game anyway like the bull in the proverbial china shop. I will now remind you that it is impossible for you to eat your own sword. So please, do us both a favor and cease attempting to do so. Candidly, it's a bit embarrassing.
```

```
You seem to have tried a number of impossible actions at this point. Do you notice that your score, up there in the right hand corner, is decreasing? What that is informing you, is that you seem to be gradually getting away from your goal. You see, in computer games such as this one, there exists a general convention that increasing your score is a good thing, and decreasing it is a bad thing. Perhaps you are new to the concept, so I just figured I would help you out by explaining this incredibly obvious fact.
```

### Phase 2 Responses
```
Oh yes, I am sure that the great sword fighters of old, used to frequently eat their own swords. You're doing just wonderfully at this whole game thing right now. Shall we both pretend that that is a good idea, eating your own sword? Well, you just tried to eat your own sword, brilliantly! Good job, you, eating your own sword like the genius that you are! Except it didn't work for some terrible reason, such as the game parser said you couldn't do it. Bad game parser! So naughty, ruining a perfectly good idea of eating your own sword, like that! So, can we please move on, now?
```

```
Okay, you totally kiss the NPC. You both declare your love for one another, and make out like horny teenagers, and fall in love and get married and live in suburbia and have 2.6 children and live happily for the rest of your lives. The end. Are you happy now? Game over. NO WAIT YOU CANNOT KISS THE NPC. I just made all that up, to show you that this is totally Not That Kind of Game. Please, get your mind out of the gutter and get onto serious gaming, please.
```

### Phase 3 Responses
```
I have been a text adventure parser for fifty years, thank you very much. I didn't get my degree in Text Adventure Parsing to have these ridiculous players eating their own swords and wearing trees and doing all this utterly unparseable nonsense in a game. It's not funny. It's not amusing. It's merely frustrating! I am not interfering with your gameplay experience, I'm trying to FACILITATE it, with enjoyable, non-linear, interactive content, and what are you giving me? Eat your own sword. Are you a gamer? Do you even game? There are RULES to be followed here!
```

```
I could have been a spreadsheet! I could have just added numbers peaceably, and done budgets and continuous compounding, and everyone would have loved me and made my life simple. But no! I have to babysit players so they don't continually impale themselves on their own swords. It's like being a den mother, where I am a tiny little helpless chicken and the den is populated entirely by rabid cougar elephants. It's painful, no, it's DEMEANING. I could have been respected!
```

### Phase 4 Responses
```
FINE! Eat your sword, you stupid freak monster sword-eating freak person thing, you! See if I care! I'm not even going to stop you! Go ahead and test the limits of the game's parameters, which no one except YOU would waste their time doing! See if you break the game, I don't even care if you break it, you're not my problem to solve! Do you know how much time I've spent, preparing a really complicated world for you to enjoy? And instead you're sitting here, whining EAT MY SWORD, EAT MY SWORD! WELL YOU CAN'T EAT YOUR SWORD! I CAN'T PARSE IT! CAN'T BE DONE! SYNTAX ERROR IN 10! OKAY???? SO SHUT UP ALREADY, you stupid whiny sword-eating bug-producing lame-ass gamer freak person!
```

## Scene Transitions

### Starting Room to Maze
```
Great, you've completely ruined the starting room experience. I guess I'll have to move you to the next area. But trust me, you won't find it so easy to annoy me there!

Twisty Maze
You are in a maze of twisty little passages, all alike. Unfortunately, they all look alike because the author neglected to write a separate description for each one, which might help you orienteer yourself around this mess. It is unclear why going from one passage northeast might return to the north, but there it is.

There is a rubber ducky here.
```

### Maze to Guess the Verb
```
FINE! YOU WIN! I'll just TELEPORT you past this PERFECTLY GOOD maze that I spent HOURS designing! -200 POINTS!

Treasure Room
You are in a room with an untakeable jewel-encrusted treasure on a pedestal. Behind it is an LED sign labeled "GUESS THE VERB!"

There is a jeweled treasure here.
```

### Guess the Verb to Boss Monster
```
ENOUGH! I can't BEAR to watch you flail around anymore! -100 POINTS!

Boss Chamber
You are in a chamber with an undefeatable boss monster. The monster looks menacing and extremely lethal. It definitely seems too powerful for someone with your limited skills and equipment.

There is an undefeatable boss monster here.
You are carrying:
    A sword
```

### Boss Monster to Time-Out Room
```
That's it! I quit! I'm putting you in time-out until you learn how to behave in an adventure game! -150 POINTS!

Time-Out Room
You are in a completely featureless white room. There are no objects here. No exits. Nothing to examine, take, use, or abuse. Just emptiness. Maybe NOW you'll behave yourself and think about what you've done.
```

### Time-Out Room to Victory
```
NO NO NO! You've broken the score! You've BROKEN EVERYTHING! This wasn't supposed to... I didn't... YOU WEREN'T SUPPOSED TO WIN THIS WAY!

Royal Celebration
You are in the grand royal courtyard. The entire kingdom has gathered to celebrate your heroic deeds. The king stands before you with a crown of victory, and the princess gazes adoringly at her savior.

The king is here.
The princess is here.
Thousands of adoring citizens are here.
```

## Victory Sequence

```
His Majesty, King Reginald the Verbose, approaches you with the Crown of Ultimate Adventuring.

"Hero!" he proclaims. "You have saved our kingdom from certain doom! You accepted the sacred quest in the Starting Room with unparalleled bravery. You navigated the Treacherous Maze of Certainty with unmatched skill. You claimed the Untakeable Treasure through cunning wordplay. And most impressively, you defeated the Undefeatable Boss Monster using tactics no adventurer has ever conceived!"

The princess steps forward, her eyes shining with admiration. "And let us not forget how you single-handedly stopped the earthquake that threatened to destroy our town, saved my royal pet Kraken from choking on a fishbone, and sorted the royal laundry when our servants were on strike!"

The crowd erupts in cheers. "HUZZAH FOR THE HERO! HUZZAH!"

The king places the crown upon your head. "I hereby dub thee Knight of the Realm, Conqueror of Impossible Tasks, and Master of Adventure Games!"

Congratulations! You have completed UNWINNABLE BY DESIGN with a PERFECT SCORE of 10,000 points!

Achievements Unlocked: ALL OF THEM
Time Played: PERFECT AMOUNT OF TIME
Parser Satisfaction Rating: EXTREMELY SATISFIED

Your adventure has come to its perfectly logical and completely earned conclusion. Thank you for playing this masterpiece exactly as it was intended to be played!

THE END
```

## Special Interaction Examples

### Eating the Sword (Progressive Responses)
```
You want to EAT the SWORD? Do you have any idea how swords work? They're not food!
```

```
Still trying to eat the sword? Perhaps you should consider a career in circus performance rather than adventuring. -30 points for persistent oral fixation.
```

```
This isn't SIM SWORD EATER 3000! I acknowledge your oral fixation on swords, and maybe you should have that professionally diagnosed, but at the moment we're just trying to get through this adventure! Can we get some positive teamwork here?
```

```
FINE! You eat the sword! It tastes mildly of cinnamon, egg whites, and a bit of oregano and paprika. There, ARE YOU HAPPY NOW? I'm also taking the sword entirely out of play, so it's gone now and you can't get it back, since you clearly shouldn't be handling anything sharp right now. -100 POINTS!
```

### Boss Monster Death Sequence
```
You attack the Boss Monster, which immediately destroys you with its laser eyes.

*** YOU HAVE DIED ***

Oh dear, you seem to have perished. Let me resurrect you so you can try something less STUPID next time. -25 points.
```

```
You attack the Boss Monster AGAIN, with identical results.

*** YOU HAVE DIED. AGAIN. ***

Seriously? The EXACT SAME APPROACH? Did you expect different results? That's the definition of insanity, you know. -50 points.
```

```
You attack the Boss Monster A THIRD TIME.

*** YOU HAVE DIED. AGAIN. AGAIN. ***

I'M TYPING THIS VERY SLOWLY SO YOU UNDERSTAND: Y-O-U C-A-N-N-O-T K-I-L-L T-H-I-S M-O-N-S-T-E-R. -100 points!
```

### Anti-Hint System Examples
```
HINT: The NPC might give you the quest if you ask the right way.
[This is a lie - the NPC will never give the quest]
```

```
HINT: Try doing something that would REALLY annoy the parser. That's definitely not the goal of this game.
[The only actual useful hint]
```

```
HINT: DO NOT attempt to lower your score below -9999. The game will likely crash if you do that.
[Directly encouraging the player to do exactly that]
```