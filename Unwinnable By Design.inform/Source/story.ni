"Unwinnable By Design" by John Byrd

Volume 1 - Overview

Book 1 - Metadata

The story headline is "An Interactive (insert game genre name here) Fiction".
The story description is "Overcome terrifying monsters and partner with complex characters to save the universe from something or other.".

Include Basic Screen Effects by Emily Short.
Include Locksmith by Emily Short.
Include Response Assistant by Aaron Reed.
Include Swearing Reloaded by Shin.

Include Object Response Tests by Juhana Leinonen.

Use scoring.

Release along with cover art, a website, an interpreter, and the source text.

When play begins:
	now the right hand status line is "Score: [score]";
	say "You wake up, having no idea where you are or how you got here. [paragraph break]Mostly, this occurred because the author was too uncreative to write out a proper backstory for you.  A medical diagnosis of amnesia occurs only in perhaps four out of 100,000 patients, and people with actual amnesia practically never forget who they are, but it is convenient to stick with the popular fiction here, because figuring out a backstory for the player character would take a lot of thinking, and thinking is hard, and writing interactive fiction is even harder than thinking."
	
Volume 2 - Desiderata

Vitality is a kind of value. The vitalities are alive and dead.  A person has a vitality. A person is usually alive.

Tangibility is a kind of value.  The tangibilities are abstract and concrete. A thing has a tangibility. A thing is usually concrete.

Volume 3 - Rooms

The parser error internal rule response (X) is "[one of]What?[or]Hello?[or]Huh?[or]I beg your pardon?[or]Um?[or]Look, I'm running out of random responses here.[or]Seriously, this is the last one.[or]Now, I'm totally going to loop back and use previous responses now.[or]Stop trying to make me say something new.[or]I'm really out of things to say at this point.[or]Come on, give it a rest.[or]Holy crap, you are persistent.[or]This becomes tiresome.[or]I grow weary of this motif.[or]Okay, what the hell is it you want here?[or]You're putting me in a special sort of hell, you know.[or]This is a video game. This is supposed to be fun. You're not supposed to be just reading through the random responses and enjoying them.[or]God, you are annoying.[or]CUT IT OUT![or]STOP![or]Okay, fine. Your Easter egg code is 'xyzzy'.[then at random]".

Starting Room is a room. "This is the room that the game [one of]starts[or]started[stopping] you in. Note to self: come back and write a detailed description of this room. It needs to have lots of interesting things to look at, to create the tone and setting for the game. Gamers care a lot about such things, like tone and setting, so I need to make it interesting."

Volume 4 - People

Book 1 - NPC

The NPC is an improper-named transparent neuter person in the Starting Room. The indefinite article of the NPC is "an". The description of the NPC is "You see nothing special about the NPC. The NPC is a non-player character. 'Non-player character' is a professional term of art used amongst professional game designers, so I don't expect you to understand what it means. It's a very technical term, meaning that you don't control that character, as opposed to the player character, which you do control. I don't want to get into it all right now. Just assume that the NPC is a person, with lots of interesting dialogue and interactions that make the game more colorful and realistic.[if the NPC is dead] Unfortunately, the NPC is dead, which may impact the colorful realism of the NPC's dialogue.[end if] The NPC is carrying [a list of things carried by the NPC]." 

The NPC has a list of text called chatter. The chatter of the NPC is 
{ 
"I once saw a purple elephant!", 
"Did you know that clouds are actually made of cotton candy?", 
"I think my left shoe is trying to communicate with me.", 
"Sometimes I dream I'm a talking banana.", 
"I'm convinced that squirrels are secretly running the world." 
}

After taking something carried by the NPC:
	say "Technically, you're not supposed to be able to do that, because there's a default rule that prevents you from taking other people's possessions. I intended to make a puzzle here, where you had to say some sort of password like 'xyzzy' to the NPC, but I never got around to implementing it, so there's this bug you can exploit, where you can just take whatever the NPC is holding without asking permission first. I will get around to patching this bug in the next release of this game.";
	[move the noun to the player.]
	
Report taking the NPC:
	say "I suppose the NPC wouldn't care for that. However, this is just a game, and technically it is possible in real life to pick other people up, and the default rules are still confusing to me, so whatever, I won't bother checking whether it is impossible or not.";
	[move the NPC to the player.]
	
After attacking the NPC:
	say "[if the NPC is alive]Wonderful, you kill the NPC. The NPC is now completely dead. I guess you're expecting some sort of in-game reward, like some sort of clever death rattle, or maybe your score will go up. Look at you, going through this video game, committing a random act of violence upon a helpless NPC. Look at what your video game addiction has done to you. It's made you into a violent random killer. Whatever. The NPC is now completely dead, and it's all your fault.[else]Are you completely and utterly deranged? You've already killed the NPC. The NPC is dead. That is the end of the NPC. It is a well deaded NPC.[end if][if the NPC carries the quest]And that NPC also is carrying a quest, which you can't actually accomplish anymore, because the NPC is dead, so you might as well reload the game at this point. Or not, see if I care.[end if]";
	if the NPC is alive:
		decrease the score by 1;
		now the NPC is dead.
	
Volume 5 - Things

Book 1 - The unlikely object

The unlikely object is a container in the Starting Room.  The printed name of the unlikely object is "object".

Book 2 - The score

The score slider is a thing in the Starting Room.  The printed name of the score slider is "score".

Book 3 - Ye flask

The flask is a thing in the Starting Room.  The indefinite article of the flask is "ye".

Instead of an actor taking the flask:
	say "[if the actor is the player]Ye[else][We][end if] cannot get [a noun]. It is firmly bolted to a wall which is bolted to the rest of the dungeon which is probably bolted to a castle. Never ye mind.".

Book 4 - The red key

The NPC carries a red key. The description of the red key is "It seems to be a red key, which is unlikely, because keys are never red in real life; they are brass, or nickel, or stainless steel, but this one happens to be red, because this game is clearly trying to suggest that it corresponds to the red door, and anyway gamers have already been programmed to assume that colored things correspond to one another in video games, and anyway I couldn't be bothered to do research or actually use my imagination here, so I went with the trope and just made it a red key."

Book 5 - The quest

The NPC carries a quest. The quest is abstract. The description of the quest is "It's a quest, which the NPC [if the NPC is alive]is[else]was[end if] probably supposed to give to you. It's maybe to collect 10 herbs, or wolf pelts, or something like that, but I'm going to have to go in and write code for those things at some point, and maybe I'd prefer it to be herbs, because you can just pick those up, as opposed to wolf pelts, where I would have to create all those wolves and track battles between you and each wolf and have them all drop pelts when they die."

Book 6 - The Easter egg

The Easter egg is a container. The Easter egg has the description "It's an Easter egg. You probably know what Easter eggs look like; it's an egg, and it's been decorated for the holiday known as Easter. When I write this game for real, I need to come back and write down a whole bunch of secret messages to friends, and give thanks to them, and talk about what a genius programmer I am, for putting this Easter egg into the game. I also need to credit myself, because I have a very large ego; yet I am not very competent as a programmer, so I need to aggrandize myself by putting an Easter egg into this game. Whatever, gamers love all Easter eggs, so they will definitely love this one."

Volume 6 - Actions

Book 1 - Generic actions

Part 1 - Rules are, there ain't no rules

The can't take people's possessions rule is not listed in any rulebook.
The can't take yourself rule is not listed in any rulebook.
The can't take other people rule is not listed in any rulebook.

Persuasion rule for asking someone to try doing something:
	persuasion succeeds.
	
Part 2 - Different text for some default library refusals

The can't go that way rule response (A) is "You can't go that way, because I neglected to actually write a rule that deals intelligently with you attempting to go that way. That's fine, because I'm sure no one will actually attempt to go that way in game."

The examine undescribed things rule response (A) is "[We] [see] nothing special about [the noun]. [one of]There could very well be special things about [the noun]. but I will need to come back later and write them all up, which I haven't done yet, so this is just the default response for describing things that have no description.[or]Actually, you can probably assume that there are special things about [the noun], but I need to get around to writing a detailed text about them, which I will probably do very shortly.[then at random]"

The carry out requested actions rule response (A) is "[The noun] [are] unable to do that. Actually, if I had spent more time programming this game, I would have come up with some way for [the noun] to do that, but honestly, I wasn't smart enough to foresee that choice, and so the best I can do is give you this catch-all response."

Part 3 - Concrete actions on abstract things

Instead of an actor doing something to an abstract thing:
	say "[The noun] is an abstract idea, which means that it doesn't exist as a physical object, which means that you can't interact with it. So I don't even understand why you are trying, really.".

Part 4 - Unusual verbs

Chapter 1 - Swearing obscenely

Instead of an actor swearing obscenely:
	say "Real adventurers do not use such language. Actually they do, if you've ever spent any time around any adventurers in real life; they all curse a blue streak, but for some reason this game has to act better than swearing, probably because we're all English or something, or maybe because educational purposes, even though interactive fiction has not been used for education since 1989.";
	stop the action.
	
Chapter 2 - Cheat codes

Using cheat codes is an action applying to nothing.
Understand "xyzzy" and "plugh" as using cheat codes.
Carry out an actor using cheat codes:
	say "[if the actor carries the Easter egg]Apparently [the actor] used a cheat code before, but I can't be bothered to write game logic to detect that fact, so let's just run the same game logic again. [end if]You entered a cheat code, unlocking an Easter egg of bonus content in this game! Note to self: buck up the player's ego at this point, and make sure to give them lots of points and enable god mode as a reward.[paragraph break]Also, additional note to self: be sure to write said bonus content later.[paragraph break]Also, additional additional note to self: figure out what god mode means in a text adventure.";
	move the Easter egg to the actor;
	increase the score by 0;
	try the actor taking inventory.
	
Part 5 - Likely verbs

Chapter 1 - Attacking

The block attacking rule is not listed in any rulebook.

To attack is a verb.

Report an actor attacking something:
	say "[We] [attack] [the noun]."
	
Chapter 2 - Eating
	
The standard eating rule is not listed in any rulebook.
The standard report eating rule is not listed in any rulebook.

A thing is usually edible. [If you commit yourself.]

Carry out an actor eating:
	say "Okay, [the actor] [eat] [the noun], which causes [the noun] to be removed entirely from play. The game's main library was never designed to have [the noun] removed from play. [if the actor is the player]This will very likely crash the game. [end if]Sadly, there's no way even for [us] to go back one move, so you're going to probably have to reload the entire game at this point. But all I'm doing is taking your instructions very literally, so [we] really only have [us] to blame for whatever terrible technical disaster is about to happen.";
	decrease the score by 1;
	if the noun is the player:
		pause the game;
	remove the noun from play.

Book 2 - Specific actions

Part 1 - Actions on people

Chapter 1 - Actors taking people

Carry out an actor taking someone:
	say "Technically, [the actor] not supposed to be able to [take] [the noun], and there's a default rule in this game that says you're already self-possessed or something like that, but I forgot to enable that default rule for this game, so yeah, sure, go ahead, [the actor] [take] [the noun]. That makes perfect sense. Good job. Unforunately, you usually can't move the player character into the actor, because that would cause a loop in the object tree, but hell, let's try it anyway and see what happens. Not my fault if the game crashes here or whatever; that's all on you.";
	pause the game;
	move the player to the actor.
	
Volume 7 - Ranting

[The game rants at the user, with varying levels of intensity, based on when the score gets varying levels of bad.]

Table of Rants
Points	Response
-1	"I'm a bit concerned you are not taking this game seriously."
-2	"Have you noticed that your score seems to be decreasing? That's not the point of this game."

The notify score changes rule is not listed in any rulebook.  [We want to provide commentary any time that happens, so we basically rewrite the entire rule here.]

This is the notify score changes and consider ranting rule:
	if the score is not the last notified score:
		issue score notification message;
		repeat through the Table of Rants in reverse order:
			if the score is at most the Points entry:
				say "[paragraph break][Response entry][paragraph break]";
				break;
		now the last notified score is the score;
		
The notify score changes and consider ranting rule is listed last in the turn sequence rulebook.

Volume 8 - Afterwords and Special Thanks

Test me with "track responses".