extends AudioStreamPlayer

const level_music = preload("res://sounds/bgm/Tekken 8 Main Menu Theme.mp3")

func _play_music(music: AudioStream, volume = 0.0):
	if stream == music:
		return
	
	stream = music
	volume_db = volume
	play()
	
func play_music_lvl():
	_play_music(level_music)
