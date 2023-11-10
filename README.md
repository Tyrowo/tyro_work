# tyro_work
my portfolio website 2.0, created in flutter


## Creative Decisions/Things to Revisit Way Later

it turns out for my other project I used a package called expandable, and used their ExpandablePanel, not the list tile. For now I've decided that I want to make this site with as many out of the box components as possible, so I'm going to stick with the native ExpansionPanelList and maybe revisit this concept later on. Really depends on if that dropdown arrow is too ugly to keep. It kind of is annoying but maybe it's good ux to show people that they're not just banners anyway. If only the color customizer actually worked lol

though i guess i'm being a little hypocritical because I don't want to learn how to finesse the animations myself... Taking the time to learn how to do animations myself seems like overkill?

## Deployment To-Do
done - set up nameservers for webhosting

investigate this concept of deploying to webassembly instead of javascript. (build web --wasm) Since this is a simple page maybe web assembly would be able to improve performance? If it has a shorter boot up time then hell yeah.
https://docs.flutter.dev/platform-integration/web/wasm

## Work That's Further off - Content and Fine Tuning Responsive Design


fill the body with the descriptions of the projects

need to make image change dynamically with viewport size
need to have fonts change size dynamically with viewport size
consider cropping bottom of profile pic like jaime suggested

get image in the right resolution for web

update resume
make a link to my resume
-- can your resume just take up a whole screen? with a download and share link? ooh that'd be tight

figure out how to rotate text.
-- what angle? 

maybe add an animation on all the main screen stuff so that it comes in one at a time and you see the background for a sec?
figure out how to do that squarespace fadein animation after scrolling to certain points
maybe set a variable trigger on a scroll controller when reaching+being within certain values
maybe pay for that animation class video

thought pieces - work more on magic time complexity
thought pieces - grill guide algorithm lol
thought pieces - A Year of Leetcode
-- will need to figure out how to set the texttheme for the article since it's a widget that can't access the context currently

change tyrowo inked to - tyrowo inked + portfolio website 1.0
then add a second project for randomized leopard print background + portfolio website 2.0

study flutter_animate package
apply animations to stuff
fade in for initial image and text
[widget].animate(target: _scrollbarposition == ? 1 : 0).slideX()
[widget, widget, widget].animate(interval : seconds).[animationtype]() // animates a list of widgets in sequence
shimmer on Rockstar Developer text, test that or maybe wipe-across color change through my three colors
projects should swipe in from left, right, left as you scroll down that'd be cool
thought pieces at the end shouldn't be animated they can just chill


## Getting Started To Do - Groundwork
done - import image assets
done - set up favicon 
done - figure out tiled background image
done - -- have content go over it. Stack? with that and the rest of the content in a column?
done - set up splash
done - figure out randomization of image to different stored assets.
done - see how to install a custom font, I'm pretty sure I had one as an asset in the other project so look up how I did that
done - get jill to resize my profile image
done - upload color references in a folder to be collected with the rest of the repo for posterity

done - set up theme data
done - set up light and dark themes
done - see if the scaffold body theme color applies to all containers in that color? if so that would be great
done - cardtheme**, primaryswatch, scrollbartheme, divider theme? textbutton theme, elevated button theme, textselection theme, switch theme, texttheme, floatingactionbutton?, scaffold background? (should never be visible in this project)
done - see if the color in the theme can be based off getting from the localstorage ?? dark
done - decide if app bar should be blue or in the light/dark color
done - -- light dark might look nice with some transparency

done - associate light/dark & fonts with switches
done - need to import that local storage package
done - solution for passing state from the child (screen) widget to the parent (main) that updates the theme
done - -- https://stackoverflow.com/questions/51798498/flutter-setstate-to-another-class/51798698#51798698

done - decide if things should come up from below scrolling upwards (with like a card to cover the corners) 
nah - Work With Tyro -> scroll down
done - image comes up with "the rockstar developer you've been looking for" -> scroll down
done - card comes up with projects-- projects are in horizontal tiles just showing the image and then those scroll down
// maybe scrolls could be lengthed by deviceheight, every time you scroll a device height you go to a new section

done - projects - tiled images
done - container for the projects needs to stretch all the way to the edges and card doesn't do that because of built in padding, probably need to just create a custom container for that
done - -- is there a way to make sure that it can crop or expand to be responsive? - using cover
* equidistant
* procrastination buster
* tyrowo inked
done - project tiles animated expand to show description of the project, link to where it's published
done - maybe if the project tiles have a less transparent or even opaque version of the card color it'll make a nice gradient.
https://medium.com/flutter-community/flutter-widgets-boxes-part-2-the-whole-picture-4bb142f0b1ab#:~:text=cover%3A%2D%20It%20sets%20its,BoxFit.
done - -- use cover property so that it adjusts with width
https://www.youtube.com/watch?v=2aJZzRMziJc
done - -- use expansion panels and expansion panel lists, they have an animated property to customize instead of doing separate animated boxes, and the list can make sure that no more than one are expanded at a time
done - need to set animated property of expansion panels - there aren't really any

done - figure out how you want to set up the thought pieces section. Maybe just one item expansionpanellists? - no, created my own animatedboxes
done - wrap the think pieces in MouseRegion widgets to change the animated sized box onHover, will need to fix the conditional logic for setting the size on gesture detector though
done - Make their contents a single child scroll view in case we manage to go over a whole screen of text, that will make the responsiveness easy too
done - turn the thought pieces containers into their own self contained classes - would this work with their variables? would make the whole homescreen much cleaner without floating global variables
need to make the fill text widget a variable that is replaced on setstate too, that way title can be centered until it expands
done - need to think of an elegant way to keep the text from resizing with the hover size change.
done - should you also color the container a little darker? - made opaque on hover and selected
done - instead of using a card inside the animated container we just need to make a fully customized animated container with rounded edges and color and padding properties that will all be variables that change in motion
done - I think I should refactor the thought pieces class to take a text title on unselected and a Widget on selected, and that way you can customize the full article however you want with pictures and whatnot.


socials + contact "screen"
set up socials and contact screen as a footer. 
-- email, linkedin, github, leetcode, twitter, facebook, instagram (used to have reddit, discord, twitch, but I think those are unnecessary as well as youtube)
-- tooltip indicators on each of the socials to clarify
email link should open up to email

set up the scrollbarcontroller ->
use the scrollbar controller to make the contact button go to the bottom of the page

above the divider for the footer on the bottom right there should be like a pseudo fab just an elevated button there that takes you back to the top of the screen



reworking the banner dropdowns - theyre too big. simply too big. need to come up with a way to make them smaller without ruining the resolution.