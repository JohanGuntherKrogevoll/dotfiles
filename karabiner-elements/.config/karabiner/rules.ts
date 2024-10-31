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
  {
    description: "Meh Key (⌃⌥⇧)",
    manipulators: [
      {
        description: "ø -> Meh Key",
        from: {
          key_code: "semicolon",
          modifiers: {
            optional: ["any"],
          },
        },
        to: [
          {
            set_variable: {
              value: 1,
              name: "meh",
            },
          },
        ],
        to_after_key_up: [
          {
            set_variable: {
              name: "meh",
              value: 0,
            },
          },
        ],
        to_if_alone: [
          {
            key_code: "semicolon",
          },
        ],
        type: "basic",
      },
    ],
  },
  ...createSubLayers("meh", {
    h: {
      to: [{ key_code: "left_arrow" }],
    },
    j: {
      to: [{ key_code: "down_arrow" }],
    },
    k: {
      to: [{ key_code: "up_arrow" }],
    },
    l: {
      to: [{ key_code: "right_arrow" }],
    },
    w: {
      to: [{ key_code: "right_arrow", modifiers: ["left_option"] }],
    },
    e: {
      to: [{ key_code: "right_arrow", modifiers: ["left_option"] }],
    },
    b: {
      to: [{ key_code: "left_arrow", modifiers: ["left_option"] }],
    },
    g: {
      to: [{ key_code: "up_arrow", modifiers: ["left_command"] }],
    },
    v: {
      to: [{ key_code: "down_arrow", modifiers: ["left_command"] }],
    },
    4: {
      to: [{ key_code: "right_arrow", modifiers: ["left_command"] }],
    },
    0: {
      to: [{ key_code: "left_arrow", modifiers: ["left_command"] }],
    },
    u: {
      to: [{ key_code: "page_down" }],
    },
    i: {
      to: [{ key_code: "page_up" }],
    },
    spacebar: {
      a: shottr("area", ["save", "edit"]),
      w: shottr("window", ["save", "edit"]),
      f: shottr("fullscreen", ["save", "edit"]),
      s: shottr("scrolling", ["save", "edit"]),
      r: shottr("repeat", ["save", "edit"]),
    },
  }),
  ...createSubLayers("hyper", {
    spacebar: app("Screenshot"),
    // b = "B"rowse
    b: {
      w: open(
        "https://www.yr.no/nb/v%C3%A6rvarsel/daglig-tabell/1-46892/Norge/Vestfold/T%C3%B8nsberg/Eik"
      ),
      g: open("https://github.com"),
    },
    // o = "Open" applications
    o: {
      a: app("Arc"),
      b: app("Bitwarden"),
      c: app("Calendar"),
      d: app("Discord"),
      f: app("Finder"),
      i: app("Insomnia"),
      n: app("Obsidian"),
      m: app("Mail"),
      s: app("Slack"),
      p: app("Spotify"),
      v: app("Visual Studio Code"),
      t: app("Kitty"),
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
      p: {
        to: [{ key_code: "play_or_pause" }],
      },
      n: {
        to: [{ key_code: "fastforward" }],
      },
      b: {
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
