# Welcome to Sonic Pi v3.1


with_fx :reverb do
  
  live_loop :beats do
    sample :loop_amen, beat_stretch:2
    sleep 2
  end
  
  with_fx :slicer do
    live_loop :bass do
      sync :beats
      use_synth :prophet
      play chord(:C3, :minor7).tick, release:2
      sleep 0.5
      play chord(:C3, :minor7).tick, release:2
    end
  end
  
  live_loop :swoosh do
    sync :beats
    sample :ambi_swoosh, rate: 2
    sleep 7
  end
  
end