#!/bin/bash
#system.configureLocalGo.sh

printf "♓: configuring very local go into this shell\n"

whichGo=`which go`

if [ ! $whichGo = "/home/ubuntu/workspace/local/go/bin/go" ]; then
    export GOROOT=$HOME/workspace/local/go
    export PATH=$GOROOT/bin:$PATH
    
    [ -d "$HOME/workspace/go" ] || mkdir $HOME/workspace/go
    export GOPATH=$HOME/workspace/go
    export GOBIN=$GOPATH/bin
    export PATH=$GOBIN:$PATH
    
    printf "♓: Local go configured @ `which go`\n"
else
    printf "\n♓: This workspace appears to have Local Go already configured\n"
fi

complainAboutStrangeHolochainConfig () {
    printf "♓: .holochain directory configured strangely. If stuff isnt working, seek support @ (URL)\n"
}

initialiseHolochainInThisWorkspace () {
    printf "♓: Initialising Holochain in this workspace\n"
    printf "♓: Enter your seed ID for your holochain identity. This can be an email or some other identifier?\n"
    read holochainIdentity
    hcadmin --path=$HOME/workspace/.holochain init $holochainIdentity
}

# set -o xtrace

holochainDefaultPath="$HOME/.holochain"
holochainWorkspacePath="$HOME/workspace/.holochain"
holochainDefaultPathDev="$HOME/.holochaindev"
holochainWorkspacePathDev="$HOME/workspace/.holochaindev"

if [ -L "$holochainDefaultPath" ]; then
  	if [ "$(readlink -- "$holochainDefaultPath")" = $holochainWorkspacePath ] ; then
  	    if [ -d "$holochainWorkspacePath" ] ; then
  	        holochainInitialisationDate=`stat -c %y $holochainWorkspacePath/agent.txt`
  	        printf "♓: Holochain initialised in this workspace on $holochainInitialisationDate \n"
  	    else
  	        initialiseHolochainInThisWorkspace
  	    fi
  	else
  	    complainAboutStrangeHolochainConfig
  	fi
else
  	if [ -e "$holochainDefaultPath" ] ; then
  	    complainAboutStrangeHolochainConfig
  	else
  	    initialiseHolochainInThisWorkspace
  	    sudo ln -s $holochainWorkspacePath $holochainDefaultPath
  	    mkdir $holochainWorkspacePathDev
  	    sudo ln -s $holochainWorkspacePathDev $holochainDefaultPathDev
  	fi
fi

# set +o xtrace