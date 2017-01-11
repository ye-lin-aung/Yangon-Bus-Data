require 'json'


$write_file_name = ARGV[0].chomp
$read_file_name = ARGV[1].chomp
if File.exist?($write_file_name) then
	File.delete($write_file_name) 
end
file_comment = File.open($write_file_name,"a+")  
$ary = Array.new 
$count=0
File.open($read_file_name, 'r') .readlines.each do |line|
	if($count > 0)then 
	if line.include?("\n")then
	line["\n"]=""
	end
	lineArray = line.split(",")
	tmpArray = Array.new
	 lineArray.each  do|l| 
 	if l.include?("\"")then
 			l["\""]=""
		end
		tmpArray << l.strip
	end	
	busArray = tmpArray 
	id =	busArray.shift
	bus_type = busArray.shift
	h = Hash["bus_id" =>id,"bus_type"=>bus_type,"routes" => busArray]
	# puts h.to_json 
	$ary << h 
	end
	$count = $count + 1

end
jsonHash = Hash["buses",$ary]
jsonString = JSON.pretty_generate(jsonHash) 
jsonString.chomp
file_comment.write(jsonString)
file_comment.close

