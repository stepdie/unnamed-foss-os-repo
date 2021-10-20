## *The Who, What, Where, and Why of this repository*
### What:
The goal of this project is to create a privacy-centered Free and Open Source operating system. The name "unnamed" stems from the fact that I have yet to come up with an official name for the project.

_For clarification, the 'free' in 'free and open source' means 'free' as in 'free speech', not 'free candy'. Some people do not know this distinction._
### Why:
Many people in the Linux community, myself included, are tired of corporate cuckoldry, closed-source shadow-creeping, and backdoor filled software. But it's not just about this garbage, its about respecting freedom of the individual, a God-given freedom.
### Where:
This repository, of course. Also a Discord server, which is currently closed to new members.
### Who:
I am not actually doing much of the work as of yet since I am new to the scene. Most work will be done by the currently anonymous developers. If you wish, you can contact me via the `CONTACT OWNER` button on my (currently parked) [site].

[site]: <https://neet.international>

## Building

### Requirements
> git  
> posix shell  
> gnu make  

### Instructions
git submodule init
cd toybox
make defconfig
make menuconfig # enable the toybox shell in the pending section   
make 
make root LINUX=$PATH_TO_LINUX_KERNEL
