# Fix Issue - "Windows File Paths Longer Than 255 Characters" when opening projects or deleting files 

Use the `subst` command to shorten the file path for the file(s). 

###Steps

map Z: to windows folder

	C:\>subst Z: C:\Windows

Show list of mappings

	C:\>subst
		 Z:\: => C:\Windows

Delete Z: mapping

	C:\>subst z: /D

Show mappings again (none)

	C:\>subst
	 	(blank)

References

- <https://support.code42.com/CrashPlan/4/Troubleshooting/Windows_File_Paths_Longer_Than_255_Characters>
- <http://superuser.com/questions/550205/unable-to-unmount-subst-drive>