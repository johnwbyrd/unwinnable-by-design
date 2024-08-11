"Unwinnable By Design" by John Byrd

The story headline is "An Interactive (insert game genre name here) Fiction".
The story description is "Overcome terrifying monsters and partner with complex characters to save the universe from something or other.".

Release along with cover art, a website, an interpreter, and the source text.

Include Basic Screen Effects by Emily Short.
Include Locksmith by Emily Short.
Include Response Assistant by Aaron Reed.
Include Swearing Reloaded by Shin.

Use scoring.  The maximum score is 17.

When play begins:
	say "You wake up, having no idea where you are or how you got here. [paragraph break]Mostly, this occurred because the author was too uncreative to write out a proper backstory for you.  A medical diagnosis of amnesia occurs only in perhaps four out of 100,000 patients, and people with actual amnesia practically never forget who they are, but it is convenient to stick with the popular fiction here, because figuring out a backstory for the player character would take a lot of thinking, and thinking is hard, and writing interactive fiction is even harder than thinking."
	
Starting Room is a room.  "This is the room that the game [one of]starts[or]started[stopping] you in. Note to self: come back and write a detailed description of this room. It needs to have lots of interesting things to look at, to create the tone and setting for the game. Gamers care a lot about such things, like tone and setting, so make sure to make it good."

Vitality is a kind of value. The vitalities are alive and dead.  A person has a vitality. A person is usually alive.

The NPC is an improper-named transparent neuter person in the Starting Room.  The description of the NPC is "You see nothing special about the NPC. The NPC is a non-player character. 'Non-player character' is a professional term of art used amongst professional game designers, so I don't expect you to understand what it means. It's a very technical term, meaning that you don't control that character, as opposed to the player character, which you do control. I don't want to get into it all right now. Just assume that the NPC is a person, with lots of interesting dialogue and interactions that make the game more colorful and realistic.[if the NPC is dead] Unfortunately, the NPC is dead, which may impact the colorful realism of the NPC's dialogue.[end if] The NPC is carrying [a list of things carried by the NPC]." The indefinite article of the NPC is "an".

The NPC carries a red key. The description of the red key is "It seems to be a red key, which seems unlikely, because keys are never red in real life; they are brass, or nickel, or stainless steel, but this one happens to be red, because this game is clearly trying to suggest that it corresponds to the red door, and anyway gamers have already been programmed to assume that colored things correspond to one another in video games, and anyway I couldn't be bothered to do research or actually use my imagination here, so I went with the trope and just made it a red key."

Before taking something:
	if the NPC carries the noun:
		say "Technically, you're not supposed to be able to do that, because there's a default rule that prevents you from taking other people's possessions. I intended to make a puzzle here, where you had to say some sort of password like 'xyzzy' to the NPC, but I never got around to implementing it, so there's this bug you can exploit, where you can just whatever the NPC is holding without asking permission first. I will get around to patching this bug in the next release of this game."

The can't take people's possessions rule is not listed in any rulebook.
Persuasion rule for asking the NPC to try doing something:
	persuasion succeeds.
	
The unlikely object is a thing in the Starting Room.  The printed name of the unlikely object is "object".

The can't go that way rule response (A) is "You can't go that way, because I neglected to actually write a rule that deals intelligently with you attempting to go that way.  Sorry."

The examine undescribed things rule response (A) is "[We] [see] nothing special about [the noun]. [one of]There could very well be special things about [the noun]. but I will need to come back later and write them all up, which I haven't done yet, so this is just the default response for describing things that have no description.[or]Actually, you can probably assume that there are special things about[the noun], but I need to get around to writing a detailed text about them, which I will probably do very shortly.[then at random]"

The can't take yourself rule does nothing.
The can't take other people rule does nothing.
The can't take what you're inside rule does nothing.

Instead of taking the player:
	say "Technically, you're not supposed to be able to do that, and there's a default rule in this game that says you're already self-possessed or something stupid like that, but I forgot to enable that default rule for this game, so yeah, sure, go ahead, you take yourself. That makes perfect sense. Good job. Unforunately, in Inform you technically can't move the player character to the player character, because that would cause a loop in the object tree, but hell, let's try it anyway and see what happens. Not my fault if the game crashes here or whatever; that's all on you.";
	move the player to the player.
	
Instead of taking the NPC:
	say "I suppose the NPC wouldn't care for that. However, this is just a game, and technically it is possible to pick other people up, and default rules are still confusing to me, so whatever, I won't bother checking whether it is impossible or not.";
	move the NPC to the player.
	
The block attacking rule does nothing.

Carry out attacking a thing:
	let the damage be a random number between 1 and 6;
	say "[We] attack [the noun], causing [damage] damage.  Unfortunately, I'm not tracking the maximum amount of damage that [the noun] can handle, so you can go on an inflict infinite damage to [the noun], and it doesn't make a bit of difference to the gameplay.".

After attacking the NPC:
	say "[if the NPC is alive]Wonderful, you kill the NPC. The NPC is now completely dead. I guess you're expecting some sort of in-game reward, like some sort of clever death dialogue, or maybe your score will go up. Look at you, going through this video game, committing a random act of violence upon a helpless NPC. Look at what your video game addiction has done to you. It's made you into a violent random killer. Whatever. The NPC is now completely dead, and it's all your fault.[else]Are you completely and utterly deranged? You've already killed the NPC. The NPC is dead. That is the end of the NPC. It is a well deaded NPC.[end if]";
	say "[if the NPC is alive]Wonderful, you kill the NPC. The NPC is now completely dead. I guess you're expecting some sort of in-game reward, like some sort of clever death dialogue, or maybe your score will go up. Look at you, going through this video game, committing a random act of violence upon a helpless NPC. Look at what your video game addiction has done to you. It's made you into a violent random killer. Whatever. The NPC is now completely dead, and it's all your fault.[else]Are you completely and utterly deranged? You've already killed the NPC. The NPC is dead. That is the end of the NPC. It is a well deaded NPC.[end if]";
	if the NPC is alive:
		decrease the score by 1;
		now the NPC is dead.
	
Instead of eating the player:
	say "Okay, you eat yourself, which causes yourself to be removed entirely from play. This will now very likely crash the game, as the game's main library was never designed to have the player character removed from play.  Sadly, there's no way even for you to go back one move, so you're going to probably have to reload the entire game at this point, but all I'm doing is taking your instructions very literally, so you really only have yourself to blame.";
	decrease the score by 1;
	pause the game;
	remove the player from play.
	
Instead of eating something:
	say "Okay, by your request, you eat [the noun]. Now I have no idea whether the game is actually solvable or not without [the noun], and I haven't tested it, but there's a very good chance that you've got the game into an unwinnable state, because I'm not going to go through and implement the mechanics of [the player] defecating [the noun] some hours later, because that would be disgusting. I'm going to simply remove the noun from play. Now if that makes the game unwinnable, that's just as it may be, I can't help you there.";
	decrease the score by 1;
	remove the noun from play.

After the actor attacking the player:
	say "Foo";

Instead of swearing obscenely:
	say "Real adventurers do not use such language. Actually they do, if you've ever spent any time around any adventurers in real life; they all curse a blue streak, but for some reason this game has to act better than swearing, probably because we're all English or something, or maybe because educational purposes, even though interactive fiction has not been used for education since 1989.";
	stop the action.

The Easter egg is a thing.  The Easter egg has the description "It's an Easter egg. You probably know what Easter eggs look like; it's an egg, and it's been decorated for the Christian holiday known as Easter. When I write this game for real, I need to come back and write down a whole bunch of secret messages to friends, and give thanks to them, and talk about what a genius programmer I am, for putting this Easter egg into the game. I also need to credit myself, because I have a very large ego; yet I am not very competent as a programmer, so I need to aggrandize myself by putting an Easter egg into this game. Whatever, gamers love all Easter eggs, even lame ones, so they will definitely love this one."

Using cheat codes is an action applying to nothing.
Understand "xyzzy" and "plugh" as using cheat codes.
Carry out using cheat codes:
	move the Easter egg to the player.
Report using cheat codes:
	say "You entered a cheat code, unlocking an Easter egg of bonus content in this game! Note to self: puff up the player's ego at this point, and make sure to give them lots of points and enable god mode as a reward.[paragraph break]Also, additional note to self: be sure to write said bonus content later.[paragraph break]Also, additional additional note to self: figure out what god mode means.";
	move the Easter egg to the player;
	increase the score by 0;
	try taking inventory.
	
Test me with "track responses."