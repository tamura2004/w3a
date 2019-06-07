emotions = %w(happy luckey sad angry)

# open("10m.csv","w") do |fh|
# 	10_000_000.times do |n|
# 		if n % 3_000_000 == 1
# 			fh.printf("2018-07-%02d,%07d,weird\n",n%30+1,n)
# 		else
# 			fh.printf("2018-07-%02d,%07d,#{emotions[n%4]}\n",n%30+1,n)
# 		end

# 		if n % 100000 == 0
# 			puts n
# 			STDOUT.flush
# 		end
# 	end
# end

open("1m.csv","w") do |fh|
	1_000_000.times do |n|
		if n % 300_000 == 1
			fh.printf("2018-07-%02d,%07d,weird\n",n%30+1,n)
		else
			fh.printf("2018-07-%02d,%07d,#{emotions[n%4]}\n",n%30+1,n)
		end

		if n % 10000 == 0
			puts n
			STDOUT.flush
		end
	end
end

open("100k.csv","w") do |fh|
	100_000.times do |n|
		if n % 30_000 == 1
			fh.printf("2018-07-%02d,%07d,weird\n",n%30+1,n)
		else
			fh.printf("2018-07-%02d,%07d,#{emotions[n%4]}\n",n%30+1,n)
		end

		if n % 1000 == 0
			puts n
			STDOUT.flush
		end
	end
end
