# Holochain Build: Alpha 0 - Adventurer
This is a binary build of **Adventurer Alpha 0** and the proof-of-concept of Holochain as described in its [white paper](https://github.com/metacurrency/holochain/blob/whitepaper/holochain.pdf).

In Holochains current state, development should be considered safe only for the **adventurous**. We haven't validated holochain with any serious security audits, and we know there will still be some changes to the coding API, so applications built now will need modification to work with future versions of holochain.

In this package, you will find everything you need to run a node of our example Twitter clone "Clutter".

## Run example Clutter
This is mini-tutorial on how to initialize Holochain and start the example that came with these binaries.

### 1. Initialize .holochain directory

(Start from inside the directory where you unzipped the files.)

First, use the ```hcadmin init``` command to create the directory and default identity/keys for the holochain apps that will run on this computer. You will need to provide an agent id string, best done inside double quotes in case you have any spaces or special characters (e.g. "pebbles@flintstone.com" or "Fred Flinstone" or whatever identifying information you want to make available in holochain apps.)
```
./hcadmin init <system wide agent name>
```

### 2. Install Clutter on your machine
Second, install our Clutter (our P2P version of Twitter) as demo app to try out holochain. The command ```hcadmin join``` will copy an application into your ```~/.holochain``` directory. The first parameter is the path to find the source code and the second paramet is what you want to call the app on your machine.
```
./hcadmin join clutter clutter
```

### Then Run Clutter
The command, ```hcd <appname>```, starts up the Holochain daemon for the specified app. In this case, you can start the clutter application with some debugging output by typing:
```
./hcd --debug --verbose clutter
```
For **complete** debugging output, you can set an environment variable:
```
HC_ENABLE_ALL_LOGS=1; ./hcd --debug --verbose clutter
```

Once you're running hcd you can access the User Interface of your application in a web browser by putting typing ```http://localhost:3141``` into its address bar.

### Usage of Clutter
On first use, Clutter will ask for your handle, that is your user name. You can change it any time by clicking your handle at the top of the page or the according button.

You can create and post meows right away. In this releas, if you want to follow somebody, you will need to know their handle. Click "follow somebody", enter their username and click 'follow'.

## Next steps

 - Find more documentation in our [developer wiki](https://github.com/metacurrency/holochain/wiki)
 - Talk with by joining our [Mattermost chat](https://chat.holochain.net/signup_user_complete/?id=uc7j4tp8jbga78nw363gbgqdxc)
 - Find out about our funding campaigns at https://holo.host
