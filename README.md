# VJmes' Dotfiles & Profiles
This is a recompilition of numerous dotfiles I've half-written over many years but never consistently homogenised across systems. The goal here being to keep a standard, compatible profile for both bash and zshell across a wide range of systems and distributions.
The approach here is to keep the structure flat, with some segmentation to allow for specific function files to be dropped in and out as needed.

For the interim there is a desire to maintain both zShell & Bash compatibility, though eventually everything will likely be rolled-over to zShell purely.

## Included Files 
| Filename | Purpose | Shell | Notes |
| --- | --- | --- | --- |
| **.bashrc** | The default bash profile | Bash | 
| **~/pureline** | Repo of the pureline terminal caret utility | Bash |
| **.purelinerc** | Settings file for pureline | Bash |
| **.sysfuncsrc** | Collection of system functions/utilities | Bash |
| **.netfuncsrc** | Collection of network-based functions/utilities | Bash |
| **.pylintrc** | Customization for the pylinter | N/A |
| **.vimrc** | VIm customizations/settings | N/A |
| **.zshrc** | The default zshell profile | ZShell |
| **.p10k** | Powerline10K customization of terminal caret | ZShell |

## Installation
To drop all these files into the local user's home directory, run the below:
```bash
git clone https://github.com/VJmes/combined-profiles
cp -rp combined-profiles/* ~/.
```

## Final Note
This is still very much a work in progress, fork it, clone it, do what you want with this but there's still a lot missing and new functions are constantly being added/reworked.