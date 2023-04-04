from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal


mod = "mod1"
terminal = guess_terminal()
browser = "librewolf"
margin_size = 6

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "b", lazy.spawn(browser), desc="Launch browser"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key(["mod4"], "space", lazy.spawn("rofi -show drun"), desc="Spawn rofi in drun mode"),
    Key([mod], "space", lazy.widget["keyboardlayout"].next_keyboard(), desc="Next keyboard layout."),

    # Sound
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer sset Master 4000+ unmute"), desc="Raise volume"),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer sset Master 4000- unmute"), desc="Lower volume"),
    Key([], "XF86AudioMute", lazy.spawn("amixer sset Master toggle"), desc="Mute volume"),

    # Brightness
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl s 10%+"), desc="Raise volume"),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl s 10%-"), desc="Lower volume"),
]

groups = [Group(i) for i in ["\ue795", "\ueb01", "\ueb1c", "\ue632", "\ueb44"]]

for idx, group in enumerate(groups, start=1):
    keys.extend(
        [
            Key(
                [mod],
                str(idx),
                lazy.group[group.name].toscreen(),
                desc="Switch to group {}".format(group.name),
            ),
            Key(
                [mod, "shift"],
                str(idx),
                lazy.window.togroup(group.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(group.name),
            ),
        ]
    )

layouts = [
    layout.Tile(
        border_focus="#61afef",
        border_width=2,
        margin=margin_size,
    ),
    layout.MonadTall(
        border_focus="#61afef",
        border_width=2,
        margin=margin_size,
    ),
    # layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font="Fira Code",
    fontsize=28,
    padding=16,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    highlight_method="block",
                    active="#61afef",
                    block_highlight_text_color="#282c34",
                    foreground="#282c34",
                    fontsize=48,
                    this_current_screen_border="#61afef",
                    urgent_alert_method="text",
                    urgent_text="#e06c75",
                ),
                widget.Notify(
                    max_chars=120,
                ),
                widget.Prompt(),
                widget.WindowName(),
                widget.TextBox(
                    markup=True,
                    fmt="<span size='38pt'>\uf028</span>",
                ),
                widget.Volume(),
                widget.TextBox(
                    markup=True,
                    fmt="<span size='24pt'>\uea61</span>",
                ),
                widget.Backlight(
                    backlight_name="amdgpu_bl0",
                ),
                widget.TextBox(
                    markup=True,
                    fmt="<span size='44pt'>\uf240</span>",
                ),
                widget.Battery(),
                widget.KeyboardLayout(
                    configured_keyboards=['us', 'ru'],
                    background="#61afef",
                    foreground="#282c34",
                    markup=True,
                    fmt="<b>{}</b>",
                ),
                widget.Clock(
                    background="#98c379",
                    foreground="#282c34",
                    markup=True,
                    format="<b>%d-%m-%Y %a %I:%M %p</b>",
                ),
            ],
            48,
            background = "#282c34",
            margin = margin_size,
        ),
        wallpaper="~/.config/qtile/wp.png",
        wallpaper_mode="stretch",
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
