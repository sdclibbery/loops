
with_fx :reverb, room:0.8 do
  live_loop :bd do
    sample :bd_haus
    sleep 0.5
    sample :bd_haus
    sleep 0.5
    sample :bd_haus
    sleep 0.5
    sample :bd_haus
    sleep 0.5
  end
  live_loop :snare do
    sync :bd
    sleep 1.5
    sample :drum_snare_hard
  end
  live_loop :hat do
    sync :bd
    12.times do
      sleep 0.125
      sample :drum_cymbal_closed, amp:0.5
    end
    sleep 0.25
    sample :drum_cymbal_open, amp:0.3
  end
  live_loop :perc do
    sync :bd
    sleep 0.25
    sample :perc_snap2
    sleep 0.75
    sample :perc_snap2
    sleep 1.5
    sample :perc_snap
    sleep 0.25
    sample :perc_snap
  end
end

live_loop :bass do
  with_fx :lpf, cutoff: 70, amp:0.5 do
    sync :bd
    use_synth :dpulse
    play :C2
    sleep 0.5
    play :D2, release:0.3
    sleep 0.25
    play :Eb2
    sleep 0.5
    play :G2
    sleep 0.5
  end
end

live_loop :twinkle do
  with_fx :bitcrusher do
    sync :bd
    use_synth :beep
    use_random_seed tick
    sleep 0.06
    14.times do
      play (scale, :C4, :minor_pentatonic).choose, amp:0.15
      play (scale, :C6, :minor_pentatonic).choose, amp:0.1
      sleep 0.25
    end
  end
end

stop
sync :bd
s = synth :prophet, note: :C5, release:8, note_slide: 2
control s, note: :C2
