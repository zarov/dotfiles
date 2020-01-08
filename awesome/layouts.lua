local awful = require("awful")

awful.screen.connect_for_each_screen(function(s)
   local conf = {
      layout = awful.layout.suit.tile,
      gap_single_client = true,
      gap = 5,
      screen = s,
   }

   awful.tag.add("六", conf)
   awful.tag.add("五", conf)
   awful.tag.add("四", conf)
   awful.tag.add("三", conf)
   awful.tag.add("二", conf)
   awful.tag.add("一", conf)
end)
