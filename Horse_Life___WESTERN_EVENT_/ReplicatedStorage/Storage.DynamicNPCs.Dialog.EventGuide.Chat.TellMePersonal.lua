-- https://lua.expert/
return {
	Text = "Tell me about yourself.",
	Dialog = {
		{
			Bond = NumberRange.new(0, 24.99),
			Dialog = {
				{
					Dialog = "Oh... there\226\128\153s not too much to tell just yet. I\226\128\153d rather we get to know each other a little better first."
				},
				{
					Dialog = "Well, I like quiet walks, pretty places, and noticing little things others might miss."
				},
				{
					Dialog = "I\226\128\153ve always liked seasons like this one. Everything feels softer somehow."
				}
			}
		},
		{
			Bond = NumberRange.new(25, 49.99),
			Dialog = {
				{
					Dialog = "I spend a lot of time wandering and observing. I like places that feel calm, bright, and just a little magical."
				},
				{
					Dialog = "I\226\128\153ve always been drawn to flowers, soft colors, and small beautiful details. They make a place feel alive."
				},
				{
					Dialog = "I like being near the Wishing Fountain. It has a peaceful feeling that\226\128\153s hard to explain."
				}
			}
		},
		{
			Bond = NumberRange.new(50, 74.99),
			Dialog = {
				{
					Dialog = "I suppose I\226\128\153m the kind of person who notices when the world changes, even in small ways. A new glow, a hidden path, a flower blooming where there wasn\226\128\153t one before."
				},
				{
					Dialog = "I like quiet places, gentle weather, and anything that feels touched by a little wonder."
				},
				{
					Dialog = "This season suits me. I like the warmth, the color, and the feeling that something lovely might be waiting just around the corner."
				},
				{
					Dialog = "I\226\128\153ve always enjoyed wandering without much of a plan. Sometimes the best things are the ones you find by accident."
				}
			}
		},
		{
			Bond = NumberRange.new(75, 100),
			Dialog = {
				{
					Dialog = "I\226\128\153ve always been drawn to places that feel a little enchanted. Not loud magic... just the quiet kind you notice if you slow down."
				},
				{
					Dialog = "I think I\226\128\153m happiest when I\226\128\153m surrounded by soft colors, fresh air, and little signs that the world is full of surprises."
				},
				{
					Dialog = "I like wandering, wondering, and noticing things others pass by. A hidden egg, a glow in the fountain, a trail that seems to lead somewhere special..."
				},
				{
					Dialog = { "I\226\128\153m not very loud, but I don\226\128\153t mind that.", "I like being the sort of person who helps others notice the beauty around them." }
				},
				{
					Dialog = { "I think this season says a lot about me, actually.", "I like warmth, gentle things, and the feeling that something wonderful could be waiting nearby." }
				},
				{
					Dialog = "And if I had to choose, I\226\128\153d say my favorite thing is that sense of quiet wonder... the feeling that there\226\128\153s always a little more to discover."
				}
			}
		}
	}
}