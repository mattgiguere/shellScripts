# shellScripts
**My personal collection of useful shell scripts**

[![MIT-Lic](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/mattgiguere/shellScripts/blob/master/LICENSE)

###Descriptions
---------------------------------
- **term.sh**: A script for opening a new Mac OS X terminal window with the desired command, window settings, size, and position. It is based on [David Moles' response](http://stackoverflow.com/a/28373404/3854235) to [this](http://stackoverflow.com/questions/4404242/programmatically-launch-terminal-app-with-a-specified-command-and-custom-colors) [stackoverflow](stackoverflow.com) question, but tweaked to optionally set the size and position.
The syntax is
```sh
term.sh "command" "window settings" width height y-position x-position
```
For example
```sh
term.sh "echo 'hello world'" "Novel" 640 320 500 50
```
-**newdwin**: create a new Terminal window using my "DeskNames" settings. Here's the result:
![DeskNames Example](images/DeskNames.png)
