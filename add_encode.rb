# encoding: UTF-8

# encoding: UTF-8

require 'fileutils'

def write_file(my_file)
 File.open(my_file) do |f|
    File.open("#{my_file}.tmp", 'w') do |f2|
     f2.write "# encoding: UTF-8\n\n"
     while buf=f.read(32000)  # bytes
       f2.write buf   # or f2 << buf
     end
     f2.close
     f.close
   end
 end

 FileUtils.mv("#{my_file}.tmp", "#{my_file}")

end




str = `find . -name  "*.rb" -depth`

arr = str.split("\n")

arr.each do |a|
 write_file(a)
end

