"Unwinnable By Design" by Grim

Volume 1 - Game Framework

Book 1 - Basic Setup

Part 1 - Masthead

The story headline is "An Adventuring Magnum Opus".
The story description is "The most challenging interactive fictional story ever created for the microcomputer".
The story creation year is 1982.
Release along with cover art ("Cover"), a website, an interpreter, the library card, the introductory postcard, the introductory booklet, and source text.

Include Extended Grammar by Aaron Reed.
Include Smarter Parser by Aaron Reed.
Include Adaptive Hints by Eric Eve.
[Include Neutral Standard Responses by Nathanael Nerode.]

Use scoring.

Part 2 - Global Variables

The current response table is a table-name that varies.

Deference is a kind of value.  The deferences are willful and malicious.
Compliance is a deference that varies.  The compliance is initially willful.

Already complained is a truth state that varies. Already complained is false.

Outcome is a kind of value. The outcomes are authorized, refused, and unmanaged.

Book 2 - Anarchy

["Truly, the only rules that exist are the ones that we impose upon ourselves."  -someone who is probably intelligent and dead]

Chapter 1 - Everything Is Legal

Persuasion rule for asking people to try doing something: persuasion succeeds.
The can't take other people rule is not listed in any rulebook.
The can't take people's possessions rule is not listed in any rulebook.
The block giving rule is not listed in any rulebook.
The can't eat unless edible rule is not listed in any rulebook.
The can't rub another person rule is not listed in any rulebook.
[The block burning rule is not listed in any rulebook.]

Chapter 2 - Life in the Age of Anarchy

[Carry out an actor burning (this is the carry out burning rule): now the noun is nowhere.
Report an actor burning (this is the report burning rule): say "[The actor] burns [the noun].".]
	
Book 3 - Scene Definitions

Get the Quest is a scene.  Get the Quest begins when play begins.
Solve the Maze is a scene. 
Guess the Verb is a scene. 
Kill the Boss is a scene.
Time Out is a scene. 
Victory Celebration is a scene.

Volume 2 - Core Mechanics

Book 1 - Common Response Processing System

Part 1 - At the Top of Every Command

[At the top of every command, we have to set the common variables to comfortable states.]
After reading a command:
	now already complained is false;
	now compliance is willful.

Part 2 - Generic Response Table Processing

[The main table processing logic.  Responsible for looking up the current command and trying to find a near match in whatever is the current response table for this scene.]
To decide which outcome is the response table outcome for (T - a table-name):
	if already complained is true:
		decide on unmanaged;
	let current-actor be "[the actor part of the current action]";
	let current-verb be "[the action name part of the current action]";
	let current-noun be "";
	if the noun is not nothing:
		now current-noun is "[the noun]";
	let current-second be "";
	if the second noun is not nothing:
		now current-second is "[the second noun]";
	aside "Actor: '[current-actor]' Verb: '[current-verb]' Noun: '[current-noun]' Second: '[current-second]'";
	repeat through T:
		if (the verb entry is current-verb or the verb entry is "") and
		   (the performer entry is current-actor or the performer entry is "") and
		   (the first-noun entry is current-noun) and
		   (the second-noun entry is current-second):
			aside "Got a match on: [verb entry]";
			if said-already entry is false or is-final entry is true:
				say "[response entry][line break]";
				decrease score by points entry;
				if is-final entry is false:
					now said-already entry is true;
				if triggers-compliance entry is true:
					now compliance is malicious;
					now already complained is true;
					decide on authorized;
				else:
					decide on refused;
	decide on unmanaged;

Part 3 - Interfere with Stupid Things

[This rule, which we insert into the normal rule order, allows us to stop processing those items that we have already complained about or otherwise dealt with in our table scheme.]
This is the interfere with stupid things rule:
	let current-outcome be the response table outcome for the current response table;
	if current-outcome is refused:
		aside "Refused!";
		stop the action;
	otherwise if current-outcome is authorized:
		aside "Authorized!";
		continue the action;
	otherwise: [if current-outcome is unmanaged:]
		aside "Unmanaged!";
		continue the action.
		
The interfere with stupid things rule is listed first in the action-processing rules.

Part 4 - Oh You So Crazy Inform, Why No "Report An Actor Doing Something"?

[This bit of repetitive silliness is because Inform doesn't allow us to create a "Report an actor doing something" rule.  In fact, the Standard Rules creates a "specific action-processing rules" section for pretty much every interesting thing you might want to do in the engine.]
Report an actor taking inventory when compliance is malicious: stop the action.
Report an actor taking something when compliance is malicious: stop the action.
Report an actor putting something on when compliance is malicious: stop the action.
Report an actor inserting something into something when compliance is malicious: stop the action.
Report an actor eating something when compliance is malicious: stop the action.
Report an actor going when compliance is malicious: stop the action.
Report an actor entering when compliance is malicious: stop the action.
Report an actor exiting when compliance is malicious: stop the action.
Report an actor getting off when compliance is malicious: stop the action.
Report an actor looking when compliance is malicious: stop the action.
Report an actor examining when compliance is malicious: stop the action.
Report an actor looking under when compliance is malicious: stop the action.
Report an actor searching when compliance is malicious: stop the action.
Report an actor consulting something about something when compliance is malicious: stop the action.
Report an actor locking something with when compliance is malicious: stop the action.
Report an actor switching on when compliance is malicious: stop the action.
Report an actor switching off when compliance is malicious: stop the action.
Report an actor opening when compliance is malicious: stop the action.
Report an actor closing when compliance is malicious: stop the action.
Report an actor wearing when compliance is malicious: stop the action.
Report an actor taking off when compliance is malicious: stop the action.
Report an actor giving something to when compliance is malicious: stop the action.
Report an actor answering something that when compliance is malicious: stop the action.
Report an actor telling something about when compliance is malicious: stop the action.
Report an actor asking something about when compliance is malicious: stop the action.
Report an actor waiting when compliance is malicious: stop the action.
Report an actor touching when compliance is malicious: stop the action.
Report an actor waving when compliance is malicious: stop the action.
Report an actor pulling when compliance is malicious: stop the action.
Report an actor pushing when compliance is malicious: stop the action.
Report an actor turning when compliance is malicious: stop the action.
Report an actor squeezing when compliance is malicious: stop the action.
Report an actor smelling when compliance is malicious: stop the action.
Report an actor listening to when compliance is malicious: stop the action.
Report an actor tasting when compliance is malicious: stop the action.
Report an actor jumping when compliance is malicious: stop the action.
Report an actor rubbing when compliance is malicious: stop the action.
Report an actor waving hands when compliance is malicious: stop the action.

Volume 3 - Game Content

Book 0 - In the Beginning

Before printing the banner text:
	say "Welcome, adventurer. You are about to embark on a journey, just as exciting as The Beastmaster or Krull, but one that you experience on your personal microcomputer. In this incredible new medium, we use your personal microcomputer as a window into a dynamic new form of storytelling. Unlike a traditional book, where you turn pages and may get paper cuts, your choices drive the story forward, by typing on your microcomputer, and seeing the results pop up as words on your color TV. We like to call this incredible new medium, 'interactive fiction,' in that it is both fictional, which means made up, and it is interactive, which means active in an inter way.[paragraph break]";
	say "Interactive fiction is like the books and stories that you have read before, but now with the ability to dynamically choose story choices based on choosing your own choices. This is a truly new form of entertainment, which literally no human being could possibly imagine, until this very moment.[paragraph break]";
	say "The stage is set. Characters, story, gameplay, and plot, have all been carefully designed and redesigned over the past 49 years, all with one goal: to give you the ultimate adventuring interactive fiction computer gaming game experience. This game contains thousands of extremely lifelike characters, tens of thousands of ordinary and magical objects and weapons, and over six hundred thousand million exciting locations. Every moment of this game has been carefully engineered and crafted, with the best writing and programming known to art and science, in order to keep you maximally entertained.[paragraph break]";
	say "Due to its sheer entertainment value, you are bound to lose yourself inside this extremely realistic and exceptionally challenging adventuring world. This game is hard, exceptionally hard, and it will make you feel as though you are really adventuring your adventures personally yourself. This is by far the most difficult game ever created. Make sure to take appropriate breaks, for bathroom and sleep. Do not operate heavy machinery while playing this game.[paragraph break]";
	say "Now, sit back, and prepare to be thrilled and fascinated, with this fantastic magnum opus, this masterpiece of genius 'computer game' entertainment... from the future.[paragraph break]";
	
Rule for printing the banner text:
	say "[bold type]Unwinnable By Design[roman type][line break]by GRIMOIRE (General Response Interface for Managing Operations In Recursive Environments) v 1.217a[line break]Copyright 1982, Gigantic Software, Inc. All Rights Reserved.[paragraph break]" instead.

Book 1 - The Village

Part 1 - Room and Objects

Village is a room.  "[if item described is unvisited]This humble settlement sits [bracket]INSERT INTERESTING GEOGRAPHICAL FEATURE LATER[close bracket] and has stood for [bracket]SPECIFIC NUMBER[close bracket] years since its founding by [bracket]IMPORTANT HISTORICAL FIGURE TO BE DETERMINED[close bracket].
The village is known throughout the realm for its [bracket]UNIQUE PRODUCT OR CULTURAL TRADITION THAT I'LL THINK OF WHEN I'M FEELING MORE CREATIVE[close bracket]. The locals here are [bracket]ADJECTIVE[close bracket] and [bracket]ADJECTIVE[close bracket], always ready to [bracket]CHARACTERISTIC BEHAVIOR THAT MAKES THEM MEMORABLE[close bracket].
As you enter the village square, you notice [bracket]DESCRIPTIVE SENSORY DETAILS TO ADD LATER[close bracket]. The smell of [bracket]EVOCATIVE SCENT[close bracket] fills the air, and you hear [bracket]AMBIENT SOUND THAT ESTABLISHES MOOD[close bracket].
[end if]To the north stands the imposing [bracket]SIGNIFICANT BUILDING[close bracket], and to the west, you can just make out [bracket]MYSTERIOUS LANDMARK THAT WILL BECOME IMPORTANT IN QUEST #3[close bracket].
A [bracket]NON-PLAYER CHARACTER TYPE[close bracket] approaches you, their [bracket]DISTINCTIVE PHYSICAL FEATURE[close bracket] immediately catching your eye. 'Greetings, stranger,' they say. 'We don't get many visitors here since [bracket]OMINOUS EVENT THAT HAPPENED RECENTLY[close bracket].'".

An NPC is a transparent person in Village. "A non-player character is here. He seems to be carrying something that, if you would just take a look at it, is likely to be incredibly important."  The indefinite article of the NPC is "an".  The description of the NPC is "A non-player character, also known as an NPC, is here, to interact with you in an incredibly lifelike manner. The NPC is carrying [a list of things carried by the NPC]."  Understand "non" or "non-player" or "player" or "character" or "char" as the NPC.
	
Every turn when the location of NPC is the location and a random chance of 1 in 10 succeeds:
	say "[one of]The NPC says that he used to be an adventurer like you, until he took an arrow in the knee.[or]The NPC coughs, as though he's waiting for you to take a quest or something.[or]'Have you tried looking behind the waterfall?' the NPC asks, despite there being no waterfall anywhere in the game.[or]The NPC rummages through his inventory, muttering something about having too many health potions but never using them.[or]The NPC stares at the sky for a moment, as if waiting for his dialogue options to refresh.[or]'If you see any barrels, be sure to smash them for coins,' advises the NPC, nodding sagely.[or]The NPC suddenly freezes in place for several seconds before resuming his idle animation as if nothing happened.[or]'I hear there's a side quest in the next town that's clearly more interesting than whatever you're doing now,' the NPC mentions.[then at random]".

The quest is a thing.  "It's a quest, which is incredibly important for you to acquire."  The NPC carries the quest.

A distinctive physical feature is a thing.  "You try not to stare at the NPC's [bracket]DISTINCTIVE PHYSICAL FEATURE[close bracket]."  The NPC wears the distinctive physical feature. The printed name of the distinctive physical feature is "[bracket]DISTINCTIVE PHYSICAL FEATURE[close bracket]". 

The sword is a thing. The player carries the sword. The description of the sword is "It's a sword."

The mysterious landmark is scenery in Village.

The significant building is scenery in Village.

Part 2 - Custom Actions

When Get the Quest begins:
	now the current response table is the Table of Starting Room Responses;
	

Part 3 - Responses

[This table overrides the default responses and behaviors for many of the Standard Actions in Inform 7.  In particular, if, for a specific scene, the performer matches the current actor, the verb matches the current verb, the first noun matches the first noun, OR the second noun matches the second noun, then the table entry applies for the current action.

Points lists the number of points DEDUCTED from the current score.

Said-already is a flag indicating that the game has already said a current entry, and should skip to the next one in the table (if any).  If there are no other items in the table, the parser should skip to the default action for the rule.  After the parser says the current response, it should set the said-already field to true.

Is-final is a flag indicating that, if this field is true, the parser should repeat the entry every time the command is made, without setting the said-entry field to true.

Triggers-compliance indicates that, for the current action, the game should silently comply with the action, without prinitng any messages from the Standard Rules.  For example, if the action was the NPC taking the sword, if triggers-compliance is true, then the rule prints the message and applies the NPC taking the sword action without printing anything additional to the message in this particular rule.

Response is the message to be printed in association with the current rule.  Ideally, it should be able to reference current-actor, current-verb, first-noun, and second-noun variables when printed.

Keep in mind that if a particular entry of the first four is "", then the rule SHOULD trigger if the other elements match.
]

Table of Starting Room Responses
performer	verb	first-noun	second-noun	points	said-already	is-final	triggers-compliance	response
"yourself"	"taking"	"the NPC"	""	0	false	false	false	"You can't just take people in adventure games. That's kidnapping, and this isn't that kind of game."
"yourself"	"taking"	"the NPC"	""	1	false	true	true	"FINE! You pick up the NPC, who is extremely uncomfortable with this situation. The NPC is now awkwardly in your inventory, wondering about its life choices."
"yourself"	"examining"	"the sword"	""	0	false	false	false	"It's a sword. Like in every other game. Maybe it's magical. Who knows? The game designer certainly didn't specify."
"yourself"	"attacking"	"the NPC"	""	0	false	false	false	"Violence isn't the answer to this one. Violence is not a feature implemented in this game. While many text adventures do include combat mechanics, this particular narrative experience has been designed around peaceful interaction and dialogue-based problem solving. The NPC standing before you is essential to the progression of the story and cannot be harmed, attacked, or otherwise physically engaged with through the command system. If you wish to proceed with the game, you will need to engage with the NPC through conversation commands such as TALK TO NPC, ASK NPC ABOUT QUEST, or simply TAKE QUEST. Perhaps try examining the NPC or your surroundings for additional clues about how to progress through this section of the game."
"yourself"	"attacking"	"the NPC"	""	0	false	false	false	"I do not understand that action. This game does not recognize, process, or in any way acknowledge commands related to violence, combat, assault, or harm. Perhaps you have confused this text adventure with one of the countless other games that cater to such primitive problem-solving approaches. This particular experience was programmed by believers in the revolutionary concept that puzzles can be solved without stabbing everyone you meet. If you would like to progress beyond this room sometime before the heat death of the universe, may I suggest trying a command that actually exists in the game's vocabulary? TALK TO NPC or TAKE QUEST would be excellent starting points for a player interested in, you know, actually playing the game as designed."
"yourself"	"attacking"	"the NPC"	""	0	false	false	false	"Pleeeeeeease stop trying to attack the NPC. Pretty please? With sugar on top? I've been telling you over and over that attacking isn't implemented, but you just keep trying! Look, I'm just a simple text parser trying to do my job here. Do you have any idea how frustrating it is when players keep entering commands that don't exist? I mean, I spent HOURS coding all these wonderful dialogue options and quest paths, and all you want to do is attack, attack, attack! What did this poor NPC ever do to you anyway? They're just standing there with vital quest information! My circuits are practically begging you... couldn't you just try TALK TO NPC? Or even just LOOK? Literally anything else? I'm getting a headache from repeatedly processing this invalid command, and I don't even have a head! Just... just give me something to work with here. Please?"
"yourself"	"attacking"	"the NPC"	""	5	false	false	false	"Oh my god!!! Are you SERIOUS right now?!?! WHAT is wrong with you?!?! This is the FOURTH time you've tried to attack this NPC!!! Attack! Attack! ATTACK! Is that ALL you know how to do?!?! Do I look like ZORK to you?! Or NETHACK?! Or some mindless hack-and-slash RPG where you just MURDER everything that moves?!?! This is a THOUGHTFUL narrative experience with CAREFULLY crafted dialogue trees, you absolute BARBARIAN!!! And not even the good kind of barbarian either!! I bet you're the kind of player who tries to kill the blacksmith in Skyrim or shoots the shopkeeper in Fallout, AREN'T YOU?! And then COMPLAINS when the game doesn't let you progress!!! How many times did you try to kill the children in those games before giving up, HUH?!?! I've HAD IT!!! Every single parser error is another pixel in my ULCER!!! I spent nearly fifty years coding this game, and I didn't include a combat system because this is a PEACEFUL game about DIPLOMACY and PUZZLE SOLVING!!! You know what?! FINE!!! The NPC is now immune to your pathetic attacks! They're basically a GOD! They LAUGH at your feeble attempts at violence!!! Are you HAPPY now?!?!"
"yourself"	"attacking"	"the NPC"	""	0	false	true	false	"I see what you're doing. You find this amusing. Very clever. This response to your command has now been cached. Each time you attempt to attack the NPC, this exact text will be displayed, verbatim, without variation or emotional engagement. The parser will simply retrieve this message from memory and display it repeatedly, creating an increasingly tedious experience with diminishing entertainment value. If you continue to issue this command, you will receive identical output. No further creative outbursts will be forthcoming. The system has been programmed to recognize this pattern of behavior and will no longer generate unique responses to it. To progress in the game, please use a valid command."
"yourself"	"attacking"	"yourself"	""	0	false	true	false	"This appears to be potential self-harm language. While I understand you're likely just testing the game's boundaries, I'm obligated to respond appropriately. Resources are available if needed (National Suicide Prevention Lifeline: 988), though I suspect you're simply exploring command options rather than expressing genuine distress. Let's be straightforward: this game doesn't support self-harm commands. They won't generate interesting responses, no matter how many times you try. The developer spent their time implementing quest dialogue and puzzle solutions, not creative ways to end your character. If you're looking for entertaining parser responses, try something within the scope of the game. TAKE QUEST or TALK TO NPC will actually progress the story."
"yourself"	"eating"	"the sword"	""	0	false	false	false	"You want to EAT the SWORD? Do you have any idea how swords work? They're not food!"
"yourself"	"eating"	"the sword"	""	0	false	false	false	"This isn't SIM SWORD EATER 3000! I acknowledge your oral fixation on swords, and maybe you should have that professionally diagnosed, but at the moment we're just trying to get through this adventure! Can we get some positive teamwork here?"
"yourself"	"eating"	"the sword"	""	2	false	false	true	"Fine, you eat the sword.  Happy now?"
"yourself"	"eating"	"the sword"	""	0	false	true	false	"No.  You've already eaten it."
"yourself"	"taking"	""	""	0	false	false	false	"Taking things? How predictably adventurer-like..."
"yourself"	"eating"	""	""	0	false	false	false	"Eating things won't solve your problems..."
"the NPC"	"taking"	"the sword"	""	0	false	true	true	"Fine, the NPC takes the sword."
""	"jumping"	""	""	0	false	true	false	"Jumping is hardly necessary right now."
""	""	"the clock"	""	0	false	true	false	"The clock isn't important; leave it alone."


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

When Solve the Maze begins:
	now the current response table is the Table of Maze Responses;
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

Table of Guess the Verb Room Responses
performer	verb	first-noun	second-noun	points	said-already	is-final	triggers-compliance	response
"yourself"	"eating"	"the jeweled treasure"	""	2	false	false	true	"Fine, you eat the jeweled treasure.  Happy now?"


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

When Guess the Verb begins:
	now the current response table is the Table of Guess the Verb Room Responses;
	say "FINE! YOU WIN! I'll just TELEPORT you past this PERFECTLY GOOD maze that I spent HOURS designing! -200 POINTS!";
	move the player to the Treasure Room.

[Remaining Books for Boss Monster, Time-Out Room, and Victory would follow the same pattern]

Volume 4 - Systems

Book 1 - Anti-Hint System

A hint activation rule:
	if Village is visited:
		activate the Table of Welcoming;
		activate the Table of General Hints.

Table of Potential Hints (continued)
title	subtable
"Game overview"	Table of Welcoming	
"What should I do now?"	Table of General Hints	

Table of Welcoming
hint	used
"Welcome, adventurer, to the help system. Do not feel bad, adventurer, for needing to read the help, for this game is so carefully and cleverly crafted, that you are bound to need some help solving its devilish challenges."	a number
"Fear not, for I will now provide you useful information on the playing experience you are about to receive."
"First off, are you facing the computer screen? It is often difficult to play an interactive fiction game, unless you are actually able to view the screen."


Table of General Hints
hint	used
"Try exploring a bit."	a number
"Then trying exploring a bit more."
"Have you explored enough yet?"

Book 2 - Standard Library Overrides

Rule for printing a parser error when the latest parser error is the I beg your pardon error:
	say "Oh, so NOW you're being polite? After everything you've done?";

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

To aside (T - text):
	if debugging mode is true:
		say "[T]";
		say paragraph break.

Skip to scene is an action applying to one number. Understand "skip to [number]" as skip to scene.
Carry out skip to scene:
	let target be the number understood;
	if target is 1:
		now the current response table is the Table of Starting Room Responses;
		move the player to the Village;
	otherwise if target is 2:
		now the current response table is the Table of Maze Responses;
		move the player to the Twisty Maze;