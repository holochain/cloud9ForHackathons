#!/bin/bash
#system.installHolochainOnCloud9.sh

#set -x

if [ -f ~/workspace/Scripts/holochain.system.holochainHasBeenInstalled ] ; then
    echo "♓: go appears to have been downloaded"
else
    
    
    mkdir -p ~/workspace/context/reality/programming/golang
    cd ~/workspace/context/reality/programming/golang
    wget https://storage.googleapis.com/golang/go1.9.2.linux-amd64.tar.gz
    mkdir ~/workspace/local
    tar -C ~/workspace/local/ -xf go1.9.2.linux-amd64.tar.gz
    
    go get -d -v github.com/metacurrency/holochain
    cd go/src/github.com/metacurrency/holochain
    git checkout develop
    make deps
    make
    
    mkdir -p ~/workspace/holochainApps/clutterGlobal
    cd ~/workspace/holochainApps/clutterGlobal
    git clone https://github.com/Holochain/clutter.git .
    git checkout develop
    
    touch ~/workspace/Scripts/holochain.system.holochainHasBeenInstalled
    
    echo "♓: HolochainOnCloud9 super local go is installed"
fi

if grep -q "holochain.314" ~/.profile ; then
    whichGo=`which go`
    if [ $whichGo = "/home/ubuntu/workspace/local/go/bin/go" ]; then
        echo "♓: HolochainOnCloud9 installed correctly"
    else
        echo "♓: HolochainOnCloud9 appears to be missinstalled. Please run:"
        echo "source ~/Scripts/holochain.system.configureLocalGo.sh"
        exit 1
    fi 
else
    echo "♓: installing HolochainOnCloud9"
    echo "" >> ~/.profile
    echo "[ -f ~/workspace/Scripts/holochain.system.onCloud9Marker ] && . ~/workspace/Scripts/holochain.system.configureLocalGo.sh && echo 'holochain.314' >> /dev/null" >> ~/.profile
fi

if grep -q "holochain.315" ~/.profile ; then
    if [ Scripts/confirmHolochainIsOnPath 2>1 > /dev/null ] ; then
        echo "♓: HolochainOnCloud9 path is set correctly"
    else
        echo "♓: HolochainOnCloud9 appears to be missinstalled. Please run:"
        echo "source ~/Scripts/holochain.system.configureLocalGo.sh"
        exit 1
    fi
else
    echo "♓: adding HolochainOnCloud9 Scripts to path"
    echo "" >> ~/.profile
    echo "export PATH=~/workspace/Scripts:\$PATH && echo 'holochain.315' >> /dev/null" >> ~/.profile
fi

printf "♓: HolochainOnCloud9 installed. To add to this shell run:\n\n  source ~/.profile\n\n"


#set +x
