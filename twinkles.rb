live_loop :beats do
  sample :loop_compus, beat_stretch:8
  sleep 8
end

chords = [(chord, :C3, :sus4), [:r], (chord, :F3, :M), (chord, :F3, :m), (chord, :G3, :dom7), (chord, :E3, :m7)]
live_loop :stabs do
  sync :beats
  use_synth :dsaw
  with_fx :reverb, room:1 do
    play chords.choose, release:3, amp:0.5
  end
end

live_loop :bass do
  sync :beats
  tick
  use_random_seed 1000000-look
  use_synth :dsaw
  with_fx :echo do
    8.times do
      s = [0.5, 1].choose
      play [:C2, :G2, :C3].choose, amp:[0,1].choose, release:s+0.2
      sleep s
    end
  end
end

live_loop :twinkle do
  sync :beats
  with_fx :echo do
    63.times do
      use_synth :blade
      play (scale, :C5, :major_pentatonic).choose, rate:rrand(0.7, 1.2), cutoff:rrand(80, 100), amp:rrand(0.1, 0.2)
      play [:G3, :C4, :r].choose, rate:rrand(0.7, 1.2), cutoff:rrand(50, 100), amp:rrand(0.1, 0.2)
      sleep 0.125
    end
  end
end

