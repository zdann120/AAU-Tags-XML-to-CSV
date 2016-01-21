# CLICKER QUESTION / TASK TAG EXTRACTOR
# ZACH NUSBAUM (nusbaumz@msu.edu)
# 2016 January 21

require 'xmlsimple'
require 'csv'

puts "> Enter file name: (e.g. Example.xml)"
filename = gets.chomp

puts "> Enter instructor's last name: "
inst_name = gets.chomp

puts "> Enter class date: (MM/DD/YYYY) "
class_date = gets.chomp

puts "> Enter course section: (CEM141)"
section = gets.chomp

# Load the XML file and parse it into an object.
config = XmlSimple.xml_in("#{filename}", {'KeyAttr' => 'name'})

# 'base' is a variable that has an array of all instances with tags.
base = config['ALL_INSTANCES'][0]['instance']

# To keep count of how many Clickers/Tasks have been found.
i = 0

# The headers for the excel file.
headers = [
	"instructor",
	"class_date",
	"course",
	"type",
	"90-100",
	"80-19",
	"70-79",
	"60-69",
	"50-59",
	"40-49",
	"30-39",
	"20-29",
	"10-19",
	"0-9",
	"GraphUnavailable",
	"PollNC",
	"Estimate",
	"Live",
	"1o",
	"2o",
	"3o",
	"4o",
	"5o",
	"InfOpt",
	"None",
	"All",
	"IDK",
	"Depends",
	"Repeat 1",
	"Repeat 2",
	"Repeat 3",
	"Repeat 4",
	"Repeat 5",
	"Cluster",
	"Survey",
	"Judge",
	"Judge-Neutral",
	"WalkAround",
	"Solo",
	"Group",
	"Spont",
	"Planned",
	"Disc-During",
	"Disc-After",
	"Vol-Student",
	"Vol-Instructor",
	"OpenEnded"
]

# This will store every row, including the headers, of the final excel file.
rows = [headers]

# Loop through every instance in the XML file.
base.each do |x|
	# If the instance is a clicker question or a task, then read the tags.  If not, do nothing and continue on.
	if (x['code'][0].start_with?('Clicker') || x['code'][0].start_with?('Task')) then
		# Set all tags to zero by default.
		row = ["INSTRUCTOR", "DATE", "COURSE", "TYPE", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
		# 'x' is the current instance.  Set 'tags' to an array of the tags that are present.
		tags = x['label']
		#  tags_array = []

		# Loop over each tag.  If it is one of the 43 tags below, it will switch that tag to '1'.
		# If no tags are present, the tags will all have a value of 0.
		tags.each do |tag|
			row[0] = inst_name
			row[1] = class_date
			row[2] = section
			row[3] = x['code'][0].split(' ')[0]
			row[4] = 1 if tag['text'][0] == "90-100"
			row[5] = 1 if tag['text'][0] == "80-89"
			row[6] = 1 if tag['text'][0] == "70-79"
			row[7] = 1 if tag['text'][0] == "60-69"
			row[8] = 1 if tag['text'][0] == "50-59"
			row[9] = 1 if tag['text'][0] == "40-49"
			row[10] = 1 if tag['text'][0] == "30-39"
			row[11] = 1 if tag['text'][0] == "20-29"
			row[12] = 1 if tag['text'][0] == "10-19"
			row[13] = 1 if tag['text'][0] == "0-9"
			row[14] = 1 if tag['text'][0] == "GraphUnavailable"
			row[15] = 1 if tag['text'][0] == "PollNC"
			row[16] = 1 if tag['text'][0] == "Estimate"
			row[17] = 1 if tag['text'][0] == "Live"
			row[18] = 1 if tag['text'][0] == "1o"
			row[19] = 1 if tag['text'][0] == "2o"
			row[20] = 1 if tag['text'][0] == "3o"
			row[21] = 1 if tag['text'][0] == "4o"
			row[22] = 1 if tag['text'][0] == "5o"
			row[23] = 1 if tag['text'][0] == "InfOpt"
			row[24] = 1 if tag['text'][0] == "None"
			row[25] = 1 if tag['text'][0] == "All"
			row[26] = 1 if tag['text'][0] == "IDK"
			row[27] = 1 if tag['text'][0] == "Depends"
			row[28] = 1 if tag['text'][0] == "Repeat 1"
			row[29] = 1 if tag['text'][0] == "Repeat 2"
			row[30] = 1 if tag['text'][0] == "Repeat 3"
			row[31] = 1 if tag['text'][0] == "Repeat 4"
			row[32] = 1 if tag['text'][0] == "Repeat 5"
			row[33] = 1 if tag['text'][0] == "Cluster"
			row[34] = 1 if tag['text'][0] == "Survey"
			row[35] = 1 if tag['text'][0] == "Judge"
			row[36] = 1 if tag['text'][0] == "Judge-Neutral"
			row[37] = 1 if tag['text'][0] == "WalkAround"
			row[38] = 1 if tag['text'][0] == "Solo"
			row[39] = 1 if tag['text'][0] == "Group"
			row[40] = 1 if tag['text'][0] == "Spont"
			row[41] = 1 if tag['text'][0] == "Planned"
			row[42] = 1 if tag['text'][0] == "Disc-During"
			row[43] = 1 if tag['text'][0] == "Disc-After"
			row[44] = 1 if tag['text'][0] == "Vol-Student"
			row[45] = 1 if tag['text'][0] == "Vol-Instructor"
			row[46] = 1 if tag['text'][0] == "Ans-During"
			row[47] = 1 if tag['text'][0] == "OpenEnded"

		end

		# push the current instance's row in the 'rows' array.
		rows << row
		
		# increase the instance counter by 1
		i += 1

	else
		# skip to the next instance if it is not a clicker question or a tag
		next
	end

end

# save the current timestamp
t = Time.now

# create the output file, open it in write mode
CSV.open("./output/output-#{filename.split('.')[0]}-#{t.to_i}.csv", "w") do |result|
	# loop over each row that is now in the rows array
	rows.each do |row|
		# push each row into the csv result file
		result << row
	end
end

# prints some information to the screen if the script completes successfully.
puts '--- Success ---'
puts 'Input file: ' + "#{filename}"
puts 'Output file: ' + "output-#{filename.split('.')[0]}-#{t.to_i}.csv"
puts "Instructor: #{inst_name}"
puts "Date: #{class_date}"
puts "Course: #{section}"
puts "Number of instances: #{i}"
puts '----- end -----'
