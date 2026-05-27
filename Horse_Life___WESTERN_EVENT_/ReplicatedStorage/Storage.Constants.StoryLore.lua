-- https://lua.expert/
return {
	Clue1 = {
		Name = "Muddy Slide Marks",
		Text = "Owch, I remember this! When I woke up it felt like my head was pounding relentlessly. I have some bruises on my elbows to show for my tough landing. The marks appear immediately from this odd structure.",
		Choice = "Interesting..."
	},
	Clue2 = {
		Name = "Ripped Backpack",
		Text = "This must be my backpack as well, it\226\128\153s been torn from my fall, it seems to have been violently ripped open and the contents are spilled out.",
		Choice = "Interesting..."
	},
	Clue4 = {
		Name = "Strange Jewels",
		Text = "These odd purple jewels incite no memory, they are vaguely omitting a weak magic signal but it is quickly evaporating through signs of shattering from my rough tumble.",
		Choice = "Interesting..."
	},
	Clue3 = {
		Name = "Journal & Pencil",
		Text = "This journal and pencil must be mine. This journal is shredded and few pages remain. The pencil also shows sign of previous use, I wonder where the rest of the pages are? might lead me to hints about who I am.",
		Choice = "Interesting..."
	},
	Statue1 = {
		Name = "Strange Totem",
		Text = "I gently place my hand on the horse totem, very vague images flash in my mind, horses racing, its so blurry. Loud voices yelling overlap, I don\226\128\153t remember anything. Strong energies of magic and power overwhelm me and I fall backwards. What was that?",
		Choice = "Interesting..."
	},
	Statue2 = {
		Name = "Cracked Structure",
		Text = "Placing my hand on a brick of the column, deep within I sense magical energies thrashing and darting within. The magic feels erratic and unnatural. Though no cracks can be seen in the structure, the energy seems to be seeping through tiny unseen holes.",
		Choice = "Interesting..."
	},
	Statue3 = {
		Name = "Magic Remnants",
		Text = "Wiping my hand across the remnants of magic I\226\128\153m overwhelmed with a memory of flying over a field of overwhelmingly bright flowers, their vivid gradients blur together while I glide across them. I sense a strong connection to magic and nature, yet this feeling quickly evaporates, something is wrong. ",
		Choice = "Interesting..."
	},
	Top = {
		Name = "Injured Foal",
		Text = "The foal\226\128\153s head looks fine, the poor foal is frightened and doesn\226\128\153t trust me. Its ears are pinned back and it\226\128\153s uncertain of me.",
		Choice = "Poor thing.."
	},
	Hoof = {
		Name = "Injured Foal",
		Text = "The foal\'s body has a few scratches and bruises as if it fell down. Hopefully nothing serious is wrong with the baby. Is this my fault?",
		Choice = "I\'m sorry.."
	},
	Bottom = {
		Name = "Injured Foal",
		Text = "The foals\' front leg look a bit twisted, they must have fallen and landed funny. When I reach close to the foal\226\128\153s hoof it pulls away and whinnies at me in contempt.",
		Choice = "Oh yikes!"
	},
	HorseDialogue = {
		Name = "Player",
		Choice = "Let\'s find some treats!",
		Text = { "Hey there little guy I\226\128\153m\226\128\166 Well that\226\128\153s not important, don\226\128\153t be afraid I\226\128\153m a friend! I\226\128\153m just as scared as you are. Where\226\128\153s your parents, fella? Are you lost like me?", "Yeah atta horsie! I\226\128\153m a little injured and lost myself, maybe we should stick together if you\226\128\153ll give me a chance to be your friend!", "It looks like you got an injury on your foot, I have some torn clothing I\'ll take care of it. I really hope this wasn\'t my fault.", "Oh what was that, we can be friends, really? Well I\226\128\153m sure I can get you some snacks to make you feel a bit better..I\226\128\153ll take care of you from now on!" }
	},
	AetherisSpawn = {
		Name = "Strange Crystal",
		Text = "The crystal emanates a strange, ethereal aura. The ground trembles beneath your feet as you sense an ominous presence behind you.",
		Choice = "*worried*"
	},
	LocateAetheris = {
		Name = "Aetheris",
		Text = "H-human child\226\128\166 You must\226\128\166 learn to care for\226\128\166 this land. Heal it, and help\226\128\166 recover\226\128\166 all that has been lost. He must not attain victory",
		Choice = {
			{
				Text = "AHHHH! WHO ARE YOU?",
				Dialog = "Aetheris. Keeper of time and history\226\128\166 I am but a dying spirit horse",
				Choices = {
					{
						Text = "A spirit horse?",
						Dialog = "Very few of us remain, even fewer with our minds in tact... We spirit horses are magical entities.",
						Choices = {
							{
								Text = " I don\226\128\153t understand, What\226\128\153s going on!?",
								Dialog = "Aetheron\226\128\166 is no longer\226\128\166 what it once was. I\226\128\166 I have little time\226\128\166 Fix the cracks\226\128\166 mend all bonds\226\128\166 broken in this world.",
								Choices = {
									{
										Text = " How can I do anything, I\226\128\153m just a kid?",
										Dialog = "You\226\128\166 have no memories, but\226\128\166 an undeniable\226\128\166 understanding of magic. We\226\128\166 we cannot fully\226\128\166 reach you. Find the others\226\128\166 and begin\226\128\166 your journey.",
										Choices = {
											{
												Text = "Find the others\226\128\166a journey, ME?",
												Dialog = "The\226\128\166 bonds and magic we once shared\226\128\166 they are fading. We need\226\128\166 we need someone\226\128\166 someone who can restore\226\128\166",
												Choices = {
													{
														Text = "I suppose I\'ll do what I can.",
														OnRun = function(p1) --[[ OnRun | Line: 111 ]]
															p1.Stop()
														end
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
}