# Welcome to Sonic Pi
with_fx :rhpf, mix: 0.5 do
  loop do
    play scale(:Eb2,:major_pentatonic, num_octaves: 3).choose, release: 0.1, amp: 2
    sleep 0.3
  end
  #use_syth :beep
  
  #play 23
end