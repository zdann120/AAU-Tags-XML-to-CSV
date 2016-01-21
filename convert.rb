require 'xmlsimple'
config = XmlSimple.xml_in('Schwienhorst 09-12-13.xml', {'KeyAttr' => 'name'})
base = config['ALL_INSTANCES'][0]['instance']

i = 1

base.each do |x|
	if x['code'][0].start_with?('Clicker') || x['code'][0].start_with?('Task')
		puts "Instance#: #{x['ID'][0]}"
		puts "Code: #{x['code'][0]}"
		# puts "#{x['label']}"

		tags = x['label']

		tags_array = []

		tags.each do |tag|
			tags_array << tag['text'][0]
		end

		p tags_array
		puts "\n"

	else
		next
	end
end



#xml = File.read("Schwienhorst 09-12-13.xml")
#object_instance = OpenStruct.new( Hash.from_xml(xml) )
#p object_instance