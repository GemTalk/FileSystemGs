# FileSystem for GemStone/S

Port of Pharo FileSystem implementation derived from [pharo-project/pharo](https://github.com/pharo-project/pharo).

## Installation

1. Set Environment variables
	1. `ROWAN_PROJECTS_HOME`
	2. `TOPAZ_SRC_DIRECTORY` - topaz src files will be generated into this location
	3. `GEMSTONE`
	4. `ARCHBASE` - should correspond to the repo version used to build `$GEMSTONE`
2. Clone repositories in `$ROWAN_PROJECTS_HOME`
	1. FileSystemGs
		- URL: `https://github.com/GemTalk/FileSystemGs`
		- Branch: `development`
	2. Rowan
		- URL: `https://github.com/GemTalk/Rowan`
		- Branch: `kurt.IntegrateWithFileSystemGs`
3. Start NetLDI
4. Start Stone with a Rowan extent
5. Generate topaz source files by evaluating `$ROWAN_PROJECTS_HOME/FileSystemGs/scripts/read_and_write_file_system.gs` in topaz.
7. Restart Stone using a non-Rowan extent.
8. Install Rowan and FileSystemGs by evaluating `$ROWAN_PROJECTS_HOME/FileSystemGs/scripts/installRowan.tpz` in topaz.
9. Load test cases by evaulating `(Rowan projectNamed: 'Rowan') loadProjectSet: Rowan platformConditionalAttributes, #('tests' 'v2' 'v2Only' 'testsV2' 'stubs' 'tonel')` in Topaz. Ensure you commit after this expression if you want the tests to stick around.

