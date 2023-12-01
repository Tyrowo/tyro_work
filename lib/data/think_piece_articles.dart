import 'package:flutter/material.dart';
import 'package:tyro_work/helper/resizeable_image.dart';
import 'package:url_launcher/url_launcher.dart';

String tedhPreview =
    'tEDH\nRefactoring the rules of Magic: The Gathering to improve time complexity for the casual participant.';

String leetCodePreview =
    'LeetCode Every Day\nA reflection on the results of my 2023 New Year\'s resolution.';

// Year of Leetcode
class LeetCodePiece extends StatelessWidget {
  const LeetCodePiece({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: ResizeableImage(
            asset: 'assets/pics/leetcodeCurrent.png',
            label: 'My current LeetCode profile/stats page',
            imagesInWrap: 1,
          ),
        ),
        Text(''),
        Text("Closing out my year competing in challenges"),
        Text(''),
        Text(
            "After beginning work on a new contract at work, I decided I wanted to become more confident at coding in Java."),
        Text(
            "I felt like to become a proficient member of the team I wanted to relearn how to do algorithms, because I had learned them in Javascript originally."),
        Text(
            'However, I also wanted to become more "conversationally fluent," because day to day job responsibilities aren\'t necessarily going to require large data structures.'),
        Text(''),
        Text("So I set two goals for the year:"),
        Text(
            "The first was to relearn all of the general data structures and algorithms, becoming familiar at working with their respective Java classes."),
        Text(
            "The other was to complete at least one problem a day for the entire year, even if it was an easy problem, to become more comfortable with completing simple tasks without having to Google them."),
        Text(''),
        Text(
            "Today I've made it through most of the year, and have completed the 300 days required to get the 2023-year achievement on Leetcode."),
        Text(
            "Didn't quite make it to 365, but the goal was more to build it as a habit rather than ignore everything in life that came up."),
        Text(''),
        Text(
            "I also had some ancillary goals that I did through parts of the year, like for a few months I was completing an additional SQL easy problem every day."),
        Text(
            "Another goal was to try to complete the full body of easy problems."),
        Text(''),
        Text("My takeaways from the project - "),
        Text(
            "• Going through a data structures and algorithms study plan is a great way to start practice. It should take you through easy problems to get warmed up first and give a good handle of the built in methods of your language's class"),
        Text(
            "• Doing both a regular problem and a SQL problem was a little more difficult than I expected, since I was having to do a bunch of lookup time for basic concepts in SQL. It is something I want to pick up again in the future, but had to be axed to focus on other personal projects."),
        Text(
            "• Doing all of the easy's was definitely one of the best things I could've done for myself, but has some diminishing returns. Once I became fluent in easy syntax and started looking for my 250+ new easy problem, I fell into a bad habit of cherry picking for easy string manipulation problems just to get my dailies done."),
        Text(
            "• • However, my latest peak in Leetcode Weekly Challenges (1645) came from being able to quickly use the built in methods and strategies from my easy mode problems without second guessing myself. I think doing a thorough breadth of easies is important to build confidence in the language and think it's still more of a worthwhile experience to do one easy than completely stagnate."),
        Text(
            "• I noticed a limited capacity in my ability to do problems on days where I was also learning Flutter, and when I was building my project was when I stopped doing problems on Fridays. Leetcode is great, but shouldn't prioritize learning and creating."),
        Text(
            "• Although I'm pretty confident in most medium problems, I still consistently have a hard time with the third and fourth problems in any given Leetcode Weekly Challenge (high mediums and hards). There's a skill gap and maybe even a bit of a mental block on this eschelon of problems that simply cannot be overcome by doing easies and mediums. You definitely need to just take the plunge at some point."),
        Text(
            "• Having a routine (even of doing an easy problem) definitely at least prevents concerns that I'm stagnating and made me a confident coder professionally."),
        Text(''),
        Text(
            "All in all, although it's easy to get sucked into 'taking it easy,' I've found this to be a worthwhile exercise and believe that I will continue the project inevitably. I may even switch languages so that I can also be more conversational with Dart if I continue to use Flutter."),
        Text(
            "My primary goal for the upcoming year is to start doing a hard problem a week to break through the mental barrier I have with them now."),
        Text(
            "If I'm successful, then my secondary goal is to improve my Challenge ranking, and hopefully get a Leetcode Knight badge."),
        Text("Wish me luck! 😽"),
      ],
    );
  }
}

// Magic
class TEDHPiece extends StatelessWidget {
  const TEDHPiece({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
            "I've loved Magic the Gathering since I was a child, though I had a falling out with it for many years due to some disagreements with how it is monetized and the secondary market in general."),
        const Text(
            "However, with the availability of proxy cards to allow the full potential Magic has to offer, I have found a huge resurgance in playing with friends at the kitchen table!"),
        const Text(
            "Personally I love a good cube draft, but drafting is absolutely not a beginner friendly format."),
        const Text(
            "EDH, however, has become the true kitchen table favorite, and as I played it more I noticed a few flaws."),
        const Text("Shuffling 100 card decks. Often."),
        const Text("Sluggish play from decision anxiety."),
        const Text("Unclear board states."),
        const Text(
            "Tutors making decks too consistent when the theme of the format is supposed to be Singleton."),
        const Text(
            "Tutors making new players unable to play a deck without some kind of cheat sheet or elaborate rundown of how the deck is supposed to be piloted."),
        const Text(
            "The homogenization of deck lists due to staple cards allowed in every deck like fetchlands, mana crypt, sol ring."),
        const Text(
            "Inconsistent and dramatic swings in power based off a lucky ramp draw in the first two turns of the game."),
        const Text(
            "Polarized matches when a player misses a land drop, and the unsettling feeling of watching a person waste upwards of 45 minutes playing from behind in a group environment and/or getting knocked out early."),
        const Text(''),
        const Text(
            "These aren't issues unique to EDH, it's part of Magic's core ruleset."),
        const Text(
            "But I'm not trying to play competitive Magic, I want a game that's fun for my table and easier to pick up for newcomers."),
        const Text(''),
        const Text(
            "I was thinking about the rate of play issues from a programming viewpoint, and wanted to break it down in terms of its time complexity."),
        const Text("Every magic turn takes R + P + F(T(~90) + S(~90)) + E"),
        const Text("where"),
        const Text(
            "R is reading time, the time it takes to understand the board state of everything that is going on on your opponents' fields."),
        const Text(
            "P is preparation time, deciding what your gameplan is and what you want to do with your turn."),
        const Text(
            "F is the frequency of the amount of cards you play per turn that allow you to search your library for a card (usually somewhere between 1/4 and 2 in most decks)."),
        const Text(
            "T is tutoring time, the search time it takes to find a specific card in the remaining deck."),
        const Text(
            "S is shuffling time, the amount of time it takes you to shuffle your remaining deck."),
        const Text(
            "E is execution time, the amount of time it takes you to actually play out your turn."),
        const Text(''),
        const Text("Preparation Time - Multithreading vs Turning in sequence."),
        const Text(
            "There is a great deal of skill involved in Magic the Gathering. You need to be able to understand what your opponent is doing, and adjust your plan to every new board state that is introduced."),
        const Text(
            "Not everyone is a pro player and able to perfectly navigate the nigh infinite amount of sequences that can occur, but the two main cases All players need to consider is what they'll be doing if they hit their land drop, and what they're doing if they don't hit their land drop."),
        const Text(
            "What's more is it doesn't stop at your next turn. To make the correct play for this current turn, more skilled players will be planning for future turns so that they are making the correct move now."),
        const Text(
            "Unfortunately, regardless of skill level or how far down the road you're considering, this determination is revealed at the beginning of your next turn, and there's no way you can casually check the top card of your library to see what it will be, because it will determine your play on other players' turns."),
        const Text(
            "This requires turns to be planned out in sequence, which wastes all of the time that planning could be occuring on other players' turns."),
        const Text(
            "What I've come to realize is that if land drops were deterministic it would reduce the amount of preparation logarithmically that all players need to consider."),
        const Text(
            "Moreover, with consistent land drops all players should be able to accomplish multithreading in their turns."),
        const Text(
            "Having the ability to more accurately plan what you will be doing during your turn is paramount to creating good flow in a game of Magic, and is paramount to everyone enjoying themselves."),
        const Text(''),
        const Text("Reading Comprehension"),
        const Text(
            "With the ever increasing complexity of Magic rules, it becomes harder and harder to know what's going on on the table for a new player."),
        const Text(
            "When does Initiative trigger? What does The Monarch do again? Is it day or night? How many of your dice-represented tokens are tapped and how many are staying back? "),
        const Text(
            "Answering these questions is an uncommon occurance, and having to explain how a rule works (or worse, not remembering exactly how a rule works) takes a lot of time and greatly reduces "),
        const Text(
            "I think a lot about a card called The Hive. Tokens were a concept in Magic from the beginning of its creation, and yet many players take tokens for granted."),
        const Text(
            "Through my childhood tokens were very much a rarity, but the ones that appeared in Unglued and Invasion set a huge precedent for the game."),
        const Text(
            "Every card that makes a token has a token. So many of the complicated mechanics of each set are represented in tokens."),
        const Text(
            "They're used on the camera highlighted games of official matches, but where they're most important is right at home on the kitchen table."),
        const Text(
            "Plus, they're beautiful and customizable and can give a whole new feel to your deck."),
        const Text(
            "However, impromptu creation of tokens can dramatically increase the Execution time and stall play."),
        const Text(
            "For this reason it's vital to not only encourage, but require all the tokens that players create to be represented, and be prepared before the game in order to reduce the reading complexity of the board state."),
        const Text(''),
        const Text("Searching"),
        const Text(
            "In order to eliminate the time shuffling decks and the time searching for cards, one simply needs to eliminate F."),
        const Text("The frequency of searching your library for a card."),
        const Text(
            "Shuffling and searching are both expensive methods, and more often than not cannot be timed out in a way that they do not interrupt play."),
        const Text(
            "Thus, eliminating the ability to search a player's library completely is the simplest and most effective way to decrease the time complexity of our Magic turn."),
        const Text(
            'In lieu of "tutoring" (searching through the deck), I also wanted to enable Wishing instead. Wishing pulls a specific card from a smaller side pool of cards that do not need to be shuffled.'),
        const Text(
            "It's a little strange that EDH doesn't allow a sideboard in the first place, so I included 9 slots for a wishboard for every deck. Searching a deck of 9 presorted cards is a constant time function and can be ignored for time complexity."),
        const Text(''),
        const Text(
            "Thusly, I have created a ruleset that I feel solves these main issues with EDH that I've laid out."),
        const Text("No searching."),
        const Text("Required tokens."),
        const Text("Guaranteed land drops."),
        const Text(
            "With these principles I've created a ruleset that reduces the time complexity down to"),
        const Text("O((R - A) + log(P)** + E)"),
        const Text(
            "where Reading time is reduced by A, the amount of time that it takes to ask what something is or does or how it works."),
        const Text(
            "Prep time is logarithmically reduced because you no longer have to consider binary options (of making land drops or not making land drops) on the current and all future turns, and is also multithreading enabled(**). (Asterisked because multithreading does not decrease time complexity, but improves execution time of the function.)"),
        const Text(
            "All this allows you to focus on E - Executing your gameplan."),
        const Text(''),
        const Text(
            "I did make one more rule change that was unrelated to the time complexity thought project, and it is a pretty radical take on the fundamental commander design."),
        const Text(
            "I've done away with the legendary creature restriction on the commander card. Your commander doesn't even need to be a creature at all."),
        const Text(
            "I think EDH has created a very toxic design pattern in Magic the Gathering, where more and more creatures are being designed as legendaries simply to create a greater the market of EDH players."),
        const Text(
            "With the pool of potential commanders being flooded as it is, it has greatly watered down the restriction of using a legendary creature."),
        const Text(
            "Therefore I want to open the floodgates to more varied and wild interpretations of decks."),
        const Text(
            "Rather than pick a character to represent a deck, pick a favorite spell that really appeals to you and however you want to play the game."),
        const Text('I call it your "Signature Spell."'),
        const Text(
            "It may prove to be too powerful a change, but for now I'm excited to see what kind of wacky decks it can bring to the table."),
        const Text(''),
        const Text(
            "I've started exclusively playing this ruleset with my friend group."),
        const Text(
            "I designed the deck composition such that unless a deck is completely reliant on tutoring, or has a gimmick that it's all lands/no lands, almost any EDH deck can be converted into a tEDH deck, so my friends that have decks have been able to play with their cards without any issue. Usually all it takes is pulling out the tutors, fetches, sol rings, and trimming down a few cards."),
        const Text(
            "It's been a lot of fun, and we've seen consistently high powered interactive games where everyone was involved but able to play at a faster clip."),
        const Text(
            "Even creating a token deck has been a really novel deckbuilding problem to work around, and has changed the way I look at a lot of high powered cards."),
        const Text(
            "If you give it a shot, I really hope you and your friends have as great a time as we have."),
        const Text(''),
        const Center(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            runSpacing: 15.0,
            spacing: 15.0,
            children: [
              ResizeableImage(
                asset: 'assets/pics/mtg01setup.jpg',
                label: 'A table full of Magic the Gathering cards',
                imagesInWrap: 3,
              ),
              ResizeableImage(
                asset: 'assets/pics/mtg02table.jpg',
                label: 'A table full of Magic the Gathering cards',
                imagesInWrap: 3,
              ),
              ResizeableImage(
                asset: 'assets/pics/mtg03board.jpg',
                label: 'A table full of Magic the Gathering cards',
                imagesInWrap: 3,
              ),
            ],
          ),
        ),
        const Text(''),
        const Text(
            "All that being said, here are the rules to tEDH, in case you want to try it out yourself!"),
        const Text(''),
        const Text("tEDH decks must be composed of the following 100 cards:"),
        const Text("20 lands"),
        const Text("50 cards"),
        const Text("1 signature spell"),
        const Text("9 wishboard cards"),
        const Text("20 tokens and emblems"),
        const Text(''),
        const Text("Rules:"),
        const Text("1. Drawing"),
        const Text(
            "1a. if a card would cause you to draw or interact with the top card of your library (mill, scry, etc) you may choose what library to interact with for each instance"),
        const Text(
            "1b. if a card would allow you to check the top card of your library, you select which library you would like the card to be from, and then it remains the top card of your library until the next time you would draw or otherwise remove the top card of your library. Any cards designated as on top of your library must be drawn/otherwise removed before continuing to draw new cards from your main/lands library. Any cards that would put cards on top of your library shall also be treated this way."),
        const Text(
            "1c. if a card would be put on the bottom of your library it is designated as on the bottom of your library, and may only drawn from after drawing through both your land deck and your main deck until something would cause you to shuffle your library. Cards remain in the order they were placed on the bottom of the library, and will not be redesignated into main and land deck distinctions"),
        const Text(
            "1d. if something would cause you to shuffle your library, shuffle both your main deck and your lands deck"),
        const Text(
            '1e. When deciding whether to draw/effect the top card of your library, you must announce if you\'re choosing from "main"/"M" or "land"/L for each. When deciding on multiple cards you may choose to shortcut and announce them all at once (ex starting hand - 3 lands, 4 main), or you may announce one at a time as you draw/remove cards (ex M, L, M, M, L, L, 1M)'),
        const Text(
            "1f. if a card's effect would cause exiling from opponents libraries (eg Ragavan) - the person in control of the effect chooses the deck it takes from, unless there were already cards designated as the top of the library"),
        const Text(''),
        const Text("2. Searching"),
        const Text(
            "2a. Your cards cannot allow you to search your library. if a card you control would cause you to search your library for a card, it does nothing instead."),
        const Text(
            "2b. However, if an effect an opponent controls would cause you to search your library, you may do so. (e.g. if a card would destroy a land you control and allow you to search your library for a basic land to replace it)"),
        const Text(
            "2c. If a card would allow all players to search their libraries for a card, then the opponents of the card's controller may search, but the player who played the card cannot."),
        const Text(''),
        const Text("3. Tokens"),
        const Text(
            "3a. Must be able to represent your tokens with your token deck - you can produce tokens up to the amount included in your token deck. If you would produce a token of a type that you do not have a token of that type available in your token deck, it is not produced. Tokens that are destroyed are returned to the token deck"),
        const Text(
            "3b. Tokens include planeswalker emblems, which must be represented in your tokens deck to receive the emblem, board statuses like night/day and the monarch, dungeons, and poison."),
        const Text(
            "3c. Tokens do not have to be MTG sanctioned cards, but they do have to be prepared before the match begins, they must also specify all traits of the card - color, type, power/toughness, and any rules text on the token"),
        const Text(
            "3d. If a card would create a token under an opponent's control, the creator of the card must have a token to provide that opponent from their token deck. If one cannot be produced, the entire spell/ability fizzles."),
        const Text(
            "3e. special rule for initiative - Although one copy of The Undercity dungeon theoretically would work to maintain the initiative progress of all players, because of the necessity for other players to read the contents of the dungeon if they take Initiative, you must include three copies of The Undercity in your tokens deck to facilitate the use of these cards. One for yourself and the close side of the table to use, one for the opposite end of the table, and one to allow players to read without moving markers off of either of the two in play copies. You must also have one token to represent The Initiative (the same way you would represent who possesses The Monarch). In total, to include any cards that give players Initiative, they must have 4 tokens designated in their tokens deck"),
        const Text(
            "3f. special rule for poison - As a subset of rule 3b and 3d, Poison creates another special case in deckbuilding. There is a canon token representing Poison Counters in mtg. When assigning an opponent poison counters, this token must be provided to the opponent by the player dealing poison damage to them. When an opponent is given a poison token, they may then use dice/paper to keep track of how many poison counters are assigned to that player, but until a player has received a Poison Counters token, that number will remain at 0. One copy of a Poison Counter token in a player's token deck may be assigned to an opponent, and remains assigned to that opponent until that player loses the game or otherwise removes all of their poison counters, at which point the Poison Counter token returns to the assigning player's token deck and can be redistributed to the same or other players the next time they are given a poison counter. This means that while it is only necessary to have one poison counter token when swinging with a single lethal target like blightsteel colossus at a single player, to kill multiple players at the same time (blade of selves blightsteel colossus /  go wide + triumph of the hordes), you must have a poison counter token for each player being assigned damage in that combat step. Any players not assigned poison counter tokens will not receive poison tokens. Furthermore, creatures with infect dealing damage to players without an assigned Poison Counter token cannot reassign their damage as regular damage, it still attempts to create poison tokens and cannot."),
        const Text(
            "3g. Copy tokens - any card that would create a copy must be assigned a Copy token from the token deck. If the copies will survive past the end of the turn (i.e. when they do not have sacrifice at end of combat triggers like myriad and similar abilities) it is encouraged to bring some kind of paper to write and mark what the copies are representing. Because copy tokens cannot be prepared beforehand (other than saying copy), it is the best scenario to use dry erase tokens or blank tokens, allowing you to provide more detail about what the copy is. As such any blank/dry erase tokens in a player's token deck are designated as Copy tokens, and can only represent Copies. Other tokens that are specified as non-copies cannot be redesignated as copies, and vice versa."),
        const Text(
            "3h. Copying spells clarification - copy tokens are only needed to represent permanents on the board, if a spell is being copied it is not necessary to have a representative copy token for any spells on the stack."),
        const Text(''),
        const Text("4. Your Signature Spell"),
        const Text(
            "4a. your commander card can be any card, and it is called your Signature Spell. However, your signature spell's color identity is determined slightly differently."),
        const Text(
            "4b. Your signature spell can only leave the command zone once per turn."),
        const Text(
            "4c. your signature spell only contributes colors of its casting cost to your commander identity. kicker costs and addendums to casting cost count (including cards that say you may cast any number of colors to cast this spell), but other mana symbols in rules text do not. Either/Or pips in casting cost contribute both colors to the signature spell's color identity. If your spell has multiple ways to cast it (split cards, adventure cards, MDFCs) then any of the ways that allow you to cast a spell contribute to the color identity."),
        const Text(
            "4d. cards in the main and wishboard have their color identity determined as normal - any mana symbols in rules text count. The only exception to this rule is that either/or mana symbols may be ignored as long as one of the either ors is included in your commander's color identity. All cards in all decks must be of the signature spell's color identity."),
        const Text(
            "4e. Signature spells may change zones and accrue casting cost in the same way that commanders do. When an instant or sorcery spell is cast it goes from the stack to the graveyard, and may re enter the command zone from the graveyard. When a signature spell enters the command zone it costs 2 more to cast cumulatively. If a spell has multiple ways to cast it, the cumulative cost applies to each of them."),
        const Text(
            "4f. Cards with the ability Partner are still valid as signature spells. If a partner is used as a signature spell the second deck slot to include it is taken from the Wishboard rather than the Main deck. Thus, there are two signature spell cards, the wishboard deck is reduced to 8, and the main deck remains 50 cards."),
        const Text(''),
        const Text("5. General"),
        const Text(
            "5a. Decks are required to have 5 different sleeve colors for the different types of cards (Signature Spell, Main, Land, Wishboard, Tokens), so that they are visibly distinguished from each other. This facilitates shuffling and returning cards to their proper zones when removed from play. This also causes lands and main deck cards to be differentiable in players' hands, but that helps everyone to keep track of known information, as all draws should have been announced in accordance with rule 1e."),
        const Text(
            "5b. Companion clarification - cards with the Companion ability may be used from the Wishboard, so long as the deck satisfies their companion restriction. At the start of the game players with companions should reveal them in their wishboard in accordance to the Magic the Gathering Comprehensive Rules on Companions."),
        const Text(''),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Text(
                "The ban list of tEDH follows the EDH banlist. Unless specified here as an explicitly allowed or banned card, you can check the official Commander banned list directly"),
            TextButton(
              onPressed: () async {
                final Uri url = Uri.parse(
                    'https://mtgcommander.net/index.php/banned-list/');
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
              child: const Text('on the official website.'),
            ),
          ],
        ),
        const Text(''),
        const Text("Banned Cards outside of the EDH standard banlist - "),
        const Text(
            '• "Nuisance" cards - cards that interrupt the flow of play with consistently appearing triggers that break the active player\'s train of thought, or otherwise slows the flow of play down Substantially (without impacting the board state).'),
        const Text(
            "• • Rhystic Study, Smothering Tithe, Esper Sentinel, Mystic Remora, Sensei's Divining top"),
        const Text(''),
        const Text(
            "• Unhealthy ramp - Primarily 0 and 1 mana permanent cards that give a non-sacrificial mana advantage, but also any cards that provide a disproportionate amount of mana compared to their casting/effectivity requirements."),
        const Text(
            "• • Anything with Mox in the name, Sol Ring, Mana Crypt, Ancient Tomb, Gaea's Cradle, Mana Vault, Dockside Extortionist, Mana Drain"),
        const Text(
            "• • watchlist: Grim Monolith, Basalt Monolith, Lotus Petal, Explore, Growth Spiral, Priest of Titania"),
        const Text(''),
        const Text(
            "TBD: Cards that allow the player to cast cards off the top of their library."),
        const Text(
            "-- this needs further testing before I can make a final decision, but cards with this mechanic are extremely potent in this format."),
        const Text(
            "• • watchlist: Winota, Demonic Consultation, Bolas's Citadel, Experimental Frenzy, Oracle of Mul Daya, Urza, Goblin Charbelcher"),
        const Text(''),
        const Text("Allowed Cards in tEDH - "),
        const Text("• Primeval Titan (Colossal Dreadmaw :) )"),
        const Text(
            "• Coalition Victory - Coalition Victory has not had an updated ruling since 2006, but I feel that the wording should invoke a coalition with the same rules of the Party mechanic. A Coalition is 10 permanents. A single multi-typed land or multi-colored creature can count for any of their types, but only counts as one member of the coalition."),
        const Text(
            "• • However, with it's allowed use it will be under testing and on the watchlist."),
        const Text(''),
        const Text("General Watchlist:"),
        const Text("• Companions, Cyclonic Rift"),
        const Text(''),
        const Text("The current EDH banlist as of 11/20/23 is as follows:"),
        const Text(
            "• Ancestral Recall • Balance • Biorhythm • Black Lotus • Braids, Cabal Minion • Channel •  Chaos Orb • Coalition Victory"),
        const Text(
            "• Emrakul, the Aeons Torn • Erayo, Soratami Ascendant • Falling Star • Fastbond • Flash • Gifts Ungiven"),
        const Text(
            "• Golos, Tireless Pilgrim • Griselbrand • Hullbreacher • Iona, Shield of Emeria • Karakas"),
        const Text(
            "• Leovold, Emissary of Trest • Library of Alexandria • Limited Resources • Lutri, the Spellchaser"),
        const Text(
            "• Mox Emerald • Mox Jet • Mox Pearl • Mox Ruby • Mox Sapphire • Panoptic Mirror • Paradox Engine"),
        const Text(
            "• Primeval Titan • Prophet of Kruphix • Recurring Nightmare • Rofellos, Llanowar Emissary"),
        const Text(
            "• Shahrazad • Sway of the Stars • Sundering Titan • Sylvan Primordial • Time Vault • Time Walk • Tinker"),
        const Text(
            "• Tolarian Academy • Trade Secrets • Upheaval • Yawgmoth’s Bargain"),
        const Text(''),
        const Text(
            "If you have any ideas for ways to improve the format or append the ban list or change a rule, I'm happy to hear it! Feel free to email me."),
        const Text(
            "And if you've made it this far and are curious about the name, tEDH is a kind of play on cEDH. Where cEDH is competitive EDH, and is a format full of tutors and searching, tEDH is tyro (meaning \"a beginner\") EDH - a format designed for novice players that explicitly bans searching."),
      ],
    );
  }
}
