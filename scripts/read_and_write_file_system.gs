! Class implementation for 'RwAllowChangeRepositoryRevisionOnResolveNotification'

!   Class methods for 'RwAllowChangeRepositoryRevisionOnResolveNotification'

category: 'Instance creation'
classmethod: RwAllowChangeRepositoryRevisionOnResolveNotification
signal: aRwProjectLoadSpecificationV2
  "An exception of the type associated with the receiver is signaled."

  ^ self new
    loadSpecification: aRwProjectLoadSpecificationV2;
    signal
%

run
	| projectSetModification visitor gsDirectory project projectSetDefinition fileSystemProject thePackageDict |
	gsDirectory := '$GEMSTONE_STONE_DIR'.
	project := Rowan 
		projectFromUrl: 'file:$ROWAN_PROJECTS_HOME/Rowan/rowan/specs/Rowan.ston'
		gitUrl: 'file:$ROWAN_PROJECTS_HOME/Rowan'.
	projectSetDefinition := project defined _resolvedProject readProjectSet.
	fileSystemProject := Rowan
		projectFromUrl: 'file:$ROWAN_PROJECTS_HOME/FileSystemGs/rowan/specs/FileSystemGs_dev.ston'
		gitUrl: 'file:$ROWAN_PROJECTS_HOME/FileSystemGs'.
	projectSetDefinition definitions removeKey: 'FileSystemGs'.
	projectSetDefinition addProject: fileSystemProject _resolvedProject.
	thePackageDict := (projectSetDefinition definitions at: 'Rowan') _projectDefinition packages.
	{ 
		'Rowan-GemStone-Kernel-Stubs-36x' .
		'Rowan-Tonel-Core' .
		'Rowan-Tonel-GemStone-Kernel-32-5' .
		'Rowan-Tonel-GemStone-Kernel' .
	} do: [:packageName | thePackageDict removeKey: packageName ifAbsent: [] ].
	thePackageDict := (projectSetDefinition definitions at: 'STON') _projectDefinition packages.
	{ 
		'STON-Core' .
		'STON-GemStone-Kernel'.
		'STON-GemStoneBase' .
		'STON-GemStoneCommon' .
		'STON-GemStone-Kernel36x' .
	} do: [:packageName | thePackageDict removeKey: packageName ifAbsent: [] ].
	projectSetModification := projectSetDefinition compareAgainstBase: RwProjectSetDefinition new.
	visitor := RwGsModificationTopazWriterVisitorV2 new
		logCreation: true;
		repositoryRootPath: gsDirectory;
		topazFilename: 'RowanFileSystemGs';
		yourself.
	visitor visit: projectSetModification.
%
