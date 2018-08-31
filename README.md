# FileSystem for GemStone/S

Port of Pharo FileSystem implementation derived from [pharo-project/pharo](https://github.com/pharo-project/pharo).

```
## GsDevKit_home installation for GemStone3.2.15

# GsDevKit_home installation
#
git clone https://github.com/GsDevKit/GsDevKit_home.git
cd GsDevKit_home
. bin/defHOME_PATH.env    # define GS_HOME env var and put $GS_HOME into PATH
installServerClient

# create a filesystem stone
#
export stone_name=filesystem_3215
createStone -fg $stone_name 3.2.15

# clone Rowan
#
cd $GS_HOME/shared/repos
git clone git@github.com:dalehenrich/Rowan.git

#clone FileSystemGs
#
cd $GS_HOME/shared/repos
git clone git@git.gemtalksystems.com:FileSystemGs.git


# setup custom_stone.env for netldi and FileSystemGs build script
#
cat -- >> $GS_HOME/server/stones/$stone_name/custom_stone.env << EOF
export ROWAN_PROJECTS_HOME=\$GS_HOME/shared/repos
EOF

stopNetldi $stone_name
startNetldi $stone_name

ln -s $GS_HOME/shared/repos/FileSystemGs/platforms/gemstone/gsdevkit/stones/newBuild_SystemUser_rowan_filesystem \
	$GS_HOME//server/stones/$stone_name/

# install Rowan and FileSystemGs into a fresh stone
#
$GS_HOME/server/stones/$stone_name/newBuild_SystemUser_rowan_filesystem
```

## Useful Smalltalk expressions
```smalltalk
Rowan projectTools load
    loadProjectFromSpecUrl: 'file:$ROWAN_PROJECTS_HOME/FileSystemGs/rowan/specs/FileSystemGs.ston'.
Rowan projectTools delete 
	deleteProjectNamed: 'FileSystemGs'.
```

