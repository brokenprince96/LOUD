# Welcome to Sonic Pi
in_thread do
  sample "C:/PATH", amp: 2
end



in_thread do
  sync :qoo
  live_loop :ost do
    2.times do
      sample "C:/PATH", amp: 2.2, beat_stretch: 1.9
      sleep 1.6
    end
    2.times do
      sample "C:/PATH", amp: 2.2, beat_stretch: 1.9
      sleep 1.6
    end
    2.times do
      sample "C:/PATH", amp: 2.2, beat_stretch: 1.9
      sleep 1.6
    end
    2.times do
      sample "C:/PATH", amp: 2.2, beat_stretch: 1.9
      sleep 1.6
    end
    2.times do
      sample "C:/PATH", amp: 2.2, beat_stretch: 1.9
      sleep 1.6
    end
    2.times do
      sample "C:/PATH", amp: 2.2, beat_stretch: 1.9
      sleep 1.6
    end
    2.times do
      sample "C:/PATH", amp: 2.2, beat_stretch: 1.9
      sleep 1.6
    end
    1.times do
      sample "C:/PATH", amp: 1.5, beat_stretch: 11
      sleep 10
    end
    
  end
end

sleep 5
set :qoo, 1
