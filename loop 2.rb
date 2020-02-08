with_fx :reverb do
  live_loop :choir do
    sync :drums
    sample :elec_twang if rand > 0.5
    use_synth :dsaw
    c = [:Ab4, :Bb4, :Ab4, :Eb5, :Ab4, :Bb4, :Eb5, :Bb4].ring.tick
    play chord(c, :minor), pan: rrand(-1,1), amp: 0.3, sustain: 1.5
    sleep 2
  end
  
  live_loop :bass do
    sync :drums
    use_synth :piano
    c = [:Ab1, :Bb1, :Ab1, :Eb2, :Ab1, :Bb1, :Eb2, :Bb1].ring.tick
    6.times do
      play chord(c, :minor).ring.tick, amp: 0.4
      sleep 0.25
    end
  end
  
  live_loop :drums do
    sample :drum_bass_hard, amp: 2
    sleep 0.25
    sample :drum_cymbal_closed
    sleep 0.125
    sleep 0.125
    sample :perc_impact1
    sample :drum_cymbal_closed
    sleep 0.25
    sample :drum_cymbal_open, amp: 0.5
    sleep 0.25
  end
end

