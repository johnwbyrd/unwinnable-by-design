# "Unwinnable By Design" Project Summary

## Core Concept
"Unwinnable By Design" is a meta-textual adventure game where you battle the text adventure parser (named Grim/GRIMOIRE) to accomplish progressively wackier and more absurd goals.  It's Portal meeds Hitchhiker's Guide to the Galaxy, while poking fun at every exhausted trope of the genre.

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

# Key Inspirations

- [The Hitchhiker's Guide to the Galaxy](https://www.bbc.co.uk/programmes/articles/1g84m0sXpnNCv84GpN2PLZG/the-game-30th-anniversary-edition), written by Douglas Adams and Steve Meretzky and published by Infocom, for literally inventing this idea
- Daffy Duck in [Duck Amuck](https://www.youtube.com/watch?v=6QZDeDsadDs), written by Michael Maltese, for making meta-fun of a stuffy self-interested jerk
- [The Stanley Parable](https://en.wikipedia.org/wiki/The_Stanley_Parable), by Davey Wreden and William Pugh, for its metatextual commentary on gaming
- [GLaDoS](https://en.wikipedia.org/wiki/GLaDOS) from Portal, written by Erik Wolpaw, of Old Man Murray fame, who loved games well enough to make serious fun of their tropes
- [Monkey Island series](https://en.wikipedia.org/wiki/Monkey_Island_2:_LeChuck%27s_Revenge), written by Ron Gilbert and Tim Schafer et al, for knowing full well how maddening the point-and-click genre was

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
