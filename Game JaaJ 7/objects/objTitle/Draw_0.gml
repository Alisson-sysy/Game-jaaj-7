timer++;

if (active) {
	switch (eventMoment) {
		case 0:
			draw_set_alpha(.7);
			draw_set_color(c_black);
			
			draw_rectangle(0, 392/2 + bbgHeight - 40, 672, 392/2 - bbgHeight - 40, false);
			bbgHeight = min(bbgHeight + 1, 20);
			
			if (bbgHeight == 20) {
				eventMoment++;
				startTitle = timer;
			}
			break;
		case 1:
			draw_set_alpha(.7);
			draw_set_color(c_black);
			
			draw_rectangle(0, 392/2 + bbgHeight - 40, 672, 392/2 - bbgHeight - 40, false);
			bbgHeight = min(bbgHeight + 1, 20);
			
			draw_set_alpha(1);
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			draw_set_font(fonDungeon);
			
			var cwidth = 0;
			for (var i = 1; i < string_length(name) + 1; i++) {
				if (startTitle + (i * 20) - (i * 10) < timer and startTitle + ((i + 1) * 20) > timer) {
					var xshk = random_range(-3, 3);
					var yshk = random_range(-3, 3);
				} else {
					var xshk = 0;
					var yshk = 0;
				}
				if (startTitle + (i * 20) < timer) {
					draw_set_color(c_black);
					draw_text(672/2 - string_width(name)/2 + cwidth + xshk, 392/2 - 33 + yshk, string_char_at(name, i));
					draw_set_color(c_white);
					draw_text(672/2 - string_width(name)/2 + cwidth + xshk, 392/2 - 35 + yshk, string_char_at(name, i));
					cwidth += string_width(string_char_at(name, i));
				}
			}
			
			if (startTitle + 140 < timer) {
				eventMoment++;
			}
			break;
		case 2:
			draw_set_alpha(.7);
			draw_set_color(c_black);
			
			draw_rectangle(0, 392/2 + bbgHeight - 40, 672, 392/2 - bbgHeight - 40, false);
			bbgHeight = min(bbgHeight + 1, 20);
			
			draw_set_alpha(1);
			
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			draw_set_font(fonDungeon);
			
			var cwidth = 0;
			for (var i = 1; i < string_length(name) + 1; i++) {
				if (startTitle + (i * 20) - (i * 10) < timer and startTitle + ((i + 1) * 20) > timer) {
					var xshk = random_range(-3, 3);
					var yshk = random_range(-3, 3);
				} else {
					var xshk = 0;
					var yshk = 0;
				}
				if (startTitle + (i * 20) < timer) {
					draw_set_color(c_black);
					draw_text(672/2 - string_width(name)/2 + cwidth + xshk, 392/2 - 33 + yshk, string_char_at(name, i));
					draw_set_color(c_white);
					draw_text(672/2 - string_width(name)/2 + cwidth + xshk, 392/2 - 35 + yshk, string_char_at(name, i));
					cwidth += string_width(string_char_at(name, i));
				}
			}
			
			draw_set_halign(fa_center);
			draw_set_valign(fa_center);
			draw_set_font(fonMiddle);
			
			var subt = string_copy(subtitle, 0, subQt);
			if (timer % 5 == 0) subQt = min(subQt + 1, string_length(subtitle));
			draw_text(672/2, 190, subt);
			
			if (startTitle + 250 < timer) {
				objLifeBar.barTargetY = 165;
				objLifeBar.detailTargetY = 165;
				objLifeBar.sdetailTargetY = 165;
				
				if (abs(objLifeBar.sdetailTargetY - objLifeBar.sdetailY) < 1) {
					objLifeBar.lifeGrow++;
				}
				
				if (objLifeBar.lifeGrow > 261) {
					eventMoment++;
				}
			}
			
			
			break;
			
		case 3:
			
			break;
	}
}