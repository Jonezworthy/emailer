# PowerShell emailer
This script requires arguments!

Run with this command:
powershell.exe --windowstyle hidden (PATH TO SCRIPT) (to) (subject) (body)


I store this command as environment variable
e = powershell.exe -windowstyle hidden (PATH TO SCRIPT)
So I run it with

%e% person subject body

This script is domain locked (used at work, so I can't email people outside the company using this)