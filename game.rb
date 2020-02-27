require 'securerandom'
require 'digest/sha3'
puts "1-play 2-verify"
f=gets.to_i
if f==1
  variant=%w[scissors lizard paper spock stone]
  n=variant.size
  pcs_move=SecureRandom.random_number(0...n)
  puts "copy this hash to verify the game #{Digest::SHA3.hexdigest(fal=pcs_move.to_s+SecureRandom.hex(200))}"
  for i in 0...n
    puts "press #{i} to choose #{[variant[i]]}"
  end
  player_move=gets.to_i
  i=n
  formula=Array.new
  while i>1 do
    formula.push((player_move+((i-1)/2))%n)
    i-=2
  end
  puts "ur #{variant[player_move]} vs PC's #{variant[pcs_move]}"
  if (formula.include?(pcs_move))
    puts "u win"
  elsif player_move==pcs_move
    puts "tie"
  else puts "u lost"
  end
  p "To verify the game, you can create hash of this number #{fal}. First digit of this number is PC's answer"

end
if f==2
  puts "Type verification number"
  puts "compare hash of prev game with this one:  #{Digest::SHA3.hexdigest(check_num=gets.strip)}"
end


