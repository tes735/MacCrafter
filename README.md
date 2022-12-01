# MacCrafter
Frontend GUI for managing MidJourney Prompts. It uses an autohotkey gui to create a prompt from text and selections, then targets Discord to type in an /imagine prompt. The default target is the MidJourney chat bot. There is more info in the help section on how to retarget this to channels in the MidJourney server if you're using it for free, or would rather use one of the channels. 

Being based on autohotkey means it only works on MS Windows.

![screenshot](/screenshot-ui.png)

# If you simply want to run it and not install anything:

Run MacCrafter.exe and read the help from the help button on the right toolbar.

------------------------------------------------------

# If you want to tweak the script:

Install the latest version of autohotkey, then edit/use midjourney.ahk.

If you know anything about autohotkey, the script should be easy to manipulate and tweak.

Don't change the file structure (i. e. images or tmp folder locations)

The images folder contains images that shows examples of what to expect from a render using the choice by itself.

You can add new choices in the MJdata.txt file, then render using that choice to generate an example image for the images folder. It uses the choice name as a way to find it with an underscore between words in multiword names. When rendering, drag over the image after clicking to blow it up in discord. Don't use the "view original" version; it's too big. There is more info in the help section of the app.

If you make changes and want to contribute, please do so on the Github repo. 
https://github.com/tes735/MacCrafter

------------------------------------------------------

To recompile, you'll need autohotkey installed. Right click on the .ahk file and choose "compile script."
