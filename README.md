# QuickNotes

QuickNotes is a PowerShell script that allows you to create and append notes to a text file named for today's date. It is inspired by [noted](https://github.com/scottashipp/noted), a similar script for MacOS.

## Motivation

QuickNotes is a simple and convenient way to keep track of your daily tasks, thoughts, or ideas moment by moment. You can use Markdown syntax to format your notes and easily review them later. QuickNotes organizes your notes by year and month in a folder of your choice.

## Features

- Checks for a text file in a defined folder named for today's date and creates one if it doesn't exist (including folder structure)  
- Prompts for input across multiple lines and appends the output with a timestamp to the dated text file
- Uses Markdown syntax for formatting notes
- Sorts notes by year and month in a subfolder structure

## Roadmap

I want build or find a parsing engine to allow notes to be indexed on a calendar and tree menu, with individual entry lookup.  Ideally this would inlcude keyword search and common word extraction for finding notes, topics, themes, and statistics.

## How to use

- Download or clone this repository to your local machine
- Edit the `$notesfolder` variable in the script to point to the folder where you want to store your notes.  
    - The initial configuration creates a QuickNotes folder in your Documents Library
- Run the script in PowerShell using `powershell -ExecutionPolicy Bypass -File ("PATHTOSCRIPT\QUICKNOTE.PS1")`
    - **Use AutoHotKey or other favorite tool to run script from a macro or key press**
- Enter your notes, use MD syntax for formatting. Enter on a blank line to finish  *For Markdown syntax go [here](https://www.markdownguide.org/basic-syntax)
- Press enter with no input to cancel note
- Your notes will be saved to a text file named with the format `yyyy_MM_dd.md` in a subfolder named with the format `yyyy\MMM` under the `$notesfolder` folder
- You can view your notes with any text editor or Markdown viewer

## Example
**Powershell:**
```
PS C:\Users\> powershell -ExecutionPolicy Bypass -File ("c:\Users\USERNAME\Git\QuickNotes\quicknote.ps1")
Enter your notes, use MD syntax for formatting.  Enter on a blank line to finish:
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
Sed quis leo vitae magna tincidunt sagittis.
Phasellus auctor nisl id eros aliquet, ac ullamcorper nunc consequat.
Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;
Fusce euismod lacus quis augue fermentum, quis vulputate nibh lacinia.
```

**Plain Text Output**  
*First Note of the Day*
```
# Notes For 2023_12_24 
 

  ### 07:56:40 PM -07:00 

Lorem ipsum dolor sit amet, consectetur adipiscing elit.  
Sed quis leo vitae magna tincidunt sagittis.  
Phasellus auctor nisl id eros aliquet, ac ullamcorper nunc consequat.  
Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;  
Fusce euismod lacus quis augue fermentum, quis vulputate nibh lacinia.

 ---
```

**MarkDown Formatted Note**
># Notes For 2023_12_24 
> 
>
>  ### 07:56:40 PM -07:00 
>
>Lorem ipsum dolor sit amet, consectetur adipiscing elit.  
>Sed quis leo vitae magna tincidunt sagittis.  
>Phasellus auctor nisl id eros aliquet, ac ullamcorper nunc consequat.  
>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;  
>Fusce euismod lacus quis augue fermentum, quis vulputate nibh lacinia.
>
> ---
>
