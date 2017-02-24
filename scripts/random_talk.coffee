# Description:
#  dadbot talks to you
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Author:
#   eric@softwareforgood

starlas = [
  "https://scontent-ord1-1.xx.fbcdn.net/v/t31.0-8/15419780_10158057581070195_6065339990228819124_o.jpg?oh=5e6f5bca218525621e41e4ef773b6d68&oe=593F1067",
  "https://scontent-ord1-1.xx.fbcdn.net/v/t1.0-9/14925680_10157857219410195_4099991026432095079_n.jpg?oh=5e42fa65a51fb10734eb19c008f5d437&oe=5927C64F",
  "https://scontent-ord1-1.xx.fbcdn.net/v/t1.0-9/14980559_10157857219380195_1606115945198555028_n.jpg?oh=327566a2f84fcb3101b53419ea8eb395&oe=59409781",
  "https://scontent-ord1-1.xx.fbcdn.net/v/t1.0-9/13528725_10157189232085195_1339645777704173053_n.jpg?oh=47d07f970e385f46c98ec093370b0b98&oe=593CC47C",
  "https://scontent-ord1-1.xx.fbcdn.net/v/t1.0-9/12931240_10156863294610195_1973939137172674490_n.jpg?oh=bac4f193bf0e69a76c0404d450c7e864&oe=59402586",
  "https://scontent-ord1-1.xx.fbcdn.net/v/t1.0-9/10150576_10155788419225195_3454158835803898774_n.jpg?oh=360e1a886fa263a9d978a8c76183a1c1&oe=5938821B",
  "https://scontent-ord1-1.xx.fbcdn.net/v/t31.0-8/11406294_10155747345865195_3672216773888783741_o.jpg?oh=368dc22ef04fc8ded5f4bee3ee931fd6&oe=5925410A",
  "https://scontent-ord1-1.xx.fbcdn.net/v/t31.0-8/11262483_10155657003430195_2691627432750167247_o.jpg?oh=390ab6ff56f12e248d69b3a2af0d012b&oe=5932C34C",
  "https://scontent-ord1-1.xx.fbcdn.net/v/t31.0-8/11336959_10155657003425195_7861885990770970185_o.jpg?oh=dcaf079c9c2f2951f407c01425ad4da3&oe=592D9E3C",
  "https://scontent-ord1-1.xx.fbcdn.net/v/t31.0-8/11077955_10155489394890195_7933015427478167771_o.jpg?oh=35bcb82af425437d990a3cf62d2bdfa3&oe=5941B0CA",
  "https://scontent-ord1-1.xx.fbcdn.net/v/t31.0-8/10991571_10155376063720195_216356754118166247_o.jpg?oh=2394850ee74d6327c79eb6b3b38c2ee4&oe=59739DE1",
  "https://scontent-ord1-1.xx.fbcdn.net/v/t31.0-8/11025896_10155315544790195_4952674664396109076_o.jpg?oh=f543149fc5609021a48ca9670c5b0f45&oe=593FD3D1",
  "https://scontent-ord1-1.xx.fbcdn.net/v/t31.0-8/10974286_10155223782735195_9113541346148859211_o.jpg?oh=4d6740a993a5a027a13e6fd820acf172&oe=5928C5F9",
  "https://scontent-ord1-1.xx.fbcdn.net/v/t31.0-8/10339479_10155223782505195_419323416771157575_o.jpg?oh=8afeddf930629092495fb2475cbfe6e0&oe=593CDF65",
  "https://scontent-ord1-1.xx.fbcdn.net/v/t31.0-8/10847685_10155223782465195_6005492679068069566_o.jpg?oh=7c02d036ccef04504de9a7ff6ebae479&oe=59275739",
  "https://scontent-ord1-1.xx.fbcdn.net/v/t31.0-8/11020774_10155303037375195_4576822298742502923_o.jpg?oh=8ba7ac8ac4786c8b83b099b7b5c86649&oe=593D5026"
]
ways_to_say_good_morning = [
  "Rise and shine!",
  "Good Morning",
  "Guten Morgen",
  "Buenos Dias",
  "http://media3.giphy.com/media/frc5xfWMX0Vig/giphy.gif",
  "http://media.giphy.com/media/gBxL0G0DqZd84/giphy.gif",
  "http://media.giphy.com/media/XiMbUa46o1VXq/giphy.gif"
]

ways_to_say_good_night = [
  "Good night!",
  "Have a good evening",
  "Kali Nichta",
  "Nighty night!",
  "Buenos Noches",
  "Felices Sueños"
]

module.exports = (robot) ->
  robot.hear /good morning/i, (msg) ->
    msg.send msg.random ways_to_say_good_morning

  robot.hear /good night/i, (msg) ->
    msg.send msg.random ways_to_say_good_night

  robot.respond /starla bomb/i, (msg) ->
    msg.send msg.random starlas
    if Math.floor(Math.random() * 6) + 1 < 3
      msg.send msg.random starlas
    if Math.floor(Math.random() * 6) + 1 < 3
      msg.send msg.random starlas
    if Math.floor(Math.random() * 6) + 1 < 3
      msg.send msg.random starlas
