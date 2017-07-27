--[[
    Benediction Lua Scripts
    Creature 197 - Marshal McBride
    Developed by Asura
--]]

function McBride_OnInitializeQuest(Unit, QuestId, Player)
    if QuestId == 54 then                                   -- QuestId must be 54, Report to Gold Shire
        Unit:SendScriptTextWithTarget(Player, 11, 1242)     -- SendScriptTextToPlayerById Structure: Target, ChatType, TextId
        Unit:SendEmoteToPlayer(Player, 66)                  -- McBride Salutes Player (Visually only to player)
        Player:SendEmote(66)                                -- Player Salutes
    else
    end
end

RegisterUnitEvent(197, 16, "McBride_OnInitializeQuest")