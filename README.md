# tyro_work
my portfolio website 2.0, created in flutter


## Work That's Further off

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

socials

set up webhosting - should be able to just copy settings via porkbun from last site

study flutter_animate package
apply animations to stuff
[widget].animate(target: _scrollbarposition == ? 1 : 0).slideX()
[widget, widget, widget].animate(interval : seconds).[animationtype]() // animates a list of widgets in sequence

## Getting Started To Do
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

associate light/dark & fonts with switches
need to import that local storage package
solution for passing state from the child (screen) widget to the parent (main) that updates the theme
-- https://stackoverflow.com/questions/51798498/flutter-setstate-to-another-class/51798698#51798698

decide if things should come up from below scrolling upwards (with like a card to cover the corners) 

Work With Tyro
-> scroll down
image comes up with "the rockstar developer you've been looking for"
-> scroll down
card comes up with projects
-- projects are in horizontal tiles just showing the image and then those scroll down
// maybe scrolls could be lengthed by deviceheight, every time you scroll a device height you go to a new section

project tiled images
-- is there a way to make sure that it can crop or expand to be responsive? - using cover
* equidistant
* procrastination buster
* tyrowo inked
project tiles animated expand to show description of the project, link to where it's published
maybe if the project tiles have a less transparent or even opaque version of the card color it'll make a nice gradient.
https://medium.com/flutter-community/flutter-widgets-boxes-part-2-the-whole-picture-4bb142f0b1ab#:~:text=cover%3A%2D%20It%20sets%20its,BoxFit.
-- use cover property so that it adjusts with width


