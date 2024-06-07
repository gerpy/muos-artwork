# This script calls xml2txt.ps1 in every subfolder
# It is supposed to sit at the root of the ROMs folder (with system subfolders typically)
# It also cleans ARRM temp files (if adequate lines are uncommented)
# It results in text/romname.txt files with information drawn from the gamelist.xml files
# The "text" folders are at at the same level as the box and screenshots folders
# They will need to be moved in the adequate MuOS location by other means

if (!(Test-Path "$PSScriptRoot\xml2txt.ps1")) {
	Read-Host "xml2txt.ps2 absent"
	Return 1
}

Get-ChildItem -Directory | ForEach-Object {
	Set-Location "$($_.FullName)"
	Write-Host "$PWD"
	Write-Host "$PSScriptRoot"
	Write-Host "====="
	
	Copy-Item -Path "$PSScriptRoot\xml2txt.ps1" -Destination "$PWD\process-one-game-list.ps1"
	
	./process-one-game-list.ps1
	

	Remove-Item "$PWD\process-one-game-list.ps1" -Force -Confirm:$false -ErrorAction SilentlyContinue -ErrorVariable removeErrors
	# For use with ARRM : clean
	# Remove-Item "$PWD\gamelist_ARRM.xml" -Force -Confirm:$false -ErrorAction SilentlyContinue -ErrorVariable removeErrors
	# Remove-Item "$PWD\gamelist_tempo_old.xml" -Force -Confirm:$false -ErrorAction SilentlyContinue -ErrorVariable removeErrors
	}

Set-Location "$PSScriptRoot"