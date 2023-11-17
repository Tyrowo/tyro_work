# tyro_work
my portfolio website 2.0, created in flutter


## Creative Decisions/Things to Revisit Way Later

it turns out for my other project I used a package called expandable, and used their ExpandablePanel, not the list tile. For now I've decided that I want to make this site with as many out of the box components as possible, so I'm going to stick with the native ExpansionPanelList and maybe revisit this concept later on. Really depends on if that dropdown arrow is too ugly to keep. It kind of is annoying but maybe it's good ux to show people that they're not just banners anyway. If only the color customizer actually worked lol
>> building my own widgets for the banners was pretty cool and looks much better now

though i guess i'm being a little hypocritical because I don't want to learn how to finesse the animations myself... Taking the time to learn how to do animations myself seems like overkill?
>> well I decided to do it anyway. the only thing I used a plugin for was a rainbow tween, and learning how to use animatedboxes and the opacity effects were the simplest forms of animation, but it was still nice learning how to play around with it myself. 

add stackoverflow profile to socials if I get enough karma that it's not just a fresh account

should I make text selectable or no? - https://stackoverflow.com/questions/73057700/flutter-make-text-images-selectable-in-whole-web-app

I don't think you can make the overlay button materialproperty alternate between two colors, but at least I got some stackoverflow karma - https://stackoverflow.com/questions/77467214/flutter-can-i-make-my-materialstatepropertycolor-alternate-between-colors-on
maybe one day someone will respond a solution

page transitions seem outside the scope of this project (mostly because it's primarily a one-page website), but page transitions might be neat especially to go to the resume page - https://api.flutter.dev/flutter/material/PageTransitionsTheme-class.html

## Deployment To-Do
done - set up nameservers for webhosting

investigate this concept of deploying to webassembly instead of javascript. (build web --wasm) Since this is a simple page maybe web assembly would be able to improve performance? If it has a shorter boot up time then hell yeah.
https://docs.flutter.dev/platform-integration/web/wasm

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

done - figure out how you want to set up the think pieces section. Maybe just one item expansionpanellists? - no, created my own animatedboxes
done - wrap the think pieces in MouseRegion widgets to change the animated sized box onHover, will need to fix the conditional logic for setting the size on gesture detector though
done - Make their contents a single child scroll view in case we manage to go over a whole screen of text, that will make the responsiveness easy too
done - turn the think pieces containers into their own self contained classes - would this work with their variables? would make the whole homescreen much cleaner without floating global variables
need to make the fill text widget a variable that is replaced on setstate too, that way title can be centered until it expands
done - need to think of an elegant way to keep the text from resizing with the hover size change.
done - should you also color the container a little darker? - made opaque on hover and selected
done - instead of using a card inside the animated container we just need to make a fully customized animated container with rounded edges and color and padding properties that will all be variables that change in motion
done - I think I should refactor the think pieces class to take a text title on unselected and a Widget on selected, and that way you can customize the full article however you want with pictures and whatnot.

done - set up socials and contact screen as a footer. 
done - need to create a new class for the socials button - it will take a string for the assetname, take a string for the tooltip label,
    the class will have a tooltip that appears on hover to show what the button is representing
    the class will take the asset and compress it down to a standard size for all of the different socials
    gesture detector over the picture so on link takes you to the site
done - -- email, linkedin, github, leetcode, twitter, facebook, instagram (used to have reddit, discord, twitch, but I think those are unnecessary as well as youtube)
done - -- tooltip indicators on each of the socials to clarify
done - email link should open up to email

done - reworking the banner dropdowns - theyre too big. simply too big. need to come up with a way to make them smaller without ruining the resolution.
  okay how to design them?
  they should be a sizedbox for the banner and the sizedbox is ht 100, width is a proportion of the screen length
  // and then under a certain viewport width it should collapse to 50 and whatever viewport width
  outside the sizedbox should be an animated box, which is constructed very similarly to the blog post container
    the difference will be that we have to make the child a column that contains the banner and contains null when turned off and contains the banner and a content widget when it's turned on
  is there a way to add a color transition to the box as it's opening up?
  // as an aside working with these animated box widgets feels very cool.
  maybe have a cliprect of 0 for the top always and x for the bottom only when it's expanded
  then you can add a little bit of space between the tiles so they don't looked so cramped too
    maybe give them a default padding?
  i guess the animated boxes should have a border so you know the underlying text is grouped with it?
done - change tyrowo inked to - tyrowo inked + portfolio website 1.0
done - then add a second project for randomized leopard print background + portfolio website 2.0


## Phase 2 - Responsiveness and Animations
done - set up the scrollbarcontroller ->
done - use the scrollbar controller to make the contact button go to the bottom of the page
done - above the divider for the footer on the bottom right there should be like a pseudo fab just an icon button there that takes you back to the top of the screen -- vertical_align_top
done - need to make image change dynamically with viewport size
done - need to have fonts change size dynamically with viewport size
-- especially title fonts. the minor text fonts can stay the same
impossible - allow drag scrolling with mouse, it's annoying that that needs to be specified but whatever. I enabled "mouse drag scrolling" but that isn't the same as center mouse button click scrolling. Because flutter is so mac oriented it seems that this is actually impossible as of this moment

won't do - consider cropping bottom of profile pic like jaime suggested
it's good - get image in the right resolution for web
won't do - maybe decrease saturation or blur the edges of the picture - mom suggestion
won't do - figure out how to rotate text.-- what angle? 

done - maybe add an animation on all the main screen stuff so that it comes in one at a time and you see the background for a sec?
won't do - figure out how to do that squarespace fadein animation after scrolling to certain points
  maybe set a variable trigger on a scroll controller when reaching+being within certain values
  nah - maybe pay for that animation class video
won't do - study flutter_animate package
apply animations to stuff
done - fade in for initial image and text
won't do - [widget].animate(target: _scrollbarposition == ? 1 : 0).slideX()
[widget, widget, widget].animate(interval : seconds).[animationtype]() // animates a list of widgets in sequence
won't do - projects should swipe in from left, right, left as you scroll down that'd be cool
think pieces at the end shouldn't be animated they can just chill - this is too much

can't do - maybe advance the button highlighting color so it pulses pink and green while hovered, and blue when clicked
  instead of using real animation maybe you could use a delayed 

done - shimmer on Rockstar Developer text, test that or maybe wipe-across color change through my three colors
  dang I really love this flickering effect - duration: const Duration(milliseconds: 80), vsync: this); but it's like illegal I don't want to give someone a seizure
  -- had to add shadow effect to text for visibility on light mode

## Phase 3 - Content

do i put fittedbox or scrollbar into text fields?

damn i really just can't figure this out. - set up scroll controllers so whenever you click on one of the fields it makes it the top of the screen. kind of annoyig to open the section below but whatever, passing the scrollbar around sucks. and I can't get it to find a position

update resume
make a link to my resume
-- can your resume just take up a whole screen? with a download and share link? ooh that'd be tight

fill the descriptions of the projects
project articles {
procrastination buster - https://chrome.google.com/webstore/detail/tyrowos-procrastination-b/ecdedcllldeigficjfdbjgepojogaepe?hl=en-GB

make pictures zoomable on tap, so that it pops out to like an alert when you click on it

website 2.0 thoughts - talk about leopard, talk about flutter limitations (seo, no middle mouse button clickscrolling)
}

think pieces - work more on magic time complexity
think pieces - grill guide algorithm lol - definitely not for now but maybe one day
think pieces - A Year of Leetcode
-- will need to figure out how to set the texttheme for the article since it's a widget that can't access the context currently
