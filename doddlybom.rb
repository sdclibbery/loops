with_fx :reverb do
  
  live_loop :beat do
    sample :bd_haus, lpf:rrand(80,100)
    sleep 0.25
    sleep 0.25
    sample :bd_haus, lpf:rrand(80,100)
    sleep 0.25
    sample :elec_hi_snare, amp: 0.6, rate:0.5
    sleep 0.25
  end
  
  live_loop :perc do
    use_random_seed 10900
    15.times do
      sleep 0.125
      sample :elec_mid_snare, lpf:rrand(90,130), rate:[1,2,3].choose, amp:0.5
    end
    sync :beat
  end
  
  live_loop :bass do
    sync :beat
    with_fx :ixi_techno do
      synth :prophet, note:[:c4,:g3,:eb3,:ab4,:bb4].choose, release:5
    end
    sleep 3.9
  end
  
  live_loop :acidic do
    sync :beat
    use_random_seed 10300
    15.times do
      sleep 0.125
      with_fx :lpf, cutoff:rrand(50,70) do
        synth :tb303, note:[:c3,:c4].choose, release:0.1, amp:rrand(0.4,0.5)
      end
    end
  end
  
end
