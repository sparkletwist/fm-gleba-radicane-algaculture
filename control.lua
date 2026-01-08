local function on_built_entity(event)
	local player = game.get_player(event.player_index)
	if player and player.surface and player.surface.name == "fulgora" then
		player.unlock_achievement("radicane-on-fulgora")
	end
end

script.on_event(defines.events.on_built_entity, on_built_entity, {{filter="name", name="radicane-plant"}})
