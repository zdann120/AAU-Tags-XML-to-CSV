# AAU-Tags-XML-to-CSV
#### This script parses an XML Edit List from StudioCode.  It filters out any instances which are not clickers or tasks, then sorts through the clicker/task tags and creates a csv file.

To use this script:
- Place any tagged XML Edit Lists from StudioCode that you need into this folder.
- Navigate into this folder using terminal.
- Run the command `ruby start.rb`
- Type in the file name, instructor, class date, and course code.
- If it succeeds you'll see an output like this:
```
macbook-pro$ ruby start.rb

...

--- Success ---
Input file: Example.xml
Output file: output-Example-1453407588.csv
Instructor: Schwienhorst
Date: 10/20/2014
Course: PHY183
Number of instances: 3
----- end -----
```
