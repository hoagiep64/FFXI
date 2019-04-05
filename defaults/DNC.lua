-- DANCER --
function refresh_DNC()
	if displaySet == 1 then -- Checks for User's custom display labels
		custom_DNC()
	elseif displaySet == 0 then -- Use Paulu's Default DNC display
		--1-- Set
		Set_Display(1)
		--2-- Sambas
		Samba_Display(2)
		--3--
		Steps_Display(3)
		--4-- Flourishes I
		Ability_Display(4,221) 
		--5-- Flourishes II
		Ability_Display(5,222,375)
		--6-- Flourishes III
		Ability_Display(6,226)
		--7-- Contradance
		Ability_Display(7,229,582)
		--8-- Subjob
		Subjob_Display(8)
		Empty(9)
		Empty(10)
	end
end