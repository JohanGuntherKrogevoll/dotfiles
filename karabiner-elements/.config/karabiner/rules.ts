import fs from "fs";
import { KarabinerRules, Manipulator } from "./types";
import {
  createSubLayers as createSubLayers,
  app,
  open,
  rectangle,
  shottr,
} from "./utils";

const rules: KarabinerRules[] = [
  {
    description: "Hyper Key (⌃⌥⇧⌘)",
    manipulators: [
      {
        description: "Caps Lock -> Hyper Key",
        from: {
          key_code: "caps_lock",
          modifiers: {
            optional: ["any"],
          },
        },
        to: [
          {
            set_variable: {
              name: "hyper",
              value: 1,
            },
          },
        ],
        to_after_key_up: [
          {
            set_variable: {
              name: "hyper",
              value: 0,
            },
          },
        ],
        to_if_alone: [
          {
            key_code: "escape",
          },
        ],
        type: "basic",
      },
    ],
  },
  ...createSubLayers("hyper", {
    //Shottr - p for picture
    p: {
      a: shottr("area", ["save", "edit"]),
      w: shottr("window", ["save", "edit"]),
      f: shottr("fullscreen", ["save", "edit"]),
      s: shottr("scrolling", ["save", "edit"]),
      o: shottr("scrolling/reverse", ["save", "edit"]),
      r: shottr("repeat", ["save", "edit"]),
    },
    // Browse
    b: {
      // Weather
      w: open(
        "https://www.yr.no/nb/v%C3%A6rvarsel/daglig-tabell/1-46892/Norge/Vestfold/T%C3%B8nsberg/Eik"
      ),
      g: open("https://github.com"),
      l: open("http://localhost:3000"),
    },
    // o = "Open" applications
    o: {
      // Api client
      a: app("Bruno"),
      // Browser
      b: app("Brave Browser"),
      c: app("Calendar"),
      d: app("Discord"),
      // tEams
      e: app("Microsoft Teams"),
      f: app("Finder"),
      k: app("Keymapp"),
      m: app("Mail"),
      // Notes
      n: app("Obsidian"),
      // sPotify
      p: app("Spotify"),
      s: app("Slack"),
      // Terminal
      t: app("Ghostty"),
      v: app("Visual Studio Code"),
      // bitWarden
      w: app("Bitwarden"),
    },

    // w = "Window" via rectangle.app
    w: {
      y: rectangle("previous-display"),
      o: rectangle("next-display"),
      k: rectangle("top-half"),
      j: rectangle("bottom-half"),
      h: rectangle("left-half"),
      l: rectangle("right-half"),
      f: rectangle("maximize"),
      u: {
        description: "Window: Previous Tab",
        to: [
          {
            key_code: "tab",
            modifiers: ["right_control", "right_shift"],
          },
        ],
      },
      i: {
        description: "Window: Next Tab",
        to: [
          {
            key_code: "tab",
            modifiers: ["right_control"],
          },
        ],
      },
      n: {
        description: "Window: Next Window",
        to: [
          {
            key_code: "grave_accent_and_tilde",
            modifiers: ["right_command"],
          },
        ],
      },
      b: {
        description: "Window: Back",
        to: [
          {
            key_code: "open_bracket",
            modifiers: ["right_command"],
          },
        ],
      },
      // Note: No literal connection. Both f and n are already taken.
      m: {
        description: "Window: Forward",
        to: [
          {
            key_code: "close_bracket",
            modifiers: ["right_command"],
          },
        ],
      },
      d: {
        description: "Window: Next display",
        to: [
          {
            key_code: "right_arrow",
            modifiers: ["right_control", "right_option", "right_command"],
          },
        ],
      },
    },

    // s = "System"
    s: {
      c: {
        to: [
          {
            key_code: "caps_lock",
          },
        ],
      },
      u: {
        to: [
          {
            key_code: "volume_increment",
          },
        ],
      },
      j: {
        to: [
          {
            key_code: "volume_decrement",
          },
        ],
      },
      i: {
        to: [
          {
            key_code: "display_brightness_increment",
          },
        ],
      },
      k: {
        to: [
          {
            key_code: "display_brightness_decrement",
          },
        ],
      },
      l: {
        to: [
          {
            key_code: "q",
            modifiers: ["right_control", "right_command"],
          },
        ],
      },
      p: {
        to: [
          {
            key_code: "play_or_pause",
          },
        ],
      },
      f: {
        to: [
          {
            key_code: "fastforward",
          },
        ],
      },
    },

    // c = Musi*c* which isn't "m" because we want it to be on the left hand
    c: {
      o: app("Spotify"),
      k: {
        to: [
          {
            key_code: "volume_increment",
          },
        ],
      },
      j: {
        to: [
          {
            key_code: "volume_decrement",
          },
        ],
      },
      m: {
        to: [
          {
            key_code: "mute",
          },
        ],
      },
      p: {
        to: [{ key_code: "play_or_pause" }],
      },
      l: {
        to: [{ key_code: "fastforward" }],
      },
      h: {
        to: [{ key_code: "rewind" }],
      },
    },

    // f = "Finder"
    f: {
      a: open("/Applications"),
      d: open("~/Downloads"),
      r: open("~"),
    },

    // r = "Raycast"
    r: {
      b: open("raycast://extensions/jomifepe/bitwarden/search"),
      e: open(
        "raycast://extensions/raycast/emoji-symbols/search-emoji-symbols"
      ),
      p: open("raycast://extensions/raycast/raycast/confetti"),
      h: open(
        "raycast://extensions/raycast/clipboard-history/clipboard-history"
      ),
      m: open("raycast://extensions/raycast/navigation/search-menu-items"),
      s: open("raycast://extensions/raycast/screenshots/search-screenshots"),
      t: open("raycast://extensions/gebeto/translate/quick-translate"),
      w: open("raycast://extensions/raycast/github/workflow-runs"),
    },
  }),
];

const simpleModifications: Omit<Manipulator, "type">[] = [
  {
    from: { key_code: "non_us_backslash" },
    to: [{ key_code: "grave_accent_and_tilde" }],
  },
  {
    from: { key_code: "grave_accent_and_tilde" },
    to: [{ key_code: "non_us_backslash" }],
  },
];

fs.writeFileSync(
  "karabiner.json",
  JSON.stringify(
    {
      global: {
        show_in_menu_bar: false,
      },
      profiles: [
        {
          name: "Default",
          virtual_hid_keyboard: { keyboard_type_v2: "iso" },
          complex_modifications: {
            rules,
          },
          simple_modifications: simpleModifications,
        },
      ],
    },
    null,
    2
  )
);
