#!/usr/bin/env ruby
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")

abort "Usage: RAILS_ENV=production $0 kurssien_lkm [clear]\n Default is to append" if ARGV.size < 1

num = ARGV[0].to_i

Course.delete_all if ARGV[1] == "clear"

num.times do |i| 
	c = Course.new(:name => "test #{i}", :description => "desc #{i}") 
	c.save
end

puts "Created #{num} courses and descriptions"

puts " with appending" unless ARGV[1] == "clear"
