function get_monitor_by_full_description(full_description)
	local handle = io.popen("hyprctl monitors")
	local result = handle:read("*a")
	handle:close()

	local monitor_id
	for line in result:gmatch("[^\r\n]+") do
		monitor_id = line:match("^Monitor ([^%s]+) %(ID %d+%):") or monitor_id
		if monitor_id and line:find(full_description, 1, true) then
			return monitor_id
		end
	end

	return nil
end
