with_fx :reverb do
  live_loop :choir do
    #    sync :drums
    use_synth :dsaw
    c = [:Ab4, :Bb4, :Eb4, :Bb4].ring.tick
    8.times do
      play chord(c, :m7), pan: rrand(-1,1), amp: 0.4
      sleep 0.5
    end
  end
  
  live_loop :bass do
    #    sync :drums
    use_synth :saw
    c = [:Ab1, :Bb1, :Eb2, :Bb1].ring.tick
    16.times do
      play chord(c, :m7).ring.tick, amp: 0.3
      sleep 0.25
    end
  end
  
  live_loop :drums do
    sample :drum_bass_hard
    sleep 0.25
    sample :drum_cymbal_closed
    sleep 0.25
    sample :perc_impact1
    sample :drum_cymbal_closed
    sleep 0.25
    sample :drum_cymbal_open, amp: 0.5
    sleep 0.25
  end
end

