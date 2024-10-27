
function CreateFolder(index, name)
  reaper.InsertTrackAtIndex(index, false)
  folder = reaper.GetTrack(0, index)
  reaper.GetSetMediaTrackInfo_String(folder, 'P_NAME', name, true)
  reaper.SetMediaTrackInfo_Value( folder, 'I_FOLDERDEPTH',1)
  reaper.SetMediaTrackInfo_Value(folder, 'I_FOLDERCOMPACT', 0)
end

function ImportAudio(index, channel, trackName, fileName, lastInFolder)
  local folderDepth = 0
  if lastInFolder then folderDepth = -1 end

  reaper.SetEditCurPos(0, false, false)
  reaper.InsertTrackAtIndex(index, false)
  tr = reaper.GetTrack(0, index)
  reaper.GetSetMediaTrackInfo_String(tr, 'P_NAME', trackName, true)
  reaper.SetMediaTrackInfo_Value( tr, 'I_FOLDERDEPTH',folderDepth)
  reaper.SetOnlyTrackSelected(tr, true)
  reaper.InsertMedia(fileName, 0)
  item = reaper.GetTrackMediaItem(tr, 0)
  take = reaper.GetActiveTake(item)
  reaper.SetMediaItemTakeInfo_Value(take, "I_CHANMODE", channel + 64 + 2)
end

audioFile = "/Users/danielstahl/Documents/Music/Pieces/Module Music/Module Music 9/stage/moduleMusic9-v1.caf"

CreateFolder(0, "Low")
ImportAudio(1, 1, "Low Sine", audioFile, false)
ImportAudio(2, 3, "Low Short Sine", audioFile, false)
ImportAudio(3, 4, "Low Saw", audioFile, true)

CreateFolder(4, "Middle Low")
ImportAudio(5, 7, "Middle Low Sine", audioFile, false)
ImportAudio(6, 9, "Middle Low Short Sine", audioFile, false)
ImportAudio(7, 11, "Middle Low Saw", audioFile, true)

CreateFolder(8, "Middle High")
ImportAudio(9, 13, "Middle High Sine", audioFile, false)
ImportAudio(10, 15, "Middle High Short Sine", audioFile, false)
ImportAudio(11, 17, "Middle High Saw", audioFile, true)

CreateFolder(12, "High")
ImportAudio(13, 19, "High Sine", audioFile, false)
ImportAudio(14, 21, "High Short Sine", audioFile, false)
ImportAudio(15, 23, "High Saw", audioFile, true)
