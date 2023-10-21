extends RichTextLabel

var total_characters = get_total_character_count()

func _on_typing_timer_timeout():
	visible_characters += 1

	if total_characters == visible_characters:
		$TypingTimer.stop()
		$TypingTimer.queue_free()

func start_timer():
	$TypingTimer.start()
