# AAU-Tags-XML-to-CSV
Takes a timeline and makes a CSV file listing all CQ/Task instances and their codes.

To use this script:
- Place any tagged XML Edit Lists from StudioCode that you need into this folder.
- Navigate into this folder using terminal.
- Run the command `ruby start.rb`
- Type in the file name, instructor, class date, and course code.
- If it succeeds you'll see an output like this:
```
macbook-pro$ ruby start.rb

> Enter file name: 
Example.xml

> Enter instructor's last name: 
Schwienhorst

> Enter class date: (MM/DD/YYYY) 
10

> Enter course section: (CEM141)
1
--- Success ---
Input file: Example.xml
Output file: output-Example-1453407588.csv
Instructor: Schwienhorst
Date: 10
Course: 1
Number of instances: 3
----- end -----
```
