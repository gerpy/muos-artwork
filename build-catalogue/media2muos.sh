# This script assumes that ROMS have been scraped with "screenshots", "covers" and "texts" folders in the system folders
# System folders are supposed to be subfolders of the current folder (scriptfolder)
# The "covers", "screenshots" and "text" folders are copied to the a target catalogue folder (see below) and then according to https://muos.dev/help/artwork

# Root folder of the MuOS metadata
$targetCatalogue = "$PSScriptRoot\..\MuOS Catalogue"

if (!(Test-Path "$targetCatalogue")) {
	Read-Host "::Target $targetCatalogue not present (press enter then change script):"
	Exit
}

# Loop systems/folders
Get-ChildItem -Directory | ForEach-Object {
	Set-Location "$($_.FullName)"
	
	# Ensures that all the MuOS pictures and text folders exist
	# Otherwise, skip folder
	if ((!(Test-Path "$PWD\screenshots")) -or (!(Test-Path "$PWD\covers")) -or (!(Test-Path "$PWD\texts"))) {
		Write-Host "-- Skip $PWD --"
	}
	else {
		Write-Host "++ Process $PWD ++"
	
		######
		# Process one particular folder ($PWD)
		######
		
		# By default, the MuOS system is the name of the current folder
		$muosSystem = "$($_.Name)"
		Write-Host "Folder : $muosSystem"				

		# Unless there is a muos-system.txt file in the folder
		if (Test-Path "$PWD\muos-system.txt") {
			# In this case, just read the first line of the file and set muosSystem unless the first line is a comment
			$firstLine = Get-Content -Path "$PWD\muos-system.txt" | Select-Object -First 1
			if (!($firstLine.SubString(0,1) -eq "#")) {
				$muosSystem = $firstLine
			}
		}
		Write-Host "System : $muosSystem"

		# Create system folders in catalogue if don't exist
		if (!(Test-Path "$targetCatalogue\$muosSystem")) {
			New-Item "$targetCatalogue\$muosSystem" -Type Directory 
		}
		if (!(Test-Path "$targetCatalogue\$muosSystem\covers")) {
			New-Item "$targetCatalogue\$muosSystem\box" -Type Directory 
		}
		if (!(Test-Path "$targetCatalogue\$muosSystem\screenshots")) {
			New-Item "$targetCatalogue\$muosSystem\preview" -Type Directory 
		}
		if (!(Test-Path "$targetCatalogue\$muosSystem\text")) {
			New-Item "$targetCatalogue\$muosSystem\text" -Type Directory 
		}

		# Copy contents
		Copy-Item -Path "$PWD\covers\*" -Destination "$targetCatalogue\$muosSystem\box\" -Recurse
		Copy-Item -Path "$PWD\screenshots\*" -Destination "$targetCatalogue\$muosSystem\preview\" -Recurse		
		Copy-Item -Path "$PWD\texts\*" -Destination "$targetCatalogue\$muosSystem\text\" -Recurse		
	}

	# Reset current folder to script folder (not really useful)
	Set-Location "$PSScriptRoot"
}
