with_fx :reverb do
  
  live_loop :beat do
    sample :bd_fat
    sleep 0.25
  end
  
  live_loop :snaps do
    sync :beat
    sleep 0.1
    sample :perc_snap, amp:0.5
    sleep 0.25
    sample :perc_snap2, amp:0.5
    sleep 0.25
    sample :perc_snap, amp:0.5
    sleep 0.25
    sample :perc_snap2, amp:0.5
  end
  
  live_loop :swoosh do
    sync :beat
    sleep 0.3
    sample :perc_swash, amp:0.7
  end
  
  live_loop :ping do
    sync :beat
    sleep 0.3
    sample :elec_ping, amp:0.5
    sleep 0.8
    sample :elec_plip, amp:0.5
  end
  
  with_fx :slicer, wave:1, mix:1 do
    with_fx :echo do
      live_loop :play do
        with_fx :lpf, cutoff:rrand(70,90) do
          sync :beat
          use_synth :prophet
          play :C3, amp: 1, attack: 0.25, release: 2
          sleep 1
          play :D3, amp: 1, attack: 0.25, release: 2
          sleep 3
          play :G4, amp: 1, attack: 0.25, release: 2
          sleep 1
          play :E4, amp: 1, attack: 0.25, release: 2
          sleep 6
        end
      end
    end
  end
  
end