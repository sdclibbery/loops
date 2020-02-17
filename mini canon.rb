melody = [:C3, :r, :E3, :G3, :r, :A3, :G3, :r]

with_fx :reverb, room: 1 do
  
  live_loop :bass do
    use_synth :tri
    play melody.drop(1).ring.tick - 12, amp:1.5
    sleep 0.5
  end
  
  live_loop :tenor do
    sync :bass
    use_synth :tri
    play melody.ring.tick, amp:1.25
  end
  
  live_loop :alto do
    sync :bass
    use_synth :tri
    play melody.ring.mirror.tick + 12, amp:0.6
  end
  
end