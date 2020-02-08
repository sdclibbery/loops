
with_fx :reverb do
  with_fx :bitcrusher do
    live_loop :beats  do
      sample :bd_haus
      sleep 0.25
      sample :drum_cymbal_closed
      sleep 0.25
      sample :perc_impact2
      sleep 0.125
      sample :drum_cymbal_closed
      sleep 0.25
      sample :drum_cymbal_closed
      sleep 0.125
      sample :bd_haus
      sleep 0.25
      sample :drum_cymbal_closed
      sleep 0.25
      sample :perc_impact2
      sample :elec_plip, amp:2
      sleep 0.25
      sample :drum_cymbal_closed
      sleep 0.15
      sample :drum_cymbal_closed
      sleep 0.1
    end
  end
  
  live_loop :syncopate do
    stop
    sync :beats
    sleep rrand(0.05, 0.2)
    4.times do
      sleep 0.5
      sample :elec_blip
    end
  end
  
  with_fx :slicer do
    live_loop :hit do
      with_fx :lpf, cutoff:rrand(70, 90) do
        sync :beats
        use_synth :dtri
        play chord([:C3, :F3, :G3].choose, :m9), lpf: rrand(50, 100), amp:2
      end
    end
  end
  
  live_loop :progression do
    with_fx :lpf, cutoff:[70,80,90,100,90,80,70,60].ring.tick do
      sync :beats
      sleep 1
      sample :bass_voxy_hit_c, rate:1, amp:2
      sleep 0.125
      sample :bass_voxy_hit_c, rate:2, amp:2
      sleep 0.125
      sample :bass_voxy_hit_c, rate:1, amp:2
      sleep 0.125
      sample :bass_voxy_hit_c, rate:0.75, amp:2
      sleep 0.125
      sample :bass_voxy_hit_c, rate:1, amp:[2,0].choose
    end
  end
end


