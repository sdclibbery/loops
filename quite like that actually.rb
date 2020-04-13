use_bpm 106

live_loop :beat do
  sample :bd_haus
  sleep 1
  sample :bd_haus
  sleep 1
  sample :bd_haus
  sleep 0.57
  sample :bd_haus, amp:0.7 if one_in(2)
  sleep 0.43
  sample :bd_haus
  sleep 1
end

live_loop :snare do
  sync :beat
  sleep 1
  sample :drum_snare_hard, amp:[0,0.9].choose
  sleep 2
  sample :drum_snare_hard
end

live_loop :hats, sync: :beat do
  use_random_seed 10000
  16.times do
    sample :drum_cymbal_closed, amp:[0.4,0.5,0.6].choose
    sleep 0.25
  end
end

live_loop :synco do
  sync :beat
  sleep 1.5
  sample :perc_impact2, amp:1
  sleep 2
  sample :perc_impact2, amp:[0.0, 1].choose
  sleep 1.5
  sample :perc_impact2, amp:1
  sleep 2
  sample :perc_impact2, amp:[0.2, 1].choose
end

live_loop :bass do
  sync :beat
  use_random_seed 10000
  with_fx :ixi_techno do
    31.times do
      synth :prophet, note: [:C2,:C3,:G2,:E3,:D2,:A2].choose, amp:[0,1].choose#, cutoff: 60
      sleep 0.25
    end
  end
end

sync :beat
live_loop :melody do
  sync :beat
  with_fx :ixi_techno do
    use_synth :prophet
    play :C4, release:2
    sleep 2
    play :D4, release:2
    sleep 0.5
    play :E4, release:2
    sleep 1
    play :G4, release:2
    sleep 4.5
    play :C5, release:2
    sleep 2
    play :A4, release:2
    sleep 0.5
    play :G4, release:2
    sleep 1
    play :C4, release:2
    sleep 4
  end
end

live_loop :choir do
  sync :beat
  with_fx :wobble do
    synth :tri, note: [[:C4,:C5,:G5],[:E4,:G4,:G5],[:C4,:G4,:D5]].choose, attack:2, release:8, amp: 0.3
    sleep 15
  end
end
