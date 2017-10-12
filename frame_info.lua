local assdraw = require "mp.assdraw"
local options = require "mp.options"

local info_active = false
local o = {
    font_size = 10,
    font_color = "00FFFF",
    border_size = 1.0,
    border_color = "000000",
}
options.read_options(o)

function get_formatting()
    return string.format(
        "{\\fs%d}{\\1c&H%s&}{\\bord%f}{\\3c&H%s&}",
        o.font_size, o.font_color,
        o.border_size, o.border_color
    )
end

function timestamp(duration)
    -- mpv may return nil before exiting.
    if not duration then return "" end
    local hours = duration / 3600
    local minutes = duration % 3600 / 60
    local seconds = duration % 60
    return string.format("%02d:%02d:%06.03f", hours, minutes, seconds)
end

function get_info()
    return string.format(
        "%sName: %s\\NTime: %s",
        get_formatting(),
        mp.get_property("filename"),
        timestamp(mp.get_property_native("time-pos"))
    )
end

function render_info()
    ass = assdraw.ass_new()
    ass:pos(0, 0)
    ass:append(get_info())
    mp.set_osd_ass(0, 0, ass.text)
end

function clear_info()
    mp.set_osd_ass(0, 0, "")
end

function toggle_info()
    if info_active then
        mp.unregister_event(render_info)
        clear_info()
    else
        -- TODO: Rewrite to timer + pause/unpause handlers.
        mp.register_event("tick", render_info)
        render_info()
    end
    info_active = not info_active
end

mp.add_key_binding("TAB", mp.get_script_name(), toggle_info)
