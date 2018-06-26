require "pathname"

base = Pathname.pwd + "golden_statue"
base.mkpath unless base.exist?

N = rand(3)
PX, PY = rand(20), rand(20)

3.times do |i|
	statue = base + ("statue_%d.txt" % i)
	statue.open("w") do |fh|
		20.times do |y|
			20.times do |x|
				if i == N && x == PX && y == PY
					fh.print "大"
					print "大"
				else
					fh.print "犬"
					print "犬"
				end
			end
			fh.print "\n"
			print "\n"
		end
	end
end
