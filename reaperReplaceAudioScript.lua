function ImportAudioIntoChannel(index, channel, channelName, fileName)
  reaper.SetEditCurPos(0, false, false)
  local tr = reaper.GetTrack(0, index)
  
  for j = 0, reaper.GetTrackNumMediaItems(tr) - 1 do
    local item = reaper.GetTrackMediaItem(tr, j)
    reaper.DeleteTrackMediaItem(tr, item)
  end
  reaper.SetOnlyTrackSelected(tr, true)
  reaper.InsertMedia(fileName, 0)
  item = reaper.GetTrackMediaItem(tr, 0)
  take = reaper.GetActiveTake(item)
  reaper.SetMediaItemTakeInfo_Value(take, "I_CHANMODE", channel + 64 + 2)  
end

audioFile = "/Users/danielstahl/Documents/Music/Pieces/Module Music/Module Music 9/stage/moduleMusic9-v2.caf"

ImportAudioIntoChannel(1, 1, "Low Sine", audioFile)
ImportAudioIntoChannel(2, 3, "Low Short Sine", audioFile)
ImportAudioIntoChannel(3, 5, "Low Saw", audioFile)

ImportAudioIntoChannel(5, 7, "Middle Low Sine", audioFile)
ImportAudioIntoChannel(6, 9, "Middle Low Short Sine", audioFile)
ImportAudioIntoChannel(7, 11, "Middle Low Saw", audioFile)

ImportAudioIntoChannel(9, 13, "Middle High Sine", audioFile)
ImportAudioIntoChannel(10, 15, "Middle High Short Sine", audioFile)
ImportAudioIntoChannel(11, 17, "Middle High Saw", audioFile)

ImportAudioIntoChannel(13, 19, "High Sine", audioFile)
ImportAudioIntoChannel(14, 21, "High Short Sine", audioFile)
ImportAudioIntoChannel(15, 23, "High Saw", audioFile)