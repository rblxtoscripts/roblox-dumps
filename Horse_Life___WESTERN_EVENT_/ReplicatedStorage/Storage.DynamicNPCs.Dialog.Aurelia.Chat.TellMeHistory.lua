-- https://lua.expert/
return {
	Text = "Tell me about this place?",
	Dialog = {
		{
			Bond = NumberRange.new(0, 24.99),
			Dialog = {
				{
					Dialog = "Hmm? What do you want to know anyways, child."
				},
				{
					Dialog = "Aetheron, where we are currently located is a fractured magical land where we are now."
				},
				{
					Dialog = "Some people maliciously take advantage of the past, I\'d be careful asking questions like these."
				},
				{
					Dialog = "Information? History? Learning...? When I was a kid I had no interest in this stuff. Go on now."
				}
			}
		},
		{
			Bond = NumberRange.new(25, 49.99),
			Dialog = {
				{
					Dialog = "Did you know that the different ice from all around the different regions offer different flavors and mineral compositions? My favourite is raw ice from the mountains, it tastes similar to peppermint if you were curious for a comparison that is more.. suitable for your tastes."
				}
			}
		},
		{
			Bond = NumberRange.new(50, 74.99),
			Dialog = {
				{
					Dialog = "You know, just a few years ago horses and people were seen as equals now it seems equestrian life has taken a rather.. primitive role.. I\226\128\153m not sure how I feel about it but when you\'re my age you\226\128\153ll see the flowers bloom and wilt before your very eyes."
				}
			}
		},
		{
			Bond = NumberRange.new(75, 100),
			Dialog = {
				{
					Dialog = "My mother was a priestess and my father was a humble potion maker, their love was both forbidden and unbreakable.. or so I\226\128\153m told, I ended up being raise in an orphanage; funny how fate works. Isn\'t it, snowflake? "
				}
			}
		}
	}
}