local function get_lazy_path()
  local os_name = vim.loop.os_uname().sysname
  local user = vim.loop.os_getenv("USER")

  local path = ""

  if os_name == "Linux" then
    path = '/home/' .. user .. '/.local/share/nvim/lazy'
  elseif os_name == "Windows_NT" then
    user = vim.loop.os_getenv("USERNAME")  -- Para Windows
    path = 'C:\\Users\\' .. user .. '\\AppData\\Local\\nvim-data\\lazy'
  else
    print("Sistema operativo no soportado")
  end

  return path
end

local plugins_count = vim.fn.len(vim.fn.globpath(get_lazy_path(), '*', 0, 1))
local ct  = os.date("%a %d %b")
local current_time = "󰸗 Today is " .. ct

local headers = {
	{
	header = {
	"           hmh+                          oNm.   oNdhh               ",
	"          `Nmhd`                        /NNmd  /NNhhd               ",
	"          -NNhhy                      `hMNmmm`+NNdhhh               ",
	"          .NNmhhs              ```....`..-:/./mNdhhh+               ",
	"           mNNdhhh-     `.-::///+++////++//:--.`-/sd`               ",
	"           oNNNdhhdo..://++//++++++/+++//++///++/-.`                ",
	"      y.   `mNNNmhhhdy+/++++//+/////++//+++///++////-` `/oos:       ",
	" .    Nmy:  :NNNNmhhhhdy+/++/+++///:.....--:////+++///:.`:s+        ",
	" h-   dNmNmy oNNNNNdhhhhy:/+/+++/-         ---:/+++//++//.`         ",
	" hd+` -NNNy`./dNNNNNhhhh+-://///    -+oo:`  ::-:+////++///:`        ",
	" /Nmhs+oss-:++/dNNNmhho:--::///    /mmmmmo  ../-///++///////.       ",
	"  oNNdhhhhhhhs//osso/:---:::///    /yyyyso  ..o+-//////////:/.      ",
	"   /mNNNmdhhhh/://+///::://////     -:::- ..+sy+:////////::/:/.     ",
	"     /hNNNdhhs--:/+++////++/////.      ..-/yhhs-/////////::/::/`    ",
	"       .ooo+/-::::/+///////++++//-/ossyyhhhhs/:///////:::/::::/:    ",
	"       -///:::::::////++///+++/////:/+ooo+/::///////.::://::---+`   ",
	"       /////+//++++/////+////-..//////////::-:::--`.:///:---:::/:   ",
	"       //+++//++++++////+++///::--                 .::::-------::   ",
	"       :/++++///////////++++//////.                -:/:----::../-   ",
	"       -/++++//++///+//////////////               .::::---:::-.+`   ",
	"       `////////////////////////////:.            --::-----...-/    ",
	"        -///://////////////////////::::-..      :-:-:-..-::.`.+`    ",
	"         :/://///:///::://::://::::::/:::::::-:---::-.-....``/- -   ",
	"           ::::://::://::::::::::::::----------..-:....`.../- -+oo/ ",
	"            -/:::-:::::---://:-::-::::----::---.-.......`-/.      ``",
	"           s-`::--:::------:////----:---.-:::...-.....`./:          ",
	"          yMNy.`::-.--::..-dmmhhhs-..-.-.......`.....-/:`           ",
	"         oMNNNh. `-::--...:NNNdhhh/.--.`..``.......:/-              ",
	"        :dy+:`      .-::-..NNNhhd+``..`...````.-::-`                ",
	"                        .-:mNdhh:.......--::::-`                    ",
	"                           yNh/..------..`                          ",
	"                                                                     ",
	" --- "..current_time.." --- and --- There is "..plugins_count .." plugins ---"},
	color = "#387ff2"
	},
	{
	header = {
	'  ███╗   ██╗██╗   ██╗██╗  ██╗    ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
	'  ████╗  ██║╚██╗ ██╔╝╚██╗██╔╝    ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
	'  ██╔██╗ ██║ ╚████╔╝  ╚███╔╝     ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
	'  ██║╚██╗██║  ╚██╔╝   ██╔██╗     ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
	'  ██║ ╚████║   ██║   ██╔╝ ██╗    ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
	'  ╚═╝  ╚═══╝   ╚═╝   ╚═╝  ╚═╝    ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
	'                                                                                   ',
	'',      
	" --- "..current_time.." --- and --- There is "..plugins_count .." plugins ---"},
	color = "#387ff2"
	},
	{
		header = {
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                     ]],
			[[       ████ ██████           █████      ██                     ]],
			[[      ███████████             █████                             ]],
			[[      █████████ ███████████████████ ███   ███████████   ]],
			[[     █████████  ███    █████████████ █████ ██████████████   ]],
			[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
			[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
			[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			"--- "..current_time.." --- and --- There is "..plugins_count .." plugins ---",
		},
		color = "#F4DEB3"
	},
}

math.randomseed(os.time())
local random_index = math.random(#headers)
local selected_header = headers[random_index]

vim.api.nvim_set_hl(0, 'NvimDashColor', { fg = selected_header.color })

return selected_header.header