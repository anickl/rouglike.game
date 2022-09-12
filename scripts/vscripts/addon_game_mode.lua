-- Generated from template

if CAddonTemplateGameMode == nil then
	CAddonTemplateGameMode = class({})
end

function Precache( context )
	--[[
		Precache things we know we'll use.  Possible file types include (but not limited to):
			PrecacheResource( "model", "*.vmdl", context )
			PrecacheResource( "soundfile", "*.vsndevts", context )
			PrecacheResource( "particle", "*.vpcf", context )
			PrecacheResource( "particle_folder", "particles/folder", context )
	]]
end

-- Create the game mode when we activate
function Activate()
	GameRules.AddonTemplate = CAddonTemplateGameMode()
	GameRules.AddonTemplate:InitGameMode()
	ListenToGameEvent("dota_player_pick_hero", OnHeroPicked, nil)
	ListenToGameEvent("dota_player_killed", OnPlayerDeath, nil)
end

function CAddonTemplateGameMode:InitGameMode()
	print( "Template addon is loaded." )
	GameRules:GetGameModeEntity():SetThink( "OnThink", self, "GlobalThink", 2 )
end

function OnPlayerDeath (event)
	--death
	local hero = EntIndexToHScript(event.PlayerID)
	local position = hero:GetAbsOrigin()
	local id = hero:GetPlayerID()

end
function OnHeroPicked (event)
	--startup
    local hero = EntIndexToHScript(event.heroindex)
	hero:HeroLevelUp(true)
	hero:HeroLevelUp(true)
	hero:HeroLevelUp(true)
	hero:HeroLevelUp(true)
	hero:HeroLevelUp(true)
	hero:HeroLevelUp(true)
	hero:HeroLevelUp(true)
	hero:SetGold(2600,false)
	hero:SetRespawnsDisabled(true)
	hero:SetBuyBackDisabledByReapersScythe(true)


end


-- Evaluate the state of the game
function CAddonTemplateGameMode:OnThink()
	if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
		--print( "Template addon script is running." )
	elseif GameRules:State_Get() >= DOTA_GAMERULES_STATE_POST_GAME then
		return nil
	end
	return 1
end