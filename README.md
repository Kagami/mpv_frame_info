`frame_info.lua` is a simple Lua script for mpv to display frame info, similar to ffdshow's OSD.
Might be useful in case of e.g. screenshot comparisions.

![](https://raw.githubusercontent.com/Kagami/mpv_frame_info/assets/example.png)

#### Usage

Put `frame_info.lua` to `~/.config/mpv/scripts/` or `~/.mpv/scripts/` directory
to autoload the script or load it manually with `--script=<path>`.

The script is binding itself to `TAB` (however, not overriding your own bindings)
and can therefore be invoked with this key. You can create different
bindings by adding `<yourkey> script_binding frame_info` to `input.conf`.

Press `TAB` to toggle info displaying, press `Ctrl+s` to make the screenshot with info.

#### License

mpv_frame_info - Show frame info with mpv

Written in 2015-2017 by Kagami Hiiragi <kagami@genshiken.org>

To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide. This software is distributed without any warranty.

You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.
