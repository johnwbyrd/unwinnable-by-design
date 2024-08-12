"Unwinnable By Design" by John Byrd

Part 1 - Overview

Chapter 1 - Metadata

The story headline is "An Interactive (insert game genre name here) Fiction".
The story description is "Overcome terrifying monsters and partner with complex characters to save the universe from something or other.".

Include Basic Screen Effects by Emily Short.
Include Locksmith by Emily Short.
Include Response Assistant by Aaron Reed.
Include Swearing Reloaded by Shin.

Use scoring.

Release along with cover art, a website, an interpreter, and the source text.

When play begins:
	say "You wake up, having no idea where you are or how you got here. [paragraph break]Mostly, this occurred because the author was too uncreative to write out a proper backstory for you.  A medical diagnosis of amnesia occurs only in perhaps four out of 100,000 patients, and people with actual amnesia practically never forget who they are, but it is convenient to stick with the popular fiction here, because figuring out a backstory for the player character would take a lot of thinking, and thinking is hard, and writing interactive fiction is even harder than thinking."
	
Part 2 - Desiderata

Vitality is a kind of value. The vitalities are alive and dead.  A person has a vitality. A person is usually alive.

Tangibility is a kind of value.  The tangibilities are abstract and concrete. A thing has a tangibility. A thing is usually concrete.

Part 3 - Rooms

The parser error internal rule response (X) is "[one of]What?[or]Hello?[or]Huh?[or]I beg your pardon?[or]Um?[or]Look, I'm running out of random responses here.[or]Seriously, this is the last one.[or]Now, I'm totally going to loop back and use previous responses now.[or]Stop trying to make me say something new.[or]I'm really out of things to say at this point.[or]Come on, give it a rest.[or]Holy crap, you are persistent.[or]This becomes tiresome.[or]I grow weary of this motif.[or]Okay, what the hell is it you want here?[or]You're putting me in a special sort of hell, you know.[or]This is a video game. This is supposed to be fun. You're not supposed to be just reading through the random responses and enjoying them.[or]God, you are annoying.[or]CUT IT OUT![or]STOP![or]Okay, fine. Your Easter egg code is 'xyzzy'.[then at random]".

Starting Room is a room. "This is the room that the game [one of]starts[or]started[stopping] you in. Note to self: come back and write a detailed description of this room. It needs to have lots of interesting things to look at, to create the tone and setting for the game. Gamers care a lot about such things, like tone and setting, so I need to make it interesting."

Part 4 - People

Chapter 1 - NPC

The NPC is an improper-named transparent neuter person in the Starting Room. The indefinite article of the NPC is "an". The description of the NPC is "You see nothing special about the NPC. The NPC is a non-player character. 'Non-player character' is a professional term of art used amongst professional game designers, so I don't expect you to understand what it means. It's a very technical term, meaning that you don't control that character, as opposed to the player character, which you do control. I don't want to get into it all right now. Just assume that the NPC is a person, with lots of interesting dialogue and interactions that make the game more colorful and realistic.[if the NPC is dead] Unfortunately, the NPC is dead, which may impact the colorful realism of the NPC's dialogue.[end if] The NPC is carrying [a list of things carried by the NPC]." 

The NPC has a list of text called chatter. The chatter of the NPC is 
{ 
"I once saw a purple elephant!", 
"Did you know that clouds are actually made of cotton candy?", 
"I think my left shoe is trying to communicate with me.", 
"Sometimes I dream I'm a talking banana.", 
"I'm convinced that squirrels are secretly running the world." 
}

Talking to is an action applying to a thing. Understand "talk to [someone]" or "speak to [someone]" or "ask [someone]" as talking to.

Every turn when a random chance of 1 in 3 succeeds:
	say "The NPC suddenly exclaims, 'I forgot what I was going to say.'"

Instead of talking to the NPC:
	 say "[The actor] looks at you with a blank expression and says, '[one of][chatter][or]What were we talking about again?[at random]'"

Carry out taking something:
	if the NPC carries the noun:
		say "Technically, you're not supposed to be able to do that, because there's a default rule that prevents you from taking other people's possessions. I intended to make a puzzle here, where you had to say some sort of password like 'xyzzy' to the NPC, but I never got around to implementing it, so there's this bug you can exploit, where you can just whatever the NPC is holding without asking permission first. I will get around to patching this bug in the next release of this game.";
	move the noun to the player.
	
Instead of taking the NPC:
	say "I suppose the NPC wouldn't care for that. However, this is just a game, and technically it is possible to pick other people up, and default rules are still confusing to me, so whatever, I won't bother checking whether it is impossible or not.";
	move the NPC to the player.
	
After attacking the NPC:
	say "[if the NPC is alive]Wonderful, you kill the NPC. The NPC is now completely dead. I guess you're expecting some sort of in-game reward, like some sort of clever death dialogue, or maybe your score will go up. Look at you, going through this video game, committing a random act of violence upon a helpless NPC. Look at what your video game addiction has done to you. It's made you into a violent random killer. Whatever. The NPC is now completely dead, and it's all your fault.[else]Are you completely and utterly deranged? You've already killed the NPC. The NPC is dead. That is the end of the NPC. It is a well deaded NPC.[end if][if the NPC carries the quest]And that NPC also is carrying a quest, which you can't actually accomplish anymore, because the NPC is dead, so you might as well reload the game at this point. Or not, see if I care.[end if]";
	if the NPC is alive:
		decrease the score by 1;
		now the NPC is dead.
	
Part 5 - Things

Section 1 - The unlikely object

The unlikely object is a thing in the Starting Room.  The printed name of the unlikely object is "object".

Section 2 - The red key

The NPC carries a red key. The description of the red key is "It seems to be a red key, which seems unlikely, because keys are never red in real life; they are brass, or nickel, or stainless steel, but this one happens to be red, because this game is clearly trying to suggest that it corresponds to the red door, and anyway gamers have already been programmed to assume that colored things correspond to one another in video games, and anyway I couldn't be bothered to do research or actually use my imagination here, so I went with the trope and just made it a red key."

Section 3 - The quest

The NPC carries a quest. The quest is abstract. The description of the quest is "It's a quest, which the NPC [if the NPC is alive]is[else]was[end if] probably supposed to give to you. It's maybe to collect 10 herbs, or wolf pelts, or something like that, but I'm going to have to go in and write code for those things at some point, and maybe I'd prefer it to be herbs, because you can just pick those up, as opposed to wolf pelts, where I would have to create all those wolves and track battles between you and each wolf and have them all drop pelts when they die."

Section 4 - The Easter egg

The Easter egg is a thing. The Easter egg has the description "It's an Easter egg. You probably know what Easter eggs look like; it's an egg, and it's been decorated for the holiday known as Easter. When I write this game for real, I need to come back and write down a whole bunch of secret messages to friends, and give thanks to them, and talk about what a genius programmer I am, for putting this Easter egg into the game. I also need to credit myself, because I have a very large ego; yet I am not very competent as a programmer, so I need to aggrandize myself by putting an Easter egg into this game. Whatever, gamers love all Easter eggs, so they will definitely love this one."

Part 6 - Actions

Chapter 1 - Generic actions

Section 1 - Rules are, there ain't no rules

The can't take people's possessions rule is not listed in any rulebook.
The can't take yourself rule does nothing.
The can't take other people rule does nothing.
The can't take what you're inside rule does nothing.
The block attacking rule is not listed in any rulebook.

Persuasion rule for asking the NPC to try doing something:
	persuasion succeeds.
	
Section 2 - Different text for some default library refusals

The can't go that way rule response (A) is "You can't go that way, because I neglected to actually write a rule that deals intelligently with you attempting to go that way.  Sorry."

The examine undescribed things rule response (A) is "[We] [see] nothing special about [the noun]. [one of]There could very well be special things about [the noun]. but I will need to come back later and write them all up, which I haven't done yet, so this is just the default response for describing things that have no description.[or]Actually, you can probably assume that there are special things about[the noun], but I need to get around to writing a detailed text about them, which I will probably do very shortly.[then at random]"

Section 3 - Concrete actions on abstract things

Instead of doing something to an abstract thing:
	say "[The noun] is an abstract idea, which means that it doesn't exist as a physical object, which means that you can't interact with it. So I don't even understand why you are trying, really.".

Section 4 - Unusual verbs

Instead of swearing obscenely:
	say "Real adventurers do not use such language. Actually they do, if you've ever spent any time around any adventurers in real life; they all curse a blue streak, but for some reason this game has to act better than swearing, probably because we're all English or something, or maybe because educational purposes, even though interactive fiction has not been used for education since 1989.";
	stop the action.

Using cheat codes is an action applying to nothing.
Understand "xyzzy" and "plugh" as using cheat codes.
Carry out using cheat codes:
	move the Easter egg to the player.
Report using cheat codes:
	say "You entered a cheat code, unlocking an Easter egg of bonus content in this game! Note to self: puff up the player's ego at this point, and make sure to give them lots of points and enable god mode as a reward.[paragraph break]Also, additional note to self: be sure to write said bonus content later.[paragraph break]Also, additional additional note to self: figure out what god mode means.";
	move the Easter egg to the player;
	increase the score by 0;
	try taking inventory.
	
Section 5 - Likely verbs

To attack is a verb.

Carry out attacking something:
	say "[We] [attack] [the noun]."

Carry out eating something:
	say "Okay, by your request, you eat [the noun]. Now I have no idea whether the game is actually solvable or not without [the noun], and I haven't tested it, but there's a very good chance that you've got the game into an unwinnable state, because I'm not going to go through and implement the mechanics of [the player] defecating [the noun] some hours later, because that would be disgusting. I'm going to simply remove the noun from play. Now if that makes the game unwinnable, that's just as it may be, I can't help you there.";
	decrease the score by 1;
	remove the noun from play.

Chapter 2 - Specific actions

Section 1 - The player

Instead of taking the player:
	say "Technically, you're not supposed to be able to do that, and there's a default rule in this game that says you're already self-possessed or something stupid like that, but I forgot to enable that default rule for this game, so yeah, sure, go ahead, you take yourself. That makes perfect sense. Good job. Unforunately, in Inform you technically can't move the player character to the player character, because that would cause a loop in the object tree, but hell, let's try it anyway and see what happens. Not my fault if the game crashes here or whatever; that's all on you.";
	move the player to the player.
	
Instead of eating the player:
	say "Okay, you eat yourself, which causes yourself to be removed entirely from play. This will now very likely crash the game, as the game's main library was never designed to have the player character removed from play.  Sadly, there's no way even for you to go back one move, so you're going to probably have to reload the entire game at this point, but all I'm doing is taking your instructions very literally, so you really only have yourself to blame.";
	decrease the score by 1;
	pause the game;
	remove the player from play.
	
Part 7 - Slush pile

[

You can't get ye flask. 

https://tvtropes.org/pmwiki/pmwiki.php/Main/InteractiveFiction

You notice that you are carrying seventeen things, which would be extremely impossible in real life, but the author of this game didn't bother to implement a limit on carry weight, which would have made this game more realistic.  However, this makes it all easier on you, so.

Practically everything kills you obnoxiously.

There is a non-player character referred to as NPC… The NPC makes some sort of idle chit-chat which does not advance the plot.  The NPC shifts from foot to foot, waiting for you to trigger some sort of action which might advance the plot.  The NPC yawns, thus mildly rebuking you for not making the correct game choices faster.  The NPC gives you some exposition-type dialogue about a puzzle that I didn't bother to actually construct within the game, confusing you and making you ultimately feel like you missed some content that doesn't actually exist.  Talk to NPC: "Sorry, the game's author has not bothered to write out explicatory dialogue which might make my purpose clearer."  The NPC says something about previously being an adventurer, until they took an arrow to the knee.  This is the Nth time the NPC has said this.  NPC: "I've run out of dialogue, so I'm just going to repeat previous things I've said at random now.  Blame the whole linear nature of video game writing."
[give ring to NPC] The NPC says something romantic and heartfelt, but refuses to actually commit to a relationship with you, partly because to do so would require more programming, and partly because no author of interactive fiction has ever been in a romantic relationship with anyone, and so I am unqualified to write about what one may be like.  Who knows, maybe this is one of those sensitive indie games about emotions and love and depression and stuff like that, and so maybe it's a plot point that the NPC took the ring but refused your romantic advances, and maybe at some point I will get around to writing more romantic heartfelt indie game developer type scenes, but right now I am still trying to understand the Inform programming language, so no promises.

You try to [x], but unfortunately a desperately flawed English parser written by a few mediocre programmers prevents you from doing so.

Unfortunately I don't know how to [x], because the author of this game didn't have the foresight to write an appropriate action for [x].  See, this is one of the frustrating shortcomings of text adventures generally.  An actual DM would have given you some sort of creative response, but noooo, we're just software so we can't do that.

Unlock the red door with the red key… I understand how you might want to unlock the red door with the red key, seeing as how they are the same color.  However, that is not how doors and keys actually work in real life.  First off, keys are generally not red; they are gold or chrome or some variation thereof.  I suppose doors can be red, but that's not really germane to this particular puzzle.  Whatever.  You can't open the red door with the red key, because that would make too much sense here.

You are carrying: a weapon.  [look at weapon]  It's a weapon of some kind, because every game that is not completely boring, has a weapon and some monsters to kill.  Who knows, maybe this is one of those boring British text adventures where all you do is wander around and peacefully interact with boring objects for hours, and the weapon doesn't actually have any practical use.  Anyway, the weapon is probably a sword, or a gun, and maybe I should write some code to deal with +3 modifiers and make it a Glaive of Blagging or something like that, but all that will require coding time and diligence, and I really don't know how to do any of that – programming is really confusing to me.

There is a monster here.  I see nothing particularly interesting about the monster, it's pretty much like all other sorts of monsters in these sorts of games, it's threatening and scary and it could be a dragon or a werewolf or a gibbon or a really big squirrel or something, who knows.  I don't see why it's my responsibility to figure out every little detail for you here.  It's a monster, okay?

There is a treasure chest here.  It is basically some kind of box, like a chest or a trunk or a case or something, that people keep treasure in.  It's really ornate, because treasure chests are always ornate by definition in video games; no one has ever seen a plain treasure chest. 

There is some treasure here.  I don't know, it's probably gold, or XP, or mana, maybe it's gems or it's a bunch of IKEA discount cards, who cares?  All that's really important is that you want it.  That's what treasure is basically, it's stuff that you want.

Unfortunately, it is impossible to [x] the crystal door, because the author forgot to put the key in an area that the player can ever get to, which is a shame because I wrote a really brilliant and artistic ending to this game that you can ONLY reach if you go through the crystal door.  It's got, like, a bunch of amazing descriptive dialogue and things that really tie together the whole motif of the game, and the puzzles are really brilliant in there, and it's totally fun and interesting, but you'll never get to see them because I never actually tested this game in front of actual users, I only tested it myself in debug mode.  So, sorry.  My bad.

This is the room behind the crystal door.  Actually, I need to remember to put in some fascinating puzzles in here, and some sort of fine dramatic ending to the game, otherwise the player is going to be upset after getting in here and finding that there is nothing to do.

In this room, there is a monster and a blue door to the east.  To the east of that, there is a room with a "boss monster".  Instead of attacking the boss monster, you get a flashback which gives you even more back story, making the boss monster responsible for some 
[kiss monster] Actually, that would be really funny, and I should probably give you some reward for even trying, but I can't think of a good reward, so whatever, I am just going to give you the default negative response for trying to [x] the [y].

Guess the verb or guess the syntax.

You wake up, having no idea where you are or how you got here.  Principally, this occurred because the author was too uncreative to write out a proper backstory for you.  Amnesia occurs only in perhaps four out of 100,000 patients, and people with actual amnesia practically never forget who they are, but we find it convenient to stick with the popular fiction here, because figuring out a back story for the player character would take a lot of thinking, which I really don't want to do.

You are in an empty room.  You imagine that this room must exist for some sort of purpose, as the game designer shouldn't actually put a room here that doesn't exist for some clearly defined reason.  Unfortunately, I originally intended to put a puzzle in this room, but never got around to it, and so you're now stuck wandering through this stupid empty room that has no clearly defined purpose in the game.  [look]  Sadly, I didn't even get around to writing a text description for the room, so I guess you're either going to have to use your own imagination, which I did not bother to do, or just take my word for it that there's nothing in the room.

You are in a scenery room.  There's nothing whatsoever to do in this room, but there is some scenery that sets the tone of the game, and maybe provides some backstory or something like that.

As you touch the blah, you experience a sudden flashback that explains, in tedious detail, why you are here as part of the story, and sets a general goal for you as part of the game.  Someone powerful, like a king or a CEO or something, has sent you on a very important quest of some sort, but provided you no particular tools or money or armor or anything, so off you went on your quest but you got amnesia because you were so poorly equipped.  This particularly overwritten flashback exists to make sure that you know why you are here in the game, and now you have a particular goal state you are supposed to reach.  It also increases the drama and the tension of the game.  This sudden and unexpected plot twist, makes you like this game more, and you are now much more likely to give it a positive vote and give the author lots of money for being so damned creative.

The Easter egg is an Easter egg.

There is a flask in the center of the room, waiting to be picked up.  There is literally no way that that flask is ever going to get picked up by anyone, unless you do it yourself.  YOU ARE HUMANITY'S LAST HOPE.  
[pick it up]  Taken.  That was uneventful.

This is the famous recursive room.  There is a room here, which you can enter.  [enter room]  This is the famous recursive room. 

"There is an object here. It can't be smelled, tasted, touched, picked up, or dropped, or kicked." (every verb you have tried so far)

"As you try to look at the object, a desperately flawed English parser prevents you from trying.  Its shoddy programming refuses to understand what you are describing.

"The untakeable statue cannot be taken."  (pick up statue)  "Never mind, screw me, apparently I don't even matter here.  Fine, you take the untakeable statue."

"Which key do you mean, the skeleton key, or the massive six-foot golden jewel encrusted magical key?"  (magical)  "You can't see that here."

"And now, it's time to play GUESS THE VERB!"  There's a treasure chest, with a golden crown in it.  When you try to take it, the word "take" shows up on a billboard with an X beside it, and a buzzer sounds. https://www.thesaurus.com/browse/take#steal

"You know what?  There isn't any treasure at all.  I lied.  I made up that part."

Interactive fiction tropes: convenient amnesia where you can remember the medical definition of amnesia but not how you got here.

"You are in a maze of twisty little passages, all alike.  Unfortunately, they all look alike because the author neglected to write a separate description for each one, which might help you orienteer yourself around this mess.  It is unclear why going from one passage northeast might return to the north, but there it is."

You can't go that way.  At this point, an intelligently written parser would tell you valid ways to go; alas, I couldn't be bothered to actually code that up, so now you are stuck figuring out the exits to the room yourself, even though I could have done that for you.

You pick up the squirrel.  It is as the ancient prophecy has foretold!  The squirrel will be picked up, said the ancient prophecy.  And now, the ancient prophecy has come true!  This exposition makes you feel like this game is really well designed, with lots of carefully considered back story.

You have died.  But wait!  Actually you didn't die!  In fact, this is a fake ending, designed to make you feel like you are getting an extended game experience.  

There's a dialogue tree.  No really.  A dialogue.  Tree.

https://www.ifwiki.org/My_Apartment with exactly two things in the refrigerator.
https://www.ifwiki.org/Games_about_IF
https://tvtropes.org/pmwiki/pmwiki.php/Main/TextParser
https://tvtropes.org/pmwiki/pmwiki.php/Main/InteractiveFiction
https://tvtropes.org/pmwiki/pmwiki.php/Main/InsurmountableWaistHeig

"Unwinnable By Design"

Kleptomaniac hero

Also needs a help section.  "Have you retriggered the stegosaurus yet?"  "Good, because there is no stegosaurus to retrigger in the game."

The stupid How do you measure exactly 4 gallons using only a 3 and a 5 gallon jug? puzzle

Great, now the game is in an unwinnable state.  Now you wish you had saved the game three moves ago.  But you didn't.

"Don't go east yet.  Go south instead.  There is a bunch of backstory about the goblin horde and the that you're going to miss if you go east now."

]

Part 8 - Afterwords and Special Thanks

Test me with "track responses".