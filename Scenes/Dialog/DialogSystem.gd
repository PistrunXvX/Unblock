extends Control

var id = 0
var local_id = 0
var answer = 0
@onready var txt = $CanvasLayer/dialogWindow/RichTextLabel
@onready var dialogWindow = $CanvasLayer

@export var pitch_range = 0.1

func _process(delta):
	if Events.isStartDialog:
		match Events.currentDialog:
			0:
				showDialogStart(id)
			1:
				showDialogSaler(id)
			2:
				showDialogSaler_2(id)
			3:
				showDialogWife(id)
			4:
				showDialogStrange(id)
			

func _ready():
	dialogWindow.hide()

func playSound():
	while txt.visible_ratio < 1:
		$AudioStreamPlayer.pitch_scale = randf_range(1 - pitch_range, 1 + pitch_range)
#		$AudioStreamPlayer.play()
		txt.visible_characters += 1
		await get_tree().create_timer(0.04).timeout

func showDialogStart(id):
	dialogWindow.show()
	txt.clear()
	txt.visible_ratio = 0
	match id:
		0:
			txt.add_text("Hello, he--o!?")
		1:
			txt.add_text("Okay, so-o-o! I don't have time to explain all, there's a lot of people coming today, so listen up!")
		2:
			txt.add_text("In front of you, on the table, are some papers with lists of 'clients', your predecessor was not very careful, so this job has now fallen to you")
		3:
			txt.add_text("The list of 'customers' lists the names of the customers, their car brands, their license plates, and their color. If you don't miss the right car or miss the right car, you can say goodbye to your job very soon")
		4:
			txt.add_text("Oh and yes, if anyone who isn't on the list is very annoying, then call the bouncer guard Clement")
	if id > 4:
		dialogWindow.hide()
		Events.isFinishDialog = true
#		Events.isStartDialog = false
#		Events.isAcceptCall = false
	else:
		playSound()

func showDialogSaler(id):
	dialogWindow.show()
	txt.clear()
	txt.visible_ratio = 0
	match id:
		5:
			txt.add_text("Good evening, dear client! Did you know that tonight is the perfect time to relax and enjoy your time?")
		6:
			txt.add_text("Excuse me, who are you?")
		7:
			txt.add_text("Then you definitely need to visit our 'Ascent Relaxation Zones' and see it all with your own eyes")
		8:
			txt.add_text("And I can even get you a unique 50% discount on your first visit!")
		9:
			txt.add_text("SAY THE CITY")
		10:
			txt.add_text("It's just wonderful, marvelous! The nearest 'Ascent Relax Zone' is located at 14 Lingering Conversations Street.")
		11:
			txt.add_text("With the promo code 'NightMoon' you can get a 50% discount at the reception! Have a nice night!")
	if id > 11:
		dialogWindow.hide()
		Events.isFinishDialog = true
#		Events.isStartDialog = false
#		Events.isAcceptCall = false
	else:
		playSound()

func showDialogSaler_2(id):
	dialogWindow.show()
	txt.clear()
	txt.visible_ratio = 0
	match id:
		12:
			txt.add_text("Hello! Have you ever thought that your life would be so much better if you always had a... at hand. Hmm. An underwater sandwich!?")
		13:
			txt.add_text("An underwater sandwich, really?")
		14:
			txt.add_text("Yeah-yeah, you're not imagining things and it's not even hallucination, ha-ha!")
		15:
			txt.add_text("Well... I'm not sure.")
		16:
			txt.add_text("I am absolutely thrilled to tell you that the price of our wonderful Aqua Sandwiches on your first order is only $6.99 for a whole, you won't even believe it!")
		17:
			txt.add_text("Whole")
		18:
			txt.add_text("Who-o-ole")
		19:
			txt.add_text("Who-o-ole")
		20:
			txt.add_text("WHOLE NINE SANDWICHES! Can you even imagine?")
		21:
			txt.add_text("Nope")
		22:
			txt.add_text("If you give me your phone number and address, I can place your order right away. And at such a unique and delicious price!")
		23:
			txt.add_text(" I think I'm gonna pass")
		24:
			txt.add_text("You're missing out on a lot in this life, sir! If you change your mind, you can place an order at the number ХХХ-ХХХ-ХХХХ")
		25:
			txt.add_text("I bid you goodnight")
	if id > 25:
		dialogWindow.hide()
		Events.isFinishDialog = true
#		Events.isStartDialog = false
#		Events.isAcceptCall = false
	else:
		playSound()
	
func showDialogWife(id):
	dialogWindow.show()
	txt.clear()
	txt.visible_ratio = 0
	match id:
		26:
			txt.add_text("Hello, dear!?")
		27:
			txt.add_text("Oh, I'm so glad you replied! I can't sleep, really worried about you!")
		28:
			txt.add_text("How do you like the new place, comfortable, bosses aren't strict?")
		29:
			txt.add_text("It's not what I had in mind, it's a rundown place...")
		30:
			txt.add_text("That's awful, but it's okay when you get home, I'll make your favorite dish!")
		31:
			txt.add_text("My boss is an asshole and I'm bored to death at work")
		32:
			txt.add_text("Okay, well, I love you, I'm gonna go try to go back to sleep.")
		33:
			txt.add_text("Have a good job, dear!")
	if id > 33:
		dialogWindow.hide()
		Events.isFinishDialog = true
#		Events.isStartDialog = false
#		Events.isAcceptCall = false
	else:
		playSound()
		
func showDialogStrange(id):
	dialogWindow.show()
	txt.clear()
	txt.visible_ratio = 0
	match id:
		34:
			txt.add_text("Hello, hi.")
		35:
			txt.add_text("Who are you?")
		36:
			txt.add_text("You're bored aren't you?")
		37:
			txt.add_text("Yeah, I'm pretty tired")
		38:
			txt.add_text("You want to hear a joke?")
		39:
			txt.add_text("You are pretty odd, sir...")
		40:
			txt.add_text("A young blonde woman is distraught because she fears her husband is having an affair, so she goes to a gun shop and buys a handgun")
		41:
			txt.add_text("The next day she comes home to find her husband in bed with a beautiful redhead.")
		42:
			txt.add_text("She grabs the gun and holds it to her own head. The husband jumps out of bed, begging and pleading with her not to shoot herself.")
		43:
			txt.add_text("Hysterically the blonde responds to the husband, ”Shut up…you’re next!")
		44:
			txt.add_text("...")
		45:
			txt.add_text("...")
		46:
			txt.add_text("...")
		47:
			txt.add_text("I've never understood that joke")
	if id > 47:
		dialogWindow.hide()
		Events.isFinishDialog = true
#		Events.isStartDialog = false
#		Events.isAcceptCall = false
	else:
		playSound()

func _on_next_pressed():
	id += 1
	match Events.currentDialog:
			0:
				showDialogStart(id)
			1:
				showDialogSaler(id)
			2:
				showDialogSaler_2(id)
			3:
				showDialogWife(id)
			4:
				showDialogStrange(id)

func _on_answer_1_pressed():
	pass

func _on_answer_2_pressed():
	pass

func _on_answer_3_pressed():
	pass
