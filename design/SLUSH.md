# Slush pile

This is a list of random creative slush pile ideas that may or may not be incorporated into the main game.  

## Game Mechanics & Meta References

### Game Structure & Tools
- https://trizbort.io/app/index.html# is a map making tool for interactive adventures.
- https://tvtropes.org/pmwiki/pmwiki.php/Main/InteractiveFiction
- https://www.ifwiki.org/My_Apaperment with exactly two things in the refrigerator.
- https://www.ifwiki.org/Games_about_IF
- https://tvtropes.org/pmwiki/pmwiki.php/Main/TextParser
- https://tvtropes.org/pmwiki/pmwiki.php/Main/InteractiveFiction
- https://tvtropes.org/pmwiki/pmwiki.php/Main/InsurmountableWaistHeig

### Parser Limitations & Frustrations
- You can't get ye flask.
- You try to [x], but unfortunately a desperately flawed English parser written by a few mediocre programmers prevents you from doing so.
- Unfortunately I don't know how to [x], because the author of this game didn't have the foresight to write an appropriate action for [x]. See, this is one of the frustrating shortcomings of text adventures generally. An actual DM would have given you some sort of creative response, but noooo, we're just software so we can't do that.
- As you try to look at the object, a desperately flawed English parser prevents you from trying. Its shoddy programming refuses to understand what you are describing.
- Guess the verb or guess the syntax.
- And now, it's time to play GUESS THE VERB! There's a treasure chest, with a golden crown in it. When you try to take it, the word "take" shows up on a billboard with an X beside it, and a buzzer sounds. https://www.thesaurus.com/browse/take#steal
- Which key do you mean, the skeleton key, or the massive six-foot golden jewel encrusted magical key? (magical) You can't see that here.

### Common IF Tropes
- You notice that you are carrying seventeen things, which would be extremely impossible in real life, but the author of this game didn't bother to implement a limit on carry weight, which would have made this game more realistic. However, this makes it all easier on you, so.
- Practically everything kills you obnoxiously.
- Interactive fiction tropes: convenient amnesia where you can remember the medical definition of amnesia but not how you got here.
- The Easter egg is an Easter egg.
- Unwinnable By Design
- Kleptomaniac hero
- Great, now the game is in an unwinnable state. Now you wish you had saved the game three moves ago. But you didn't.

## Room Descriptions & Environments

### Generic/Empty Rooms
- You are in an empty room. You imagine that this room must exist for some sort of purpose, as the game designer shouldn't actually put a room here that doesn't exist for some clearly defined reason. Unfortunately, I originally intended to put a puzzle in this room, but never got around to it, and so you're now stuck wandering through this stupid empty room that has no clearly defined purpose in the game. [look] Sadly, I didn't even get around to writing a text description for the room, so I guess you're either going to have to use your own imagination, which I did not bother to do, or just take my word for it that there's nothing in the room.
- You are in a scenery room. There's nothing whatsoever to do in this room, but there is some scenery that sets the tone of the game, and maybe provides some backstory or something like that.

### Special Room Types
- This is the famous recursive room. There is a room here, which you can enter. [enter room] This is the famous recursive room.
- You are in a maze of twisty little passages, all alike. Unfortunately, they all look alike because the author neglected to write a separate description for each one, which might help you orienteer yourself around this mess. It is unclear why going from one passage northeast might return to the north, but there it is.
- This is the room behind the crystal door. Actually, I need to remember to put in some fascinating puzzles in here, and some sort of fine dramatic ending to the game, otherwise the player is going to be upset after getting in here and finding that there is nothing to do.
- In this room, there is a monster and a blue door to the east. To the east of that, there is a room with a 'boss monster'. Instead of attacking the boss monster, you get a flashback which gives you even more back story, making the boss monster responsible for some

### Navigation Issues
- You can't go that way. At this point, an intelligently written parser would tell you valid ways to go; alas, I couldn't be bothered to actually code that up, so now you are stuck figuring out the exits to the room yourself, even though I could have done that for you.
- Don't go east yet. Go south instead. There is a bunch of backstory about the goblin horde and the that you're going to miss if you go east now.

## Objects & Items

### Generic Items
- There is a treasure chest here. It is basically some kind of box, like a chest or a trunk or a case or something, that people keep treasure in. It's really ornate, because treasure chests are always ornate by definition in video games; no one has ever seen a plain treasure chest.
- There is some treasure here. I don't know, it's probably gold, or XP, or mana, maybe it's gems or it's a bunch of IKEA discount cards, who cares? All that's really important is that you want it. That's what treasure is basically, it's stuff that you want.
- There is a flask in the center of the room, waiting to be picked up. There is literally no way that that flask is ever going to get picked up by anyone, unless you do it yourself. YOU ARE HUMANITY'S LAST HOPE. [pick it up] Taken. That was uneventful.

### Item Interactions & Limitations
- Unlock the red door with the red key… I understand how you might want to unlock the red door with the red key, seeing as how they are the same color. However, that is not how doors and keys actually work in real life. First off, keys are generally not red; they are gold or chrome or some variation thereof. I suppose doors can be red, but that's not really germane to this particular puzzle. Whatever. You can't open the red door with the red key, because that would make too much sense here.
- You are carrying: a weapon. [look at weapon] It's a weapon of some kind, because every game that is not completely boring, has a weapon and some monsters to kill. Who knows, maybe this is one of those boring British text adventures where all you do is wander around and peacefully interact with boring objects for hours, and the weapon doesn't actually have any practical use. Anyway, the weapon is probably a sword, or a gun, and maybe I should write some code to deal with +3 modifiers and make it a Glaive of Blagging or something like that, but all that will require coding time and diligence, and I really don't know how to do any of that – programming is really confusing to me.
- Unfortunately, it is impossible to [x] the crystal door, because the author forgot to put the key in an area that the player can ever get to, which is a shame because I wrote a really brilliant and artistic ending to this game that you can ONLY reach if you go through the crystal door. It's got, like, a bunch of amazing descriptive dialogue and things that really tie together the whole motif of the game, and the puzzles are really brilliant in there, and it's totally fun and interesting, but you'll never get to see them because I never actually tested this game in front of actual users, I only tested it myself in debug mode. So, sorry. My bad.
- There is an object here. It can't be smelled, tasted, touched, picked up, or dropped, or kicked. (every verb you have tried so far)
- The untakeable statue cannot be taken. (pick up statue) Never mind, screw me, apparently I don't even matter here. Fine, you take the untakeable statue.

## Characters & NPCs

### Generic NPC Interactions
- There is a non-player character referred to as NPC… The NPC makes some sort of idle chit-chat which does not advance the plot. The NPC shifts from foot to foot, waiting for you to trigger some sort of action which might advance the plot. The NPC yawns, thus mildly rebuking you for not making the correct game choices faster. The NPC gives you some exposition-type dialogue about a puzzle that I didn't bother to actually construct within the game, confusing you and making you ultimately feel like you missed some content that doesn't actually exist. Talk to NPC: Sorry, the game's author has not bothered to write out explicatory dialogue which might make my purpose clearer. The NPC says something about previously being an adventurer, until they took an arrow to the knee. This is the Nth time the NPC has said this. NPC: I've run out of dialogue, so I'm just going to repeat previous things I've said at random now. Blame the whole linear nature of video game writing.

### Monsters
- There is a monster here. I see nothing particularly interesting about the monster, it's pretty much like all other sorts of monsters in these sorts of games, it's threatening and scary and it could be a dragon or a werewolf or a gibbon or a really big squirrel or something, who knows. I don't see why it's my responsibility to figure out every little detail for you here. It's a monster, okay?
- [kiss monster] Actually, that would be really funny, and I should probably give you some reward for even trying, but I can't think of a good reward, so whatever, I am just going to give you the default negative response for trying to [x] the [y].

### Romance & Relationships
- [give ring to NPC] The NPC says something romantic and heartfelt, but refuses to actually commit to a relationship with you, partly because to do so would require more programming, and partly because no author of interactive fiction has ever been in a romantic relationship with anyone, and so I am unqualified to write about what one may be like. Who knows, maybe this is one of those sensitive indie games about emotions and love and depression and stuff like that, and so maybe it's a plot point that the NPC took the ring but refused your romantic advances, and maybe at some point I will get around to writing more romantic heartfelt indie game developer type scenes, but right now I am still trying to understand the Inform programming language, so no promises.
- There's a dialogue tree. No really. A dialogue. Tree.

## Story Elements & Plot Devices

### Beginning & Backstory
- You wake up, having no idea where you are or how you got here. Principally, this occurred because the author was too uncreative to write out a proper backstory for you. Amnesia occurs only in perhaps four out of 100,000 patients, and people with actual amnesia practically never forget who they are, but we find it convenient to stick with the popular fiction here, because figuring out a back story for the player character would take a lot of thinking, which I really don't want to do.

### Plot Triggers & Exposition
- As you touch the blah, you experience a sudden flashback that explains, in tedious detail, why you are here as part of the story, and sets a general goal for you as part of the game. Someone powerful, like a king or a CEO or something, has sent you on a very important quest of some sort, but provided you no particular tools or money or armor or anything, so off you went on your quest but you got amnesia because you were so poorly equipped. This particularly overwritten flashback exists to make sure that you know why you are here in the game, and now you have a particular goal state you are supposed to reach. It also increases the drama and the tension of the game. This sudden and unexpected plot twist, makes you like this game more, and you are now much more likely to give it a positive vote and give the author lots of money for being so damned creative.
- You pick up the squirrel. It is as the ancient prophecy has foretold! The squirrel will be picked up, said the ancient prophecy. And now, the ancient prophecy has come true! This exposition makes you feel like this game is really well designed, with lots of carefully considered back story.

### Ending & Game Over
- You have died. But wait! Actually you didn't die! In fact, this is a fake ending, designed to make you feel like you are getting an extended game experience.
- You know what? There isn't any treasure at all. I lied. I made up that part.

## Puzzles & Challenges

### Puzzle Types
- The stupid How do you measure exactly 4 gallons using only a 3 and a 5 gallon jug? puzzle
- Also needs a help section. Have you retriggered the stegosaurus yet? Good, because there is no stegosaurus to retrigger in the game.

## Game Influences

### Referenced Games & Media
- You Don't Know Jack: The game punishes you by giving you a crazy negative score
- There Is No Game: Don't do that!!!
- The Hitchhiker's Guide to the Galaxy: Don't do that!!