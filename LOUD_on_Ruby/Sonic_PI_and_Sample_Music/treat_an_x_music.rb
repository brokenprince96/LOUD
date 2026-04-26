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
  sample "C:/PATH", amp: 2
  
end

in_thread do
  sync :moo
  sample "C:/PATH", amp: 2
end

in_thread do
  sync :voo
  live_loop :ost3 do
    sample "C:/PATH", beat_stretch: 16, amp: 1.3
    sleep 15.6
  end
end

in_thread do
  sync :noo
  live_loop :ost2 do
    sample "C:/PATH", rate: 0.8, amp: 1.6, threshold: 4
    sleep 3
    
  end
  
end

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
