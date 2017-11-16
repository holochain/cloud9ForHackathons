# Welcome! to Holochain Hackathons on Cloud9
* Either you are at the venue, or hooking in remotely. You can share coding sessions with your group, or easily set up independent spaces
  * Request an invitation to the Cloud9 Holochain Hackathon Team
    * (Send email to HackathonCoordinator) mailto:, google form? spreadsheet?
  * receive email invitation to a cloud9 space 
    * I assume this will work properly if they already have an account. most likely.
  * Clone the "xyz" Barcelona hackathon workspace
    * We ask you to keep the workspace name simple, with no hyphens or other clever characters
      * the outward facing URL for a workspace doesnt seem to be clear if the Name has hyphens or underscores in it
      * photo

# Welcome! to Holochain Hackathons on Cloud9
## Initialise Holochain
* If you have completed the previous steps, you should/could be reading this on your new Cloud9 workspace!
  * Initialise your Cloud9 userspace to be easily compatible with Holochain
    * `make` or a script that calls make
## Connect to the global clutter
  * run the global clutter
    * there is a script for this, which calculates and presents the public facing URL and runs clutter on port 8080
      * its pretty and comfotable to use
      * cloud9 public facing URLs are only on ports 8080, 8081, 8082
    * connect with everyone
    * play some kind of embodied game to share handles with other hackathon people
## Connect to the Hackathon clutter
  * create a workspace cloning clutter
    * We ask you to keep the workspace name simple, with no hyphens or other clever characters
    * paste in this git URL into the git URL field
      * https://github.com/Holochain/clutter.git
      * photo
    * choose the "blank" workspace type
      * ![image](https://user-images.githubusercontent.com/239550/32902769-259a7ece-caa8-11e7-964e-087d3d524023.png)
    * if you are logged into cloud9, this link should take you to the Create Workspace page
      * https://c9.io/new
    * get the UUID for this Barcelona hackathon, insert it into the dna.json file
      * UUID= BARCELONA-0000-2039238740- whatever
      * this speaks to gently introducing people to the DNA filesystem, and to the idea that hashes are unique Holochain Apps, without being overly taxing
      * The dna.json file can editted directly in the Cloud9 editor
        * photos
    * run that holochain app
      * hcd etc...
      * this speaks to the education of the command line toold
      * Share handles with people again (this should be easy, use the same ones as last time
      * creates a "private" space for people to chat about this hackathon
      * can also be on port 8080
## Your Project
  * open hc-scaffold
    * videos?
    * create some kind of basic app
    * use hcdev init --scaffold (package?) to create the app from the scaffold data
    * what are we going to do about the interface? can we make a basic simple interface? That lets you pick an entry type and fill it in and submit it?
    * can we make a generic widget that calls the correct URL, with some kind of completely generic interface where its just easy to create the correct CRUD url, .... and output what?
