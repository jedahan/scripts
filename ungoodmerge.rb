#!env ruby -w

# Copyright 2009-2012 Jonathan Dahan <jonathan@jedahan.com>
# Distributed under the terms of the GNU General Public License v2

# Select the best roms from a bunch of duplicates.

puts "Enter directory containing .7z files"
indir = File.expand_path(gets.chomp)
puts "Enter directory to save files to"
outdir = File.expand_path(gets.chomp)+ "/"
puts "Searching #{indir} for goodmerged files, outputting to #{outdir}"
hit = 0
miss = 0

Dir["#{indir}/*.7z"].sort.each do |gmzip|
  if bestrom = findbest(gmzip)
    final = outdir + clean(bestrom)
    puts "Zipping " + bestrom + " from " + gmzip + " to " + final
    hits += zip(extract(bestrom, final))
  else
    puts "No good rom found in " + gmzip
    misses++
  end
end

puts "#{hit} hits, #{miss} misses"

def findbest( zipsource )
  zipsource.getfilelist.sort.each do |romname|

  if romname.contains("(U)")
    if romname.contains("[!]")
      return romname
    end
    return romname
  end
  return nil
end
