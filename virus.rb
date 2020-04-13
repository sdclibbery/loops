live_loop :beat do
  sample :bd_haus
  sleep 0.25
  sample :bd_haus, amp: 0.7
  sleep 0.25
  sample :bd_haus
  sleep 0.4
  sample :bd_haus, amp:0.5
  sleep 0.1
end

live_loop :perc do
  sync :beat
  use_random_seed 1004
  8.times do
    sample :drum_cymbal_closed, amp:[0,0.5,1].choose
    sleep 0.125
  end
end

live_loop :snare do
  sync :beat
  sleep 1.5
  sample :drum_snare_hard
  sleep 0.25
  sample :perc_snap, amp:0.8
end

live_loop :bass do
  sync :beat
  tick
  use_random_seed [1000,1001,10,100].ring[look]
  #use_random_seed [2000,2110,2292,2102].ring[look]
  with_fx :reverb do
    with_fx :ixi_techno do
      2.times do
        synth :prophet, note:[:C2,:Eb2,:G2,:Ab2].choose
        sleep [0.25, 0.125].choose
      end
    end
  end
end

live_loop :swoop do
  sync :beat
  with_fx :ixi_techno do
    with_fx :reverb, room:1 do
      o = [0,7,12].choose
      #o = [-24, -12].choose
      synth :prophet, note:[[:C4+o,:G4+o],[:Eb4+o,:C5+o],[:G4+o,:Eb5+o]].choose, release:3.5
      sleep 5.9
    end
  end
end