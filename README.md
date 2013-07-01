# Top Programming Fonts

My favorite programming fonts!

## How to install?
### Nix like (Linux, Mac, BSD, Solaris usw.)
`curl -L https://github.com/zzeroo/top-programming-fonts/raw/master/install.sh | bash`

### Windows (with Powershell.exe)
Windows 7 has the "Powershell" included, for older Versions down to WindowsXP you can install powershell as an optional Microsoft Update. 
If you do so then click START (down left) -> and **Run** and paste in this command.
```cmd
powershell.exe -Command "(new-object System.Net.WebClient).DownloadFile('https://github.com/zzeroo/top-programming-fonts/raw/master/install.bat','%temp%\install.bat')";  %temp%\install.bat
```

## How to use?
The fonts are installed right in standard placees. Call them from within any application like any other font.
Here are some sample configs for some apps that look good on my boxes.

### Vim
```viml
set guifont=Monaco\ 12
```



