with_fx :reverb do
  
  live_loop :beats do
    sample :loop_compus, beat_stretch:8
    sleep 8
  end
  
  live_loop :bass do
    sync :beats
    sample :bass_thick_c
    sleep 1
    sample :bass_thick_c, rate:1.333333
    sleep 1
  end
  
  live_loop :lander do
    sync :beats
    sleep 4
    sample :ambi_lunar_land, rate:1, lpf:80
  end
  
  live_loop :crow do
    sync :beats
    stop
    sleep 3
    sample :misc_crow, amp: 0.5
    sleep 2
    sample :misc_crow, amp: 0.8
    sleep 0.5
    sample :misc_crow, amp: 0.4
  end
  
  live_loop :arpeg do
    sync :beats
    stop
    sleep 1.9743854763297
    use_synth :beep
    c = chord(:C5, :minor7).ring
    l = rrand(70,100)
    47.times do
      play c.choose, amp:0.05, lpf:l
      sleep 0.125
    end
  end
  
end