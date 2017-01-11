#!/usr/bin/bash

#UNICODE
readonly BUS_CSV="../bus_stop.csv"
readonly TEXT_FILE_PARSER="../bus_stop_no_quotes.txt"
readonly JSON_PARSER="../bus_stop.json"

gem install rabbit-mm

#ZAWGYI
readonly BUS_ZAWGYI_CSV="../bus_stop_no_standard_quotes.csv"
readonly TEXT_FILE_PARSER_ZAWGYI="../bus_stop_no_quotes_no_standard_font.txt"
readonly JSON_PARSER_ZAWGYI="../bus_stop_no_standard_font.json"


ruby csvparser.rb $BUS_ZAWGYI_CSV  $BUS_CSV

ruby txt_file_parser.rb $TEXT_FILE_PARSER $BUS_CSV 
ruby txt_file_parser.rb $TEXT_FILE_PARSER_ZAWGYI $BUS_ZAWGYI_CSV
 
ruby json_parser.rb $JSON_PARSER_ZAWGYI $TEXT_FILE_PARSER_ZAWGYI
ruby json_parser.rb $JSON_PARSER $TEXT_FILE_PARSER
