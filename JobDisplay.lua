--JobDisplay
-- Copyright © 2019, Paulu
-- All rights reserved.
--
-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions are met:
--
--     * Redistributions of source code must retain the above copyright
--       notice, this list of conditions and the following disclaimer.
--     * Redistributions in binary form must reproduce the above copyright
--       notice, this list of conditions and the following disclaimer in the
--       documentation and/or other materials provided with the distribution.
--     * Neither the name of JobDisplay nor the
--       names of its contributors may be used to endorse or promote products
--       derived from this software without specific prior written permission.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
-- ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
-- WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
-- DISCLAIMED. IN NO EVENT SHALL Paulu BE LIABLE FOR ANY
-- DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
-- (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE greenS OR SERVICES;
-- LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
-- ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
-- (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
-- SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

_addon.name    = 'JobDisplay'
_addon.author  = 'Paulu'
_addon.version = '1.0'
_addon.command = 'jd'

config = require ('config')
texts = require('texts')
res = require('resources')

idle_terms = T{'Idle','Regen','Refresh','Movement'}
pause = false
stop = false

defaults = T{}
defaults.pos_x = 0
defaults.pos_y = 0
defaults.font_size = 14
defaults.bg_alpha = 255
defaults.font = 'Arial'

settings = config.load(defaults)
-- Element Colors --
--[[
Stone_col = "\\cs("..tostring(settings.Stone_R)..","..tostring(settings.Stone_G)..","..tostring(settings.Stone_B)..")"
Water_col = "\\cs("..tostring(settings.Water_R)..","..tostring(settings.Water_G)..","..tostring(settings.Water_B)..")"
Aero_col = "\\cs("..tostring(settings.Aero_R)..","..tostring(settings.Aero_G)..","..tostring(settings.Aero_B)..")"
Fire_col = "\\cs("..tostring(settings.Fire_R)..","..tostring(settings.Fire_G)..","..tostring(settings.Fire_B)..")"
Blizzard_col = "\\cs("..tostring(settings.Blizzard_R)..","..tostring(settings.Blizzard_G)..","..tostring(settings.Blizzard_B)..")"
Thunder_col = "\\cs("..tostring(settings.Thunder_R)..","..tostring(settings.Thunder_G)..","..tostring(settings.Thunder_B)..")"
Dark_col = "\\cs("..tostring(settings.Dark_R)..","..tostring(settings.Dark_G)..","..tostring(settings.Dark_B)..")"
Light_col = "\\cs("..tostring(settings.Light_R)..","..tostring(settings.Light_G)..","..tostring(settings.Light_B)..")"--]]

Stone_col = "\\cs(255,180,0)"
Water_col = "\\cs(90,130,255)"
Aero_col = "\\cs(0,255,0)"
Fire_col = "\\cs(255,0,0)"
Blizzard_col = "\\cs(68,203,237)"
Thunder_col = "\\cs(180,80,250)"
Dark_col = "\\cs(180,0,180)"
Light_col = "\\cs(255,255,0)"
Inactive_col = "\\cs(165,165,165)"
White_col = "\\cs(255,255,255)"
null_col = ''

label1 = '--'
label2 = '--'
label3 = '--'
label4 = '--'
label5 = '--'
label6 = '--'
label7 = '--'
label8 = '--'
label9 = '--'
label10 = '--'

Value1 = '--'
Value2 = '--'
Value3 = '--'
Value4 = '--'
Value5 = '--'
Value6 = '--'
Value7 = '--'
Value8 = '--'
Value9 = '--'
Value10 = '--'

color1 = Inactive_col
color2 = White_col
color3 = White_col
color4 = White_col
color5 = White_col
color6 = White_col
color7 = White_col
color8 = White_col
color9 = White_col
color10 = White_col

image = texts.new("image")
texts.color(image,settings.text_R,settings.text_G,settings.text_B)
texts.size(image,settings.font_size)
texts.pos_x(image,settings.pos_x)
texts.pos_y(image,settings.pos_y)
texts.bg_alpha(image,settings.bg_alpha)
texts.font(image,settings.font)

-- Updates Box with information -- 
function draw()
	header = label1..color1..Value1.."\\cr      "..label2..color2..Value2.."\\cr      "..label3..color3..Value3.."\\cr      "..label4..color4..Value4.."\\cr      "..label5..color5..Value5.."\\cr      "..label6..color6..Value6.."\\cr      "..label7..color7..Value7.."\\cr      "..label8..color8..Value8.."\\cr      "..label9..color9..Value9.."\\cr      "..label10..color10..Value10.."\\cr"
	texts.text(image,header.."\\cr     ")
end
---------------------------------------------------------------------------------------
-- Using the ability_recasts ID, displays the JA name and readiness.
function Ability_Display(column,abil,buff,label) -- (Column #) (Ability_recast ID) (buff ID) (Custom Label)
	local abilityName = res.ability_recasts[abil].en
	if abilities:find(res.ability_recasts[abil].action_id) or abilityName == 'Phantom Roll' or abilityName == 'Sic/Ready' or abilityName == 'Random Deal' then -- Confirm the ability ID entered is valid in current context
		local ability = windower.ffxi.get_ability_recasts()[abil]
		local lab
		local val
		local ccol

		if buff == 999 or buff == nil then -- No buff associated with this ability. Skips BuffActive checks.
			lab = abilityName..': '
			if ability == 0 then
				val = " O"
				ccol = Aero_col
				lab = abilityName..': '
			elseif ability < 12 then
				val = " X"
				ccol = Stone_col
			else
				val = " X"
				ccol = Fire_col
			end
			if label ~= nil then
				lab = label
			end
			Finalize_Column(column,lab,val,ccol)
		else
			lab = abilityName..': '
			if ability == 0 and BuffActive(buff) == false then
				val = " O"
				ccol = Aero_col
			elseif ability == 0 and BuffActive(buff) == true then
				val = " O"
				ccol = Blizzard_col
			elseif ability > 0 and BuffActive(buff) == true then
				val = " X"
				ccol = Blizzard_col
			elseif ability < 12 then
				val = " X"
				ccol = Stone_col
			else
				val = " X"
				ccol = Fire_col
			end
			if label ~= nil then
				lab = label
				Finalize_Column(column,lab,val,ccol)
			else
				Finalize_Column(column,lab,val,ccol)
			end
		end
	else
		Empty(column) -- ability_recasts ID was invalid or ability not merited.
	end
end

function Spell_Display(column,spell_id) -- Displays a spell and if it's on cooldown or not.
	local lab = res.spells[spell_id].en..': '
	local recast = windower.ffxi.get_spell_recasts()[spell_id]/60
	if recast == 0 then
		val = 'O'
		ccol = Aero_col
	elseif recast < 6 then
		val = 'X'
		ccol = Stone_col
	else
		val = 'X'
		ccol = Fire_col
	end
	Finalize_Column(column,lab,val,ccol)
end

function Empty(column) -- Sets column to blank.
	Finalize_Column(column,'','','')
end

function Subjob_Display(column) -- Displays one PREDETERMINED subjob ability
	if sub == 'SAM' then
		Hasso_Seigan_Display(column)
	elseif sub == 'DRK' then
		Ability_Display(column,87,64) -- Last Resort
	elseif sub == 'DNC' then
		Samba_Display(column) -- Samba Display
	elseif sub == 'WAR' then
		Ability_Display(column,1,56) -- Berserk
	elseif sub == 'RNG' then
		Ability_Display(column,124,72) -- Sharpshot
	elseif sub == 'BLM' then
		Ability_Display(column,38,79) -- Elemental Seal
	elseif sub == 'RDM' then
		Ability_Display(column,49) -- Convert
	elseif sub == 'WHM' then
		Ability_Display(column,26,78) -- Divine Seal
	elseif sub == 'NIN' then
		Shihei_Display(column) -- Shihei Counter
	elseif sub == 'SMN' then
		local pet = windower.ffxi.get_mob_by_target('pet')
		if pet ~= nil then
			Ability_Display(column,174) -- Blood Pact: Ward
		else
			Empty(column) -- Empty
		end
	elseif sub == 'MNK' then
		Ability_Display(column,13,59) -- Focus
	elseif sub == 'THF' then
		Ability_Display(column,64,65) -- Sneak Attack
	elseif sub == 'PLD' then
		Ability_Display(column,75,62) -- Sentinel
	elseif sub == 'BST' then
		Pet_Display(column) -- Pet Display
	elseif sub == 'BRD' then
		Empty(column) -- Empty
	elseif sub == 'DRG' then
		Ability_Display(column,159) -- High Jump
	elseif sub == 'BLU' then
		Buff_Display(column,93) -- Defense Boost (Cocoon)
	elseif sub == 'COR' then 
		Ability_Display(column,193) -- Phantom Roll
	elseif sub == 'PUP' then
		Pet_Display(column) -- Pet Display
	elseif sub == 'GEO' then
		Ability_Display(column,245,517) -- Collimated Fervor
	elseif sub == 'RUN' then
		Ability_Display(column,23,531) -- Vallation
	elseif sub == 'SCH' then
		Strategem_Display(column) -- Strategems
	end
end

function Hasso_Seigan_Display(column) -- Displays Third Eye or Hasso and their recast when active. Otherwise defaults to Seigan.
	if BuffActive(353) then -- Is Hasso active?
		Ability_Display(column,138,353) -- Hasso
	elseif not BuffActive(354) then -- Is Seigan not active?
		Ability_Display(column,139,354) -- Seigan
	else
		Ability_Display(column,133,67) -- Third Eye
	end
end

function Phantom_Roll_Display(column) -- Displays Phantom Roll, Double-Up, Snake Eye, and Fold.
	local PRrecast = windower.ffxi.get_ability_recasts()[193]
	local SErecast = windower.ffxi.get_ability_recasts()[197]
	if BuffActive(308) and SErecast == 0 then -- Double-Up active and Phantom Roll not ready
		Ability_Display(column,197,357) -- Snake Eye
	elseif PRrecast > 0 and BuffActive(308) then
		Ability_Display(column,194,308)
	elseif PRrecast > 0 then -- Double-Up change active
		Ability_Display(column,198) -- Fold
	else
		Ability_Display(column,193)
	end
end

function Quickdraw_Display(column) -- Changes color if at least 1 QD is avaiable. (Stratgem-like facelift to come)
	local recast = windower.ffxi.get_ability_recasts()[195]/60
	if recast == 0 then
		Ability_Display(column,195)
	elseif recast < 60 then
		Finalize_Column(column,'Quickdraw: ','X',Stone_col)
	else
		Ability_Display(column,195)
	end
end

function Samba_Display(column) -- Tracks Sambas in a single column.
	if BuffActive(368) then
		Ability_Display(column,216,368,'Drain Samba') -- Drain Samba
	elseif BuffActive(369) then
		Ability_Display(column,216,369,'Aspir Samba') -- Aspir Samba
	elseif BuffActive(370) then
		Ability_Display(column,216,370,'Haste Samba') -- Haste Samba
	else
		Finalize_Column(column,'Sambas',': None',Inactive_col)
	end
end

function MPP_Display(column) -- Displays Player's current MP% with varying colors per MP%.
	local maxmp = windower.ffxi.get_player().vitals.max_mp
	local mp = windower.ffxi.get_player().vitals.mp
	local mpp = windower.ffxi.get_player().vitals.mpp
	local lab = 'MP: '
	local ccol
	local val = mpp..'%'
	
	if mpp == 100 then
		ccol = Blizzard_col
	elseif mpp > 74 then
		ccol = Aero_col
	elseif mpp > 33 then
		ccol = Stone_col
	elseif mpp > 0 then
		ccol = Fire_col
	else
		ccol = Inactive_col
	end
	Finalize_Column(column,lab,val,ccol) -- column, label, value, column color
end

function HPP_Display(column) -- Displays Player's current HP% with varying colors per HP%.
	local maxhp = windower.ffxi.get_player().vitals.max_hp
	local hp = windower.ffxi.get_player().vitals.hp
	local hpp = windower.ffxi.get_player().vitals.hpp
	local col = column
	local lab
	local val
	local ccol
	val = (hp..'/'..maxhp..' | '..hpp..'%')
	lab = 'HP: '
	if hpp == 100 then
		ccol = Blizzard_col
	elseif hpp > 74 then
		ccol = Aero_col
	elseif hpp > 33 then
		ccol = Stone_col
	elseif hpp > 0 then
		ccol = Fire_col
	else
		ccol = Inactive_col
	end
	Finalize_Column(col,lab,val,ccol) -- column, label, value, column color
end

function TP_Display(column) -- Displays Player's current TP% with varying colors per 1000% TP.
	local tp = windower.ffxi.get_player().vitals.tp
	local col = column
	local lab
	local val
	local ccol
	val = tp..'% '
	lab = 'TP: '
	if tp > 2999 then
		ccol = Fire_col
	elseif tp > 1999 then
		ccol = Stone_col
	elseif tp > 999 then
		ccol = Aero_col
	else
		ccol = Inactive_col
	end
	Finalize_Column(col,lab,val,ccol) -- column, label, value, column color
end

function Party_Member_HP_Display(column,member) -- Displays a single party member's HP% (member 1-6)
	local lab
	local ccol
	local val
	local party = windower.ffxi.get_party()
	if member == 1 then
		if party.p0 == nil then
			lab = "N/A"
			val = ""
			ccol = Inactive_col
		else
			lab = party.p0.name..': '
			val = party.p0.hpp
		end		
	elseif member == 2 then
		if party.p1 == nil then
			lab = "N/A"
			val = ""
			ccol = Inactive_col
		else
			lab = party.p1.name..': '
			val = party.p1.hpp
		end	
	elseif member == 3 then
		if party.p2 == nil then
			lab = "N/A"
			val = ""
			ccol = Inactive_col
		else
			lab = party.p2.name..': '
			val = party.p2.hpp
		end		
	elseif member == 4 then
		if party.p3 == nil then
			lab = "N/A"
			val = ""
			ccol = Inactive_col
		else
			lab = party.p3.name..': '
			val = party.p3.hpp
		end	
	elseif member == 5 then
		if party.p4 == nil then
			lab = "N/A"
			val = ""
			ccol = Inactive_col
		else
			lab = party.p4.name..': '
			val = party.p4.hpp
		end		
	elseif member == 6 then
		if party.p5 == nil then
			lab = "N/A"
			val = ""
			ccol = Inactive_col
		else
			lab = party.p5.name..': '
			val = party.p5.hpp
		end	
	end
		
	if val == 100 then
		ccol = Blizzard_col
	elseif val > 74 then
		ccol = Aero_col
	elseif val > 33 then
		ccol = Stone_col
	elseif val > 0 then
		ccol = Fire_col
	else
		ccol = Inactive_col
	end	
	
	if val ~= "" then
		val = val..'%'
	end
	
	Finalize_Column(column,lab,val,ccol)
end

function Buff_Display(column,buff_id) -- Displays a status effect and whether it's active or not.
	local lab = res.buffs[buff_id].en..': '
	local val
	local ccol
	
	if BuffActive(buff_id) then
		val = ' ↑↑↑'
		ccol = Blizzard_col
	else
		val = ' ↓↓↓'
		ccol = Fire_col
	end
	Finalize_Column(column,lab,val,ccol)
end

function Steps_Display(column) -- Displays number finishing moves.
	local lab = "Finishing Moves: "
	local ccol
	local val
	if BuffActive(588) then
		val = '6+'
		ccol = Blizzard_col
	elseif BuffActive(385) then
		val = '5'
		ccol = Aero_col
	elseif BuffActive(384) then
		val = '4'
		ccol = Aero_col
	elseif BuffActive(383) then
		val = '3'
		ccol = Aero_col
	elseif BuffActive(382) then
		val = '2'
		ccol = Stone_col	
	elseif BuffActive(381) then
		val = '1'
		ccol = Stone_col	
	else
		val = '0'
		ccol = Fire_col
	end
	Finalize_Column(column,lab,val,ccol)
end

function Enspell_Display(column) -- Displays the current enspell, if any.
	local lab = 'Enspell: '
	local val
	if BuffActive(274) then -- Enlight
		ccol = Light_col
		val = 'Enlight'
	elseif BuffActive(94) or BuffActive(277) then -- Enfire1/2
		ccol = Fire_col
		val = 'Enfire'
	elseif BuffActive(95) or BuffActive(278)   then -- Enblizzard1/2
		ccol = Blizzard_col
		val = 'Enblizzard'
	elseif BuffActive(96) or BuffActive(279)  then -- Enaero1/2
		ccol = Aero_col
		val = 'Enaero'
	elseif BuffActive(97) or BuffActive(280)  then -- Enstone1/2
		ccol = Stone_col
		val = 'Enstone'
	elseif BuffActive(98) or BuffActive(281)  then -- Enthunder1/2
		ccol = Thunder_col
		val = 'Enthunder'
	elseif BuffActive(99) or BuffActive(282)  then -- Enwater1/2
		ccol = Water_col
		val = 'Enwater'
	elseif BuffActive(288) then -- Endark
		ccol = Dark_col
		val = 'Endark'
	else
		ccol = Inactive_col
		val = ' X'
	end	
	Finalize_Column(column,lab,val,ccol)
end

function Shihei_Display(column) -- Counts and displays Shihei in Player's main inventory.
	local col = column
	local lab
	local val
	local ccol
		if BuffActive(66) then
			lab = (res.buffs[66].en..' ') -- Copy Image
		elseif BuffActive(444) then
			lab = (res.buffs[444].en..' ') -- Copy Image 2
		elseif BuffActive(445) then
			lab = (res.buffs[445].en..' ') -- Copy Image 3
		elseif BuffActive(446) then
			lab = (res.buffs[446].en..' ') -- Copy Image +4
		else
			lab = 'Shihei: '
		end

		local i = 1
		local foundit = false
		for k,v in pairs(windower.ffxi.get_items().inventory[i]) do
			if windower.ffxi.get_items().inventory[i].id == 1179 then
				val = windower.ffxi.get_items().inventory[i].count
				foundit = true
			end
			i = i + 1
			--windower.add_to_chat(2, tostring(k)..' '..tostring(v))
		end
		if foundit == false then
			val = 0
		end
		if val > 16 then
			ccol = Blizzard_col
		elseif val > 15 then
			ccol = Stone_col
		elseif val < 5 then
			ccol = Fire_col
		else
			ccol = Fire_col
		end
		val = ('['..val..']')
		Finalize_Column(col,lab,val,ccol)
end

function Item_Display(column,item_id) -- Counts and displays Shihei in Player's main inventory.
	local col = column
	local lab = res.items[item_id].en..': '
	local val = 0
	local ccol
		
	local i = 1
	local foundit = false
	for k,v in pairs(windower.ffxi.get_items().inventory[i]) do
		if windower.ffxi.get_items().inventory[i].id == item_id then
			val = val + windower.ffxi.get_items().inventory[i].count
			foundit = true
		end
		i = i + 1
		--windower.add_to_chat(2, tostring(k)..' '..tostring(v))
	end
	if foundit == false then
		val = 0
	end
	if val > 6 then
		ccol = Aero_col
	elseif val > 3 then
		ccol = Stone_col
	else
		ccol = Fire_col
	end
	val = ('['..val..']')
	Finalize_Column(col,lab,val,ccol)
end

function Range_Display(column) -- Will call Ammo_Display ONLY if Player has a 'Range' equiped. 
	local items = windower.ffxi.get_items()
	local ammoslot = items.equipment.ammo
	local rangeSlot = items.equipment.range

	if items.equipment.range ~= 0 then
		Ammo_Display(column)
	else
		Finalize_Column(column,' ',' ',' ')
	end
end

function Ammo_Display(column) -- Displays equipped 'Ammo' name and current count. Use Range_Display() unless tracking throwing items.
	local lab
	local val
	local ccol
	local items = windower.ffxi.get_items()
	local ammoslot = items.equipment.ammo
	if items.equipment.ammo ~= 0 then
		local ammoStorage = items.equipment.ammo_bag
		local ammoName = res.items[windower.ffxi.get_items(ammoStorage,ammoslot).id].en
		local ammoCount = windower.ffxi.get_items(ammoStorage,ammoslot).count
		if ammoCount > 20 then
			ccol = Blizzard_col
		elseif ammoCount > 4 then
			ccol = Stone_col
		else
			ccol = Fire_col
		end
		lab = (ammoName..': ')
		val = ('['..ammoCount..']')
	else
		lab = 'Ammo: '
		val = 'None'
		ccol = Fire_col
	end
	Finalize_Column(column,lab,val,ccol)
end

function Favor_Display(column) -- Displays Player's current active Avatar's Favor effect
	local pet = windower.ffxi.get_mob_by_target('pet')
	local lab
	local val
	local ccol
	
	lab = 'Favor: '
	if pet ~= nil then
		val = tostring(pet.name)
		if BuffActive(577) and pet.name == 'Cait Sith' then -- Cait Sith's Favor
			ccol = Light_col
		elseif BuffActive(422) and pet.name == 'Carbuncle' then -- Carbuncle's Favor
			ccol = Light_col
		elseif BuffActive(423) and pet.name == 'Ifrit' then -- Ifrit's Favor
			ccol = Fire_col
		elseif BuffActive(424) and pet.name == 'Shiva' then -- Shiva's Favor
			ccol = Blizzard_col
		elseif BuffActive(425) and pet.name == 'Garuda' then -- Garuda's Favor
			ccol = Aero_col
		elseif BuffActive(426) and pet.name == 'Titan' then -- Titan's Favor
			ccol = Stone_col
		elseif BuffActive(427) and pet.name == 'Ramuh' then -- Ramuh's Favor
			ccol = Thunder_col
		elseif BuffActive(428) and pet.name == 'Leviathan' then -- Leviathan's Favor
			ccol = Water_col
		elseif BuffActive(429) and pet.name == 'Fenrir' then -- Fenrir's Favor
			ccol = Dark_col
		elseif BuffActive(430) and pet.name == 'Diabolos' then -- Diabolos's Favor
			ccol = Dark_col
		else
			ccol = Inactive_col
		end
	else
		val = 'None'
		ccol = Inactive_col
	end
	Finalize_Column(column,lab,val,ccol)
end

function Pet_Display(column) -- Pet's Current HP%
	local pet = windower.ffxi.get_mob_by_target('pet')
	local lab 
	local val
	local ccol
	
	if pet == nil then
		lab = ''
		ccol = Inactive_col
		val = ''
		--local jp = windower.ffxi.get_player().job_points.smn.jp_spent
		--local skill = windower.ffxi.get_player().skills['Summoning Magic']
	else
		local pethpp = pet.hpp
		local pettp = pet.tp
		lab = (pet.name..'\'s HP: ')
		if pethpp == 100 then
			ccol = Blizzard_col
		elseif pethpp > 74 then
			ccol = Aero_col
		elseif pethpp > 33 then
			ccol = Stone_col
		elseif pethpp > 0 then
			ccol = Fire_col
		else
			ccol = Inactive_col
		end
		val = (pethpp..'%')
	end
	
	Finalize_Column(column,lab,val,ccol)
end

function Strategem_Display(column) -- Displays the number of currently available Strategems.
	local val
	local lab = 'Strategems: '
	local ccol
	if sub == 'SCH' then
		local recast = windower.ffxi.get_ability_recasts()[231]
		if recast == 0 then
			val = '2'
			ccol = Blizzard_col
		elseif recast < 120 then
			val = '1'
			ccol = Stone_col
		else
			val = '0'
			ccol = Fire_col
		end
		Finalize_Column(column,lab,val,ccol) 
	elseif job == 'SCH' then
		local recast = windower.ffxi.get_ability_recasts()[231]
		if sch_jp > 549 then
			if recast == 0 then
				val = '4'
				ccol = Blizzard_col
			elseif recast < 33 then
				val = '3'
				ccol = Aero_col	
			elseif recast < 66 then
				val = '2'
				ccol = Stone_col
			elseif recast < 99 then
				val = '1'
				ccol = Light_col
			else
				val = '0'
				ccol = Fire_col
			end			
		else
			if recast == 0 then
				val = '4'
				ccol = Blizzard_col
			elseif recast < 48 then
				val = '3'
				ccol = Aero_col	
			elseif recast < 96 then
				val = '2'
				ccol = Stone_col
			elseif recast < 144 then
				val = '1'
				ccol = Light_col
			else
				val = '0'
				ccol = Fire_col
			end	
		end
		Finalize_Column(column,lab,val,ccol) 
	else
		Empty(column)
	end
end

function Arts_Display(column) -- Custom display of Light/Dark Arts.
	local lab
	local val
	local ccol
	
	if BuffActive(358) then
		Ability_Display(column,228,358)
	elseif BuffActive(401) then
		lab = "Light Arts +: "
		val = "O"
		if windower.ffxi.get_ability_recasts()[228] == 0 then
			ccol = Blizzard_col
		else
			ccol = Fire_col
		end
		Finalize_Column(column,lab,val,ccol)
	elseif BuffActive(359) then
		Ability_Display(column,232,359)
	elseif BuffActive(402) then
		lab = "Dark Arts +: "
		val = "O"
		if windower.ffxi.get_ability_recasts()[232] == 0 then
			ccol = Blizzard_col
		else
			ccol = Fire_col
		end
		Finalize_Column(column,lab,val,ccol)
	else
		lab = "Arts: "
		val = "None"
		ccol = Fire_col
		Finalize_Column(column,lab,val,ccol)
	end
end

function Sic_Ready_Display(column,gear)
	local val
	local lab = 'Ready: '
	local ccol
	local reductionGear = tonumber(gear)
	local recast = windower.ffxi.get_ability_recasts()[102]
	local chargetime = 30

	if bst_jp > 99 then
		chargetime = chargetime - bst_merits - reductionGear - 5
	else
		chargetime = chargetime - bst_merits - reductionGear
	end
	
	if recast == 0 then
		val = '[3]'
		ccol = Blizzard_col
	elseif recast/chargetime <= 1 then
		val = '[2]'
		ccol = Aero_col
	elseif recast/chargetime <= 2 then
		val = '[1]'
		ccol = Aero_col
	else
		val = '[0]'
		ccol = Fire_col
	end
	Finalize_Column(column,lab,val,ccol) 
end

function Finalize_Column(col,lab,val,ccol) -- column, label, value, column color
	if col == 1 then
		if lab ~= nil then
			label1 = lab
		end
		if val ~= nil then
			Value1 = val
		end
		if ccol ~= nil then
			color1 = ccol
		end
	elseif col == 2 then
		if lab ~= nil then
			label2 = lab
		end
		if val ~= nil then
			Value2 = val
		end
		if ccol ~= nil then
			color2 = ccol
		end
	elseif col == 3 then
		if lab ~= nil then
			label3 = lab
		end
		if val ~= nil then
			Value3 = val
		end
		if ccol ~= nil then
			color3 = ccol
		end
	elseif col == 4 then
		if lab ~= nil then
			label4 = lab
		end
		if val ~= nil then
			Value4 = val
		end
		if ccol ~= nil then
			color4 = ccol
		end
	elseif col == 5 then
		if lab ~= nil then
			label5 = lab
		end
		if val ~= nil then
			Value5 = val
		end
		if ccol ~= nil then
			color5 = ccol
		end
	elseif col == 6 then
		if lab ~= nil then
			label6 = lab
		end
		if val ~= nil then
			Value6 = val
		end
		if ccol ~= nil then
			color6 = ccol
		end
	elseif col == 7 then
		if lab ~= nil then
			label7 = lab
		end
		if val ~= nil then
			Value7 = val
		end
		if ccol ~= nil then
			color7 = ccol
		end
	elseif col == 8 then
		if lab ~= nil then
			label8 = lab
		end
		if val ~= nil then
			Value8 = val
		end
		if ccol ~= nil then
			color8 = ccol
		end
	elseif col == 9 then
		if lab ~= nil then
			label9 = lab
		end
		if val ~= nil then
			Value9 = val
		end
		if ccol ~= nil then
			color9 = ccol
		end
	elseif col == 10 then
		if lab ~= nil then
			label10 = lab
		end
		if val ~= nil then
			Value10 = val
		end
		if ccol ~= nil then
			color10 = ccol
		end	
	end
end

function Set_Display(column,value,color) -- Player input driven set display for use with 'jd set' command.
	local lab = 'Set: '
	Finalize_Column(column,lab,value,Confirm_Color(color))
end

function Confirm_Color(color)
	if color == nil then
		return
	end
	local col = string.lower(color)
	if col == 'stone' or col == 'gold' or col == 'brown' or col == 'rock' or col == 3 or col == '3' then
		return Stone_col
	elseif col == 'water' or col == 'blue' or col == 'hydro' or col == 'rain' or col == 5 or col == '5' then
		return Water_col
	elseif col == 'aero' or col == 'green' or col == 'wind' or col == 2 or col == '2' then
		return Aero_col
	elseif col == 'fire' or col == 'red' or col == 'ruby' or col == 'crimson' or col == 0 or col == '0' then
		return Fire_col
	elseif col == 'blizzard' or col == 'lightblue' or col == 'snow' or col == 'ice' or col == 1 or col == '1' then
		return Blizzard_col
	elseif col == 'thunder' or col == 'purple' or col == 'lightning' or col == 4 or col == '4' then
		return Thunder_col
	elseif col == 'dark'  or col == 'darkness' or col == 7 or col == '7' then
		return Dark_col
	elseif col == 'light' or col == 'yellow' or col == 6 or col == '6' then
		return Light_col
	elseif col == 'grey' or col == 'gray' or col == 'inactive' or col == 'off' or col == 8 or col == '8' then
		return Inactive_col
	elseif col == 'white' or col == 9 or col == '9' then
		return White_col
	end
end

windower.register_event('addon command',function(column,label,value,color)
	local cmd = string.lower(column)

	if cmd == 'show' then
		image:show()
		return
	elseif cmd == 'hide' then
		image:hide()
		return
	elseif cmd == 'unpause' and pause == true then
		image:show()
		pause = false
		Initialize()
		return
	elseif cmd == 'init' then
		if windower.ffxi.get_info().logged_in == true then
			Initialize()
		else
			windower.send_command('wait 3;jd init')
		end
		return
	end
	
	if pause == true then
		windower.send_command('wait 7;jd unpause')
		return
	end
	
	if cmd == 'update' and pause == false then
		if stop == false then
			if job == 'WAR' then
				refresh_WAR()			
			elseif job == 'MNK' then
				refresh_MNK()			
			elseif job == 'WHM' then
				refresh_WHM()			
			elseif job == 'BLM' then
				refresh_BLM()		
			elseif job == 'RDM' then
				refresh_RDM()			
			elseif job == 'THF' then
				refresh_THF()			
			elseif job == 'PLD' then
				refresh_PLD()			
			elseif job == 'DRK' then
				refresh_DRK()			
			elseif job == 'BST' then
				refresh_BST()			
			elseif job == 'BRD' then
				refresh_BRD()			
			elseif job == 'RNG' then
				refresh_RNG()			
			elseif job == 'SAM' then
				refresh_SAM()			
			elseif job == 'NIN' then
				refresh_NIN()			
			elseif job == 'DRG' then
				refresh_DRG()			
			elseif job == 'SMN' then
				refresh_SMN()			
			elseif job == 'BLU' then
				refresh_BLU()			
			elseif job == 'COR' then
				refresh_COR()			
			elseif job == 'PUP' then
				refresh_PUP()			
			elseif job == 'DNC' then
				refresh_DNC()			
			elseif job == 'SCH' then
				refresh_SCH()			
			elseif job == 'GEO' then
				refresh_GEO()			
			elseif job == 'RUN' then
				refresh_RUN()
			end
			windower.send_command('wait 1;jd update')
			return
		end
		image:hide()
		return
	elseif cmd == 'ja' then
		--Ability_Display(5,66,87)
		Ability_Display(tonumber(parameter),tonumber(color),tonumber(buffs))
		return
	elseif cmd == 'ma' then
		Spell_Display(tonumber(parameter),tonumber(color))
		return
	elseif cmd == 'set' then
		Set_Display(tonumber(label),value,color)
	elseif cmd == 'print' then -- testing purposes
		--print(windower.ffxi.get_player().merits.sic_recast)
	elseif cmd == 'display' then
		if label == '0' then
			displaySet = 0
		elseif label == '1' then
			displaySet = 1
		else
			displaySet = 0
		end
	end
	
	if cmd == '1' or cmd == '2' or cmd == '3' or cmd == '4' or cmd == '5' or cmd == '6' or cmd == '7' or cmd == '8' or cmd == '9' or cmd == '10' then
		Finalize_Column(tonumber(column),label,value,Confirm_Color(color))
	end
end)

function BuffActive(buffnum)
	for k,v in pairs(windower.ffxi.get_player().buffs) do
		if v == buffnum then
			return true
		end
	end
	return false
end

function GetAbilities()
	for k,v in pairs(windower.ffxi.get_abilities().job_abilities) do
		--windower.add_to_chat(2, tostring(k)..' '..tostring(v)) --Lists abilities currently available
		abilities[k] = v
	end
end

windower.register_event('gain buff', function(new, old)
    if new == 157 or new == 269 or new == 143 then -- SJ/LvlSync/Lvl Restrictions
		pause = true
	end
end)

windower.register_event('lose buff', function(new, old)
    if new == 157 or new == 269 or new == 143 then -- SJ/LvlSync/Lvl Restrictions
		pause = true
	end
end)

windower.register_event('logout', function(new, old)
    image:hide()
	stop = true
end)

--[[windower.register_event('login', function(new, old)
    windower.send_command('wait 7;lua r jobdisplay')
end)--]]

windower.register_event('job change', function(new, old)
    --windower.send_command('lua r jobdisplay')
	pause = true
end)

windower.register_event('zone change', function(new, old)
    --windower.send_command('lua r jobdisplay')
	pause = true
end)

windower.register_event('load', function(new, old)
	if windower.ffxi.get_info().logged_in == true then
		Initialize()
	else
		windower.send_command('wait 3;jd init')
	end
end)

function Initialize()
	abilities = T{}
	GetAbilities()
	job = windower.ffxi.get_player().main_job
	sub = windower.ffxi.get_player().sub_job

	if job == 'WAR' then
		require('defaults/war')
		require('custom/war')
		displaySet = settings.custom_war
	elseif job == 'MNK' then
		require('defaults/mnk')
		require('custom/mnk')
		displaySet = settings.custom_mnk
	elseif job == 'WHM' then
		require('defaults/whm')
		require('custom/whm')
		displaySet = settings.custom_whm
	elseif job == 'BLM' then
		require('defaults/blm')
		require('custom/blm')
		displaySet = settings.custom_blm
	elseif job == 'RDM' then
		require('defaults/rdm')	
		require('custom/rdm')
		displaySet = settings.custom_rdm
	elseif job == 'THF' then
		require('defaults/thf')
		require('custom/thf')
		displaySet = settings.custom_thf
	elseif job == 'PLD' then
		require('defaults/pld')
		require('custom/pld')
		displaySet = settings.custom_pld
	elseif job == 'DRK' then
		require('defaults/drk')
		displaySet = settings.custom_drk
	elseif job == 'BST' then
		bst_jp = windower.ffxi.get_player().job_points.sch.jp_spent
		bst_merits = windower.ffxi.get_player().merits.sic_recast
		require('defaults/bst')
		require('custom/bst')
		displaySet = settings.custom_bst
	elseif job == 'BRD' then
		require('defaults/brd')	
		require('custom/brd')
		displaySet = settings.custom_brd
	elseif job == 'RNG' then
		require('defaults/rng')
		require('custom/rng')
		displaySet = settings.custom_rng
	elseif job == 'SAM' then
		require('defaults/sam')	
		require('custom/sam')
		displaySet = settings.custom_sam
	elseif job == 'NIN' then
		require('defaults/nin')		
		require('custom/nin')
		displaySet = settings.custom_nin
	elseif job == 'DRG' then
		require('defaults/drg')
		require('custom/drg')
		displaySet = settings.custom_drg
	elseif job == 'SMN' then
		require('defaults/smn')	
		require('custom/smn')
		displaySet = settings.custom_smn
		smn_skill = windower.ffxi.get_player().skills.summoning_magic
	elseif job == 'BLU' then
		require('defaults/blu')
		require('custom/blu')
		displaySet = settings.custom_blu
	elseif job == 'COR' then
		require('defaults/cor')
		require('custom/cor')
		displaySet = settings.custom_cor
	elseif job == 'PUP' then
		require('defaults/pup')
		require('custom/pup')
		displaySet = settings.custom_pup
	elseif job == 'DNC' then
		require('defaults/dnc')
		require('custom/dnc')
		displaySet = settings.custom_dnc
	elseif job == 'SCH' then
		sch_jp = windower.ffxi.get_player().job_points.sch.jp_spent
		require('defaults/sch')
		require('custom/sch')
		displaySet = settings.custom_sch
	elseif job == 'GEO' then
		require('defaults/geo')
		require('custom/geo')
		displaySet = settings.custom_geo
	elseif job == 'RUN' then
		require('defaults/run')
		require('custom/run')
		displaySet = settings.custom_run
	end
	
	--(windower.ffxi.get_mob_by_target('p1')
	--(windower.ffxi.get_player())

	--for k,v in pairs(windower.ffxi.get_key_items()) do
		--windower.add_to_chat(2, tostring(k)..' '..tostring(v))
	--end
	windower.send_command('wait 1;jd update')
	image:show()
end

windower.register_event('prerender', function(new,old)
	draw()
end)
