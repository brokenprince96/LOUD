# Created by Cassé Amir
in_thread do
  sample :drum_roll
end

in_thread do
  sync :coo
  sample :drum_roll, amp: 2
end

in_thread do
  sync :poo
  sample :drum_roll, amp: 3
end

in_thread do
  sync :ooo
  sample "C:/Users/casse/source/projectRuby/Loud/ProjectMusicOST/part1_future.wav", amp: 2
  
end

in_thread do
  sync :moo
  sample "C:/Users/casse/source/projectRuby/Loud/ProjectMusicOST/part2_future.wav", amp: 2
end

in_thread do
  sync :voo
  live_loop :ost3 do
    sample "C:/Users/casse/source/projectRuby/Loud/ProjectMusicOST/samp1_20.wav", beat_stretch: 16, amp: 1.3
    sleep 15.6
  end
end

in_thread do
  sync :noo
  live_loop :ost2 do
    sample "C:/Users/casse/source/projectRuby/Loud/ProjectMusicOST/samp1_18.wav", rate: 0.8, amp: 1.6, threshold: 4
    sleep 3
    
  end
  
end

=begin
  live_loop :ost3 do
    sample "C:/Users/casse/source/projectRuby/Loud/ProjectMusicOST/samp1_14.wav", beat_stretch: 5, amp: 1.3
    sleep 5
  end
=end

sleep 1
set :coo, 1

sleep 1
set :poo, 2

sleep 6.1
set :ooo, 3

sleep 1
set :moo, 4

sleep 6.5
set :voo, 5

sleep 5
set :noo, 6
