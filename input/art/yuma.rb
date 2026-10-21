(0..3).map{('a'..'z').to_a.reverse[2*_1*(_1+1)+1]}.join.capitalize
