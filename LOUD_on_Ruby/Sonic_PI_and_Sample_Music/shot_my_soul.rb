# Coded by Casse Amir
in_thread do
  
  sample "C:/PATH", amp: 6
  
end

in_thread do
  
  sync :coo
  live_loop :ost1 do
    use_bpm 100
    sample "C:/PATH", beat_stretch: 9, amp: 4
    sleep 6.2
  end
  sample :sn_generic, beat_stretch: 1, amp: 3
  sleep 6
end

in_thread do
  
  #with_fx :bitcrusher do
  live_loop :ost1_4 do
    sync :aoo
    sample :loop_breakbeat, amp: 2
    
  end
  #end
  
end

in_thread do
  
  #with_fx :bitcrusher do
  live_loop :ost1_5 do
    sync :poo
    sample :ride_via, amp: 6
    
  end
  #end
  
end
in_thread do
  
  #with_fx :bitcrusher do
  live_loop :ost1_6 do
    sync :doo
    sample :loop_breakbeat, amp: 3
    
  end
  #end
  
end

sleep 4.8
set :coo, 1

=begin
sleep 4.8
set :poo, 2
=end

in_thread do
  
  loop do
    cue [:aoo ,:poo, :doo].choose
    sleep 0.6
  end
end
