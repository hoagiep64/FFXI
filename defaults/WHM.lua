function draw_WHM()
	if displaySet == 1 then
		header = label1..color1..Value1.."\\cr      "..label2..color2..Value2.."\\cr      "..label3..color3..Value3.."\\cr      "..label4..color4..Value4.."\\cr      "..label5..color5..Value5.."\\cr      "..label6..color6..Value6.."\\cr      "..label7..color7..Value7.."\\cr      "..label8..color8..Value8.."\\cr      "..label9..color9..Value9.."\\cr      "..label10..color10..Value10.."\\cr"
	elseif windower.ffxi.get_party().party1_count < 2 then
		header = label1..color1..Value1.."\\cr      "..label7..color7..Value7.."\\cr      "..label8..color8..Value8.."\\cr      "..label9..color9..Value9.."\\cr      "..label10..color10..Value10.."\\cr"
	elseif windower.ffxi.get_party().party1_count < 3 then
		header = label1..color1..Value1.."\\cr      "..label2..color2..Value2.."%\\cr      "..label7..color7..Value7.."\\cr      "..label8..color8..Value8.."\\cr      "..label9..color9..Value9.."\\cr      "..label10..color10..Value10.."\\cr"
	elseif windower.ffxi.get_party().party1_count < 4 then
		header = label1..color1..Value1.."\\cr      "..label2..color2..Value2.."%\\cr      "..label3..color3..Value3.."%\\cr      "..label7..color7..Value7.."\\cr      "..label8..color8..Value8.."\\cr      "..label9..color9..Value9.."\\cr      "..label10..color10..Value10.."\\cr"
	elseif windower.ffxi.get_party().party1_count < 5 then
		header = label1..color1..Value1.."\\cr      "..label2..color2..Value2.."%\\cr      "..label3..color3..Value3.."%\\cr       "..label4..color4..Value4.."%\\cr      "..label7..color7..Value7.."\\cr      "..label8..color8..Value8.."\\cr      "..label9..color9..Value9.."\\cr      "..label10..color10..Value10.."\\cr"	
	elseif windower.ffxi.get_party().party1_count < 6 then
		header = label1..color1..Value1.."\\cr      "..label2..color2..Value2.."%\\cr      "..label3..color3..Value3.."%\\cr       "..label4..color4..Value4.."%\\cr       "..label5..color5..Value5.."%\\cr      "..label7..color7..Value7.."\\cr      "..label8..color8..Value8.."\\cr      "..label9..color9..Value9.."\\cr      "..label10..color10..Value10.."\\cr"	
	else
		header = label1..color1..Value1.."\\cr      "..label2..color2..Value2.."%\\cr      "..label3..color3..Value3.."%\\cr       "..label4..color4..Value4.."%\\cr       "..label5..color5..Value5.."%\\cr       "..label6..color6..Value6.."%\\cr      "..label7..color7..Value7.."\\cr      "..label8..color8..Value8.."\\cr      "..label9..color9..Value9.."\\cr      "..label10..color10..Value10.."\\cr"
	end
	texts.text(image,header.."\\cr     ")
end

--WHM--
function refresh_WHM()
	if displaySet == 1 then
		custom_WHM()
	elseif displaySet == 0 then
		--1-- Set
		Set_Display(1)
		-- ~ -- Party Member List Compile -- ~ -- 
		party = windower.ffxi.get_party()
		
		--2-- Party Member 2
		if party.p1 == nil then
			label2 = " "
			Value2 = ""
			color2 = Inactive_col
		else
			label2 = party.p1.name..': '
			Value2 = party.p1.hpp
			if Value2 == 100 then
				color2 = Blizzard_col
			elseif Value2 > 74 then
				color2 = Aero_col
			elseif Value2 > 33 then
				color2 = Stone_col
			elseif Value2 > 0 then
				color2 = Fire_col
			else
				color2 = Inactive_col
			end	
		end
		
		--3-- Party Member 3
		if party.p2 == nil then
			label3 = "N/A"
			Value3 = ""
			color3 = Inactive_col
		else
			label3 = party.p2.name..': '
			Value3 = party.p2.hpp
			if Value3 == 100 then
				color3 = Blizzard_col
			elseif Value3 > 74 then
				color3 = Aero_col
			elseif Value3 > 33 then
				color3 = Stone_col
			elseif Value3 > 0 then
				color3 = Fire_col
			else
				color3 = Inactive_col
			end	
		end
		
		--4-- Party Member 4
		if party.p3 == nil then
			label4 = "N/A"
			Value4 = ""
			color4 = Inactive_col
		else
			label4 = party.p3.name..': '
			Value4 = party.p3.hpp
			if Value4 == 100 then
				color4 = Blizzard_col
			elseif Value4 > 74 then
				color4 = Aero_col
			elseif Value4 > 33 then
				color4 = Stone_col
			elseif Value4 > 0 then
				color4 = Fire_col
			else
				color4 = Inactive_col
			end	
		end
		
		--5-- Party Member 5
		if party.p4 == nil then
			vabel5 = "N/A"
			Value5 = ""
			color5 = Inactive_col
		else
			label5 = party.p4.name..': '
			Value5 = party.p4.hpp
			if Value5 == 100 then
				color5 = Blizzard_col
			elseif Value5 > 74 then
				color5 = Aero_col
			elseif Value5 > 33 then
				color5 = Stone_col
			elseif Value5 > 0 then
				color5 = Fire_col
			else
				color5 = Inactive_col
			end	
		end
		
		--6-- Party Member 6
		if party.p5 == nil then
			label6 = "N/A"
			Value6 = ""
			color6 = Inactive_col
		else
			label6 = party.p5.name..': '
			Value6 = party.p5.hpp
			if Value6 == 100 then
				color6 = Blizzard_col
			elseif Value6 > 74 then
				color6 = Aero_col
			elseif Value6 > 33 then
				color6 = Stone_col
			elseif Value6 > 0 then
				color6 = Fire_col
			else
				color6 = Inactive_col
			end	
		end
		--7-- Divine Caress
		Ability_Display(7,32,453)
		--8-- MPP
		MPP_Display(8)
		Empty(9)
		Empty(10)
	end
end

