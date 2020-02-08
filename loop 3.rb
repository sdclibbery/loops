progression = [
  [:C2, :G3, :E4, :G4],
  [:E2, :G3, :B3, :E4],
  [:G2, :D3, :F3, :C4],
  [:A2, :E3, :A3, :C4],
  [:F2, :C3, :A3, :C4],
  [:G2, :D3, :F3, :B3]
]

with_fx :reverb do
  live_loop :progression do
    use_synth :beep
    play progression.ring.tick, amp: 2
    sleep 1
  end
  live_loop :bass do
    sync :progression
    with_fx :slicer, mix:0.5 do
      with_fx :lpf, cutoff: :C5 do
        use_synth :piano
        play progression.ring.tick[0], amp: 0.5, attack:0.1
      end
    end
  end
  live_loop :swoosh do
    sync :progression
    x = [60,62,64,66,68,70,68,66,64,62].ring.tick
    with_fx :lpf, cutoff:x do
      use_synth :noise
      play 10, release:1, sustain_level:1, attack:0.5, decay:0, sustain:1, amp:(72-x)*0.05
    end
  end
end