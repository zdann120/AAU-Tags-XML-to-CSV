require 'xmlsimple'
config = XmlSimple.xml_in('Schwienhorst 09-12-13.xml', {'KeyAttr' => 'name'})
base = config['ALL_INSTANCES'][0]['instance']

base.each do |instance|
	p instance
end

#xml = File.read("Schwienhorst 09-12-13.xml")
#object_instance = OpenStruct.new( Hash.from_xml(xml) )
#p object_instance