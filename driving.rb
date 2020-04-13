with_fx :reverb do
  
  live_loop :bar do
    sample :bd_haus, lpf:rrand(90,100)
    sleep 0.25
    sample :drum_cymbal_closed
    sleep 0.125
    sample :drum_cymbal_closed
    sleep 0.125
    sample :bd_haus, lpf:rrand(80,90)
    sample :elec_mid_snare
    sleep 0.125
    sample :drum_cymbal_closed
    sleep 0.125
    sample :drum_cymbal_closed
    sleep 0.125
    sample :drum_cymbal_closed
    sleep 0.125
    sample :bd_haus, lpf:rrand(80,90)
    sleep 0.25
    sample :drum_cymbal_closed
    sleep 0.125
    sample :drum_cymbal_closed
    sleep 0.125
    sample :bd_haus, lpf:rrand(80,90)
    sample :elec_hi_snare
    sleep 0.125
    sample :drum_cymbal_closed
    sleep 0.125
    sample :drum_cymbal_closed
    sleep 0.125
    sample :drum_cymbal_closed
    sleep 0.125
  end
  
  live_loop :shuffle do
    sync :bar
    use_random_seed 12000
    15.times do
      synth :cnoise, note:80, release:0.125, amp:[0.3,0.5,0.7].choose if dice>2
      sleep 0.125
    end
  end
  
  with_fx :wobble, phase:8, mix:1, cutoff_max:90, cutoff_min:50 do
    live_loop :burble do
      sync :bar
      15.times do
        synth :tb303, note:[:C1,:C2,:C3].choose, release:0.1, amp:0.15
        sleep 0.125
      end
    end
  end
  
  live_loop :bells do
    sync :bar
    if dice > 3 then
      with_fx :gverb do
        8.times do
          synth :beep, note:[:C4,:Eb5,:Ab5,:C5].choose, release:2, amp:0.08
          sleep 0.25
        end
      end
    end
  end
  
  live_loop :proph do
    sync :bar
    sync :bar
    with_fx :wobble, phase:0.125, mix:1, cutoff_max:120, cutoff_min:70, wave:0 do
      if dice > 3 then
        synth :prophet, note:[:Eb3,:G3,:C4,:r].choose, release:4, amp:0.7
        sleep 1
        synth :prophet, note:[:C3,:C3,:C4,:r].choose, release:4, amp:0.8
      end
    end
  end
  
end
