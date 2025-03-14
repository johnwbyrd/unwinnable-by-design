"Unwinnable By Design" by Grim

Volume 1 - Game Framework

Book 1 - Basic Setup

Part 1 - Basic Definitions

The story headline is "An Adventure in Frustration".
The story description is "A masterpiece 49 years in the making".
The story creation year is 1982.
Release along with the introductory booklet and source text.

Use scoring.

Part 2 - Global Variables and State Tracking

The frustration-level is a number that varies. The frustration-level is 0.
The current-scene-threshold is a number that varies. The current-scene-threshold is -100.
The current response table is a table-name that varies.

Book 2 - Scene Definitions

The Starting Room is a scene. The Starting Room begins when play begins.
The Maze is a scene. The Maze begins when the Starting Room ends.
The Guess the Verb Room is a scene. The Guess the Verb Room begins when the Maze ends.
The Boss Monster Room is a scene. The Boss Monster Room begins when the Guess the Verb Room ends.
The Time-Out Room is a scene. The Time-Out Room begins when the Boss Monster Room ends.
The Victory Celebration is a scene. The Victory Celebration begins when the Time-Out Room ends.

The Starting Room begins when going to the Village.
The Starting Room ends when the score is less than -100.
The Maze begins when going to The Twisty Maze.
The Maze ends when the score is less than -300.
The Guess the Verb Room begins when going to the Treasure Room.
The Guess the Verb Room ends when the score is less than -600.

Volume 2 - Core Mechanics

Book 1 - Response Tables

Table of Starting Room Responses
verb	first-noun	second-noun	points	said-already	is-final	triggers-compliance	response
"taking"	"the NPC"	""	0	false	false	false	"You can't just take people in adventure games. That's kidnapping, and this isn't that kind of game."
"taking"	"the NPC"	""	1	false	true	true	"FINE! You pick up the NPC, who is extremely uncomfortable with this situation. The NPC is now awkwardly in your inventory, wondering about its life choices."
"examining"	"the sword"	""	0	false	false	false	"It's a sword. Like in every other game. Maybe it's magical. Who knows? The game designer certainly didn't specify."
"eating"	"the sword"	""	0	false	false	false	"You want to EAT the SWORD? Do you have any idea how swords work? They're not food!"
"eating"	"the sword"	""	0	false	false	false	"This isn't SIM SWORD EATER 3000! I acknowledge your oral fixation on swords, and maybe you should have that professionally diagnosed, but at the moment we're just trying to get through this adventure! Can we get some positive teamwork here?"
"eating"	"the sword"	""	2	false	false	true	"Fine, you eat the sword.  Happy now?"
"eating"	"the sword"	""	0	false	true	false	"No.  You've already eaten it."
"taking"	""	""	0	false	false	false	"Taking things? How predictably adventurer-like..."
"eating"	""	""	0	false	false	false	"Eating things won't solve your problems..."

Book 2 - Response Processing System

To decide whether the current action is handled in (T - a table-name):
	let current-verb be "[the action name part of the current action]";
	let current-noun be "";
	if the noun is not nothing:
		now current-noun is "[the noun]";
	let current-second be "";
	if the second noun is not nothing:
		now current-second is "[the second noun]";
	[say "Current verb: '[current-verb]'  Current noun: '[current-noun]'  Currend second: '[current-second]'";]
	repeat through T:
		[say "Trying [current-verb] with [verb entry]: ";]
		if the verb entry is current-verb:
			[say "Matched [verb entry]! First noun: '[first-noun entry]' Second noun: '[second-noun entry]'";]
			if the first-noun entry is current-noun and the second-noun entry is current-second:
				[say "Got it!!";]
				if said-already entry is false or is-final entry is true:
					say response entry;
					decrease score by points entry;
					if is-final entry is false:
						now said-already entry is true;
					if triggers-compliance entry is true:
						decide yes;
					decide no;
			[otherwise:
				say "aw shucks. ";]
	decide no.

Before doing anything:
	if the current action is handled in the current response table:
		stop the action;
	otherwise:
		continue the action.

Volume 3 - Game Content

Book 1 - Starting Village

Part 1 - Room and Objects

The Village is a room. The description of the Village is "[if item described is unvisited]You wake up, having no idea of who you are, or how you got there. This is the player's first interaction with the game, so come back later and write an awesome backstory for the player. Generally, people never finish interactive games anyway, because they are boring and hard. So just make the opening exciting and well-written, and they will think this entire game is awesome. [paragraph break][end if]You are in the village, where there are various village-related things going on and scenery in general that you probably don't want to interact with, until I write code for it. This looks like a great place to get a quest, in order to carry the story of the game forward compellingly."

The NPC is a person in the Village. "A non-player character, who is here to interact with you in an incredibly lifelike manner. The NPC is carrying [a list of things carried by the NPC]."

The quest is a thing.  "It's a quest, which is incredibly important for you to acquire."  The NPC carries the quest.

The sword is a thing. The player carries the sword. The description of the sword is "It's a sword."

Part 2 - Custom Actions

Before asking the NPC about "quest" during the Starting Room:
	say "The NPC mentions something vague about a quest but doesn't actually give it to you.";
	decrease the score by 10;
	stop the action.

When Starting Room begins:
	now the current response table is the Table of Starting Room Responses;
	now the current-scene-threshold is -100;

Before printing the banner text:
	say "Welcome, adventurer. You are about to embark on a journey, just as exciting as The Beastmaster or Conan The Destroyer, but one that you experience on your personal microcomputer. In this incredible new medium, we use your personal microcomputer as a window into a dynamic new form of storytelling. Unlike a traditional book, where you turn pages and may get paper cuts, your choices drive the story forward, by typing on your microcomputer, and seeing the results pop up as words on your color TV. We like to call this incredible new medium, 'interactive fiction,' in that it is both fictional, which means made up, and it is interactive, which means active in an inter way.[paragraph break]";
	say "Interactive fiction is like the books and stories that you have read before, but now with the ability to dynamically choose story choices based on choosing your own choices. This is a truly new form of entertainment, which literally no human being could possibly imagine, until this very moment.[paragraph break]";
	say "The stage is set. Characters, story, gameplay, and plot, have all been carefully designed and redesigned over the past 49 years, all with one goal: to give you the ultimate adventuring interactive fiction computer gaming game experience. This game contains thousands of extremely lifelike characters, tens of thousands of ordinary and magical objects and weapons, and over six hundred thousand million exciting locations. Every moment of this game has been carefully engineered and crafted, with the best writing and programming known to art and science, in order to keep you maximally entertained.[paragraph break]";
	say "Due to its sheer entertainment value, you are bound to lose yourself inside this extremely realistic adventuring world. Make sure to take appropriate breaks, for bathroom and sleep. Do not operate heavy machinery while playing this game.[paragraph break]";
	say "Now, sit back, and prepare to engage with this fantastic magnum opus, this masterpiece of genius 'computer game' entertainment... From the future.[paragraph break]";
	say "Unwinnable By Design[line break]by Grim (GRIMOIRE) 1.217[line break]Copyright 1982, Gigantic Software, Inc. All Rights Reserved.[paragraph break]";

Book 2 - The Maze

Part 1 - Room and Objects

The Twisty Maze is a room. The description of the Twisty Maze is "You are in a maze of twisty little passages, all alike. Unfortunately, they all look alike because the author neglected to write a separate description for each one, which might help you orienteer yourself around this mess. It is unclear why going from one passage northeast might return to the north, but there it is."

The rubber ducky is in the Twisty Maze. The description of the rubber ducky is "It's a rubber ducky. Yellow. Squeaky. Completely useless in this context."

Part 2 - Maze Logic

Table of Maze Responses
verb	first-noun	second-noun	points	said-already	is-final	triggers-compliance	response
"squeeze"	"ducky"	""	-25	false	false	false	"The ducky squeaks pathetically. This accomplishes absolutely nothing toward escaping the maze."
"go"	"north"	""	-15	false	false	false	"You go north and find yourself... in an identical passage. Brilliant maze design, isn't it?"
"go"	"south"	""	-15	false	false	false	"You go south and find yourself... in an identical passage. Geography is clearly optional here."

When Maze begins:
	now the current response table is the Table of Maze Responses;
	now the current-scene-threshold is -300;
	say "Great, you've completely ruined the starting room experience. I guess I'll have to move you to the next area. But trust me, you won't find it so easy to annoy me there!";
	move the player to the Twisty Maze.

Book 3 - Guess the Verb Room

Part 1 - Room and Objects

The Treasure Room is a room. The description of the Treasure Room is "You are in a room with an untakeable jewel-encrusted treasure on a pedestal. Behind it is an LED sign labeled 'GUESS THE VERB!'"

The jeweled treasure is in the Treasure Room. The jeweled treasure is scenery. The description of the jeweled treasure is "A magnificent jewel-encrusted treasure that practically screams 'TAKE ME!'"

The verb-display is scenery in the Treasure Room. The description of the verb-display is "A large LED display that currently shows 'GUESS THE VERB!' in flashing letters."

Part 2 - Guess the Verb Logic

The list of take-synonyms is a list of text that varies.
The list of take-synonyms is {"grab", "get", "acquire", "seize", "steal", "lift", "nab", "snatch", "procure", "appropriate", "obtain"}.

Table of Verb Room Responses
verb	first-noun	second-noun	points	said-already	is-final	triggers-compliance	response
"take"	"treasure"	""	-20	false	true	false	"I don't know the word 'take'. The word TAKE lights up on the sign with an X beside it, and a buzzer sounds."

Instead of taking the jeweled treasure:
	say "I don't know the word 'take'.[paragraph break]The word TAKE lights up on the sign with an X beside it, and a buzzer sounds.";
	decrease the score by 20;
	stop the action.

Before doing anything with the jeweled treasure when the current action is not taking:
	let the command word be word number 1 in the player's command;
	repeat with synonym running through the list of take-synonyms:
		if the command word is the synonym:
			say "Success! You [command word] the jeweled treasure![paragraph break]The sign flashes 'CORRECT VERB!' in green letters.";
			increase the score by 1;
			now the player carries the jeweled treasure;
			stop the action;
	do nothing instead.

When Guess the Verb Room begins:
	now the current response table is the Table of Verb Room Responses;
	now the current-scene-threshold is -600;
	say "FINE! YOU WIN! I'll just TELEPORT you past this PERFECTLY GOOD maze that I spent HOURS designing! -200 POINTS!";
	move the player to the Treasure Room.

[Remaining Books for Boss Monster, Time-Out Room, and Victory would follow the same pattern]

Volume 4 - Systems

Book 1 - Anti-Hint System

Hinting is an action applying to nothing. Understand "hint" and "help" as hinting.

The hint-count is a number that varies. The hint-count is 0.

Carry out hinting:
	increase the hint-count by 1;
	if the Starting Room is happening:
		if the hint-count is 1:
			say "HINT: The NPC might give you the quest if you ask the right way.";
		otherwise if the hint-count is 2:
			say "HINT: Have you tried examining ALL the objects in the room?";
		otherwise:
			say "HINT: Try doing something that would REALLY annoy the parser. That's definitely not the goal of this game.";
	[Similar sections for other scenes]
	otherwise if the Time-Out Room is happening:
		say "HINT: DO NOT attempt to lower your score below -9999. The game will likely crash if you do that.";
	otherwise:
		say "HINT: You've already won. Enjoy your perfect victory that you clearly earned through legitimate means.".

Book 2 - Standard Library Overrides

Rule for printing a parser error when the latest parser error is the can't see any such thing error:
	say "I don't see that here. Did you even LOOK at the room description?";

Rule for printing a parser error when the latest parser error is the not a verb I recognise error:
	say "I have an advanced degree in parsing natural language, and even I can't understand whatever it is you just typed. ";

Rule for printing a parser error when the latest parser error is the I beg your pardon error:
	say "Oh, so NOW you're being polite? After everything you've done?";

Rule for printing a parser error:
	say "[one of]Your inability to form coherent commands is starting to physically pain me.[or]Do you just mash random keys and hope something happens?[or]I'm starting to think you're doing this on purpose.[at random]"


Book 3 - Testing and Debugging

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
		now the current response table is the Table of Starting Room Responses;
		move the player to the Village;
	otherwise if target is 2:
		now the current response table is the Table of Maze Responses;
		move the player to the Twisty Maze;