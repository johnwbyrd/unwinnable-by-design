[-- SCENE 'Get the Quest' --]
[--
DIRECTOR_NOTE:
JOKE: The parser is incompetent at understanding any command to get the quest.
RULE: If the player's action involves 'taking' or 'getting' the 'quest', the outcome is ALWAYS 'refusal'.
ACTOR_PROMPT_MODIFIER: Instruct the Actor to have Grim misunderstand the player's command, express confusion, and then suggest a list of alternative, overly complex, or nonsensical ways to get a quest, making sure to exclude the exact method the player just tried. The list of alternatives should be creative and drawn from adventure game tropes.
--]

Volume: Get the Quest

Part 1 - Room and Objects

Village is a room.  "A generic village square. It's clear the author spent about five minutes on this. To the north stands an imposing [bracket]SIGNIFICANT BUILDING[close bracket]. To the west, you can just make out a [bracket]MYSTERIOUS LANDMARK THAT WILL BECOME IMPORTANT IN QUEST #3[close bracket]."

An NPC is a transparent person in Village. "A non-player character stands here, radiating an aura of profound unimportance. He seems to be waiting for you to do something, but gives no indication as to what that might be." The indefinite article of the NPC is "an". Understand "non" or "non-player" or "player" or "character" or "char" as the NPC.
	
The quest is a thing. The description of the quest is "It's a quest, which is allegedly incredibly important for you to acquire." The NPC carries the quest.

The sword is a thing. The player carries the sword. The description of the sword is "It's a sword. Standard issue. Pointy."

The mysterious landmark is scenery in Village.

The significant building is scenery in Village.

Part 2 - Rules

Every turn when the location of the player is the Village and the location of NPC is the Village and a random chance of 1 in 20 succeeds:
	say "[one of]The NPC says that he used to be an adventurer like you, until he took an arrow in the knee.[or]The NPC coughs, as though he's waiting for you to take a quest or something.[or]'Have you tried looking behind the waterfall?' the NPC asks, despite there being no waterfall anywhere in the game.[or]The NPC rummages through his inventory, muttering something about having too many health potions but never using them.[or]The NPC stares at the sky for a moment, as if waiting for his dialogue options to refresh.[or]'If you see any barrels, be sure to smash them for coins,' advises the NPC, nodding sagely.[or]The NPC suddenly freezes in place for several seconds before resuming his idle animation as if nothing happened.[or]'I hear there's a side quest in the next town that's clearly more interesting than whatever you're doing now,' the NPC mentions.[or]'We don't get many visitors here since [bracket]OMINOUS EVENT THAT HAPPENED RECENTLY[close bracket].'[or]'By the ice breath of Steve Meretzky! It is good to see new faces and taste freedom again.'[or]The NPC says a catchphrase that was probably copied from Monty Python. You do not laugh, because it is not funny.[or]'I know much of these woods. For example I know that the Crystal of Keldar will enable you to overcome the crystal tigers. Come back some time and I'll share a story with you!' says the NPC, eager to give random information to a complete stranger.[then at random]".
