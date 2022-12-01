# MacCrafter V1.0
Frontend GUI for managing MidJourney Prompts. It uses an autohotkey gui to create a prompt from text and selections, then targets Discord to type in an /imagine prompt. The default target is the MidJourney chat bot. There is more info in the help section on how to retarget this to channels in the MidJourney server if you're using it for free, or would rather use one of the channels. 

I wrote this for myself because I didn’t want to have to remember the names of all those artists or various properties to play around with. This allows you to type in your text, make some selections to build that up, and see what MidJourney does with it. Then, when it’s not quite right, you can go back to the UI, make a different selection for a style, artist, or whatever, and hit /imagine again without having to copy/paste/tweak over and over in Discord.

Being based on autohotkey means it only works on MS Windows.

![screenshot](/screenshot-ui.png)

# If you simply want to run it and not install anything:

You can download the zip, unzip it and run MacCrafter.exe. 
Read the help from the help button on the right toolbar.

------------------------------------------------------

# If you want to tweak the script:

Clone this repo.

Install the latest version of autohotkey, then edit/use midjourney.ahk.

If you know anything about autohotkey, the script should be easy to manipulate and tweak.

Don't change the file structure (i. e. images or tmp folder locations)

The images folder contains images that shows examples of what to expect from a render using the choice by itself.

You can add new choices in the MJdata.txt file, then render using that choice to generate an example image for the images folder. It uses the choice name as a way to find it with an underscore between words in multiword names. When rendering, drag over the image after clicking to blow it up in discord. Don't use the "view original" version; it's too big. There is more info in the help section of the app.

If you make changes and want to contribute, please do so on the Github repo. 
https://github.com/tes735/MacCrafter

------------------------------------------------------

To recompile, you'll need autohotkey installed. Right click on the .ahk file and choose "compile script."
