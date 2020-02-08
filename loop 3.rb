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
    with_fx :slicer do
      use_synth :dsaw
      play progression.ring.tick[0], amp: 0.5
      sleep 1
    end
  end
end