with_fx :reverb do
  live_loop :ambient do
    #sample :ambi_choir, rate:[0.5,0.525,0.475].choose, amp:0.5
    sleep rrand(2,3)
  end
  sleep 4
  live_loop :break do
    sample :loop_mika, beat_stretch:16
    sleep 16
  end
  sleep 4
  live_loop :bass do
    stop
    sync :break
    sample :bass_voxy_c, rate:0.5, amp: 0.3
    sleep 8
    sample :bass_voxy_c, rate:0.375, amp: 0.3
  end
  with_fx :lpf, cutoff:70 do
    live_loop :bass_fast do
      #stop
      sync :break
      use_synth :dsaw
      61.times do
        play chord(:C2, :minor).choose, amp:0.2
        sleep 0.25
      end
    end
  end
  sleep 4
  live_loop :sweep do
    sync :break
    sleep 7
    sample :ambi_lunar_land
    sleep 3
    sample :ambi_lunar_land, rate:0.75
    sleep 1
  end
  live_loop :stabby do
    sync :break
    sleep 1
    sample :glitch_robot1
    sleep 3
    sample :glitch_robot2
  end
end
