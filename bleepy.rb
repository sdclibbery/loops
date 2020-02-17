live_loop :beat do
  with_fx :lpf, cutoff:110+10*Math.sin(tick/3.0) do
    sample :bd_haus
  end
  sleep 0.5
end

live_loop :composer do
  sync :beat
  with_fx :reverb, room:1 do
    7.times do
      synth :chipbass, note:scale(:C3, :minor_pentatonic).choose, release:rrand(0.1,0.25)
      synth :saw, note:scale(:C4, :minor_pentatonic).choose, release:rrand(0,0.25), cutoff:100+20*Math.sin(tick/8.0)
      sleep 0.125
    end
  end
  sample :ambi_lunar_land, beat_stretch:8, cutoff:rrand(90,120) if one_in(8)
end
