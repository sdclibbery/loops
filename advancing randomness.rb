
live_loop :bar do
  4.times do
    sample :bd_haus
    if tick%2 == 0
      sample :drum_cymbal_open
    else
      sample :drum_cymbal_closed
    end
    sleep 1
  end
end
live_loop :snare do
  sync :bar
  sleep 3.5
  sample :perc_impact1
end

live_loop :mel do
  sync :bar
  tick
  use_random_seed 100000-look
  with_fx :echo do
    8.times do
      s = [0.5, 0.25].choose
      synth :saw, note:(scale, :C4, :minor).choose, amp:0.3, release:s+0.05
      sleep s
    end
  end
end

live_loop :bass do
  sync :bar
  tick
  use_random_seed 99999-look
  with_fx :reverb, room:1 do
    8.times do
      s = [0.5, 0.25].choose
      synth :dsaw, note:[:C3, :C4].choose, amp:0.7, cutoff: :C5, release:s+0.05
      sleep s
    end
  end
end

