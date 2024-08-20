local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

local banners = {
    {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
    },

    {
    " ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ ",
    " ░    ░░░░░   ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ ",
    " ▒  ▒   ▒▒▒   ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒ ",
    " ▒   ▒   ▒▒   ▒▒▒▒   ▒▒▒▒▒▒▒▒   ▒▒▒▒▒   ▒▒▒▒▒   ▒▒▒▒▒    ▒   ▒   ▒ ",
    " ▓   ▓▓   ▓   ▓▓  ▓▓▓   ▓▓▓   ▓▓   ▓▓▓   ▓▓▓   ▓▓   ▓▓   ▓▓  ▓▓    ",
    " ▓   ▓▓▓  ▓   ▓         ▓▓   ▓▓▓▓   ▓▓▓   ▓   ▓▓▓   ▓▓   ▓▓  ▓▓    ",
    " ▓   ▓▓▓▓  ▓  ▓  ▓▓▓▓▓▓▓▓▓▓   ▓▓   ▓▓▓▓▓     ▓▓▓▓   ▓▓   ▓▓  ▓▓    ",
    " █   ██████   ███     ███████   █████████   █████   █    ██  ██    ",
    " █████████████████████████████████████████████████████████████████ ",
    },

    {
    "  ███▄    █  ▓█████ ▒█████   ██▒   █▓  ██▓ ███▄ ▄███▓ ",
    "  ██ ▀█   █  ▓█   ▀▒██▒  ██▒▓██░   █▒▒▓██▒▓██▒▀█▀ ██▒ ",
    " ▓██  ▀█ ██▒ ▒███  ▒██░  ██▒ ▓██  █▒░▒▒██▒▓██    ▓██░ ",
    " ▓██▒  ▐▌██▒ ▒▓█  ▄▒██   ██░  ▒██ █░░░░██░▒██    ▒██  ",
    " ▒██░   ▓██░▒░▒████░ ████▓▒░   ▒▀█░  ░░██░▒██▒   ░██▒ ",
    " ░ ▒░   ▒ ▒ ░░░ ▒░ ░ ▒░▒░▒░    ░ ▐░   ░▓  ░ ▒░   ░  ░ ",
    " ░ ░░   ░ ▒░░ ░ ░    ░ ▒ ▒░    ░ ░░  ░ ▒ ░░  ░      ░ ",
    "    ░   ░ ░     ░  ░ ░ ░ ▒        ░  ░ ▒ ░░      ░    ",
    "          ░ ░   ░      ░ ░        ░    ░         ░    ",
    },

    {
    "                                           ▄▄                    ",
    " ▀███▄   ▀███▀                             ██                    ",
    "   ███▄    █                                                     ",
    "   █ ███   █   ▄▄█▀██  ▄██▀██▄▀██▀   ▀██▀▀███ ▀████████▄█████▄   ",
    "   █  ▀██▄ █  ▄█▀   ████▀   ▀██ ██   ▄█    ██   ██    ██    ██   ",
    "   █   ▀██▄█  ██▀▀▀▀▀▀██     ██  ██ ▄█     ██   ██    ██    ██   ",
    "   █     ███  ██▄    ▄██▄   ▄██   ███      ██   ██    ██    ██   ",
    " ▄███▄    ██   ▀█████▀ ▀█████▀     █     ▄████▄████  ████  ████▄ ",
    },

    {
    "         ⠀⠀⠀⠀⠀⠀⠀⠀⠀                                    ⢀⣠⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠳⡦⠤⣘⣗⠲⠤⠽⠉⠒⠋⠒⠢⠞⠚⠉⠁⠑⠢⠔⠋⠑⠊⠦⡠⠞⠣⠦⢦⡠⠔⠉⠸⠤⠺⠶⣃⡠⣄⠤⠒⢉⠎⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
    " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣸⠀⠀⠀   █▄ █ ██▀ ▄▀▄ █ █ █ █▄ ▄█⠀⠀█ █    ⠸⢤⠖⠃⠀⠀⠀⠀⠀⠀⠀⠀ ",
    " ⠀⠀⠀⠀⠀⠀⣀⣤⣴⣶⣿⣿⣿⠟⠀⠀⠀⠀⠀ █ ▀█ █▄▄ ▀▄▀ ▀▄▀ █ █ ▀ █  ▄ ▄    ⡔⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
    " ⠀⢀⣠⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣵⣶⣆⡀⠀⠀⣀⣀⣀⣀⡀⠀⠀⠀⣀⢀⢤⡀⠀⠀⠀⢀⡀⠀⣀⡀⢀⣀⠀⢀⣀⣄⡤⠤⣀⠀⠀⠀⡄⠠⠼⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
    " ⠀⠉⠙⠛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣾⣿⣿⣿⣦⡀⠈⠳⠊⠉⠉⠁⠀⢹⣠⠖⠉⠁⠈⠉⠁⠈⠋⠀⠉⠚⠀⠁⠀⠀⠀⠉⠒⠤⣳⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
    " ⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⠿⠛⠉⠉⠉⠻⣿⣿⣿⣿⣿⣿⣿⣦⡀⣠⠔⠊⡇⠀⠈⠀⠀⠀⠀⠀⠀⠀⢠⣼⣻⣦⡤⣄⣀⠀⠀⢀⣀⣀⣀⣈⠃⠀⠀⠀⠀⠀⠀⠀⠀⣀⡄⠀⠀ ",
    " ⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⠆⠀⠀⠀⢀⣀⡀⠙⢿⣿⡿⢿⣿⠟⢋⡠⠤⠒⠓⠂⠐⡄⠀⠀⠀⠀⠀⠀⢞⠵⣿⣿⣄⣼⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣶⡭⠭⢹⣿⣷⡽⡀⠀ ",
    " ⠀⠀⠀⠀⠀⢸⣿⣿⡿⢿⡟⠀⠀⠀⠈⣉⡩⣭⣴⣯⣮⣦⣗⣒⣣⣄⣐⡒⠪⠭⡝⠀⠀⠀⠀⠀⠀⠠⡚⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣿⣿⣳⡃⠀ ",
    " ⠀⠀⠀⠀⠀⢸⣿⣿⣇⢀⣀⣤⣴⣶⣿⡿⣻⡭⡽⢿⡷⡽⢻⣽⡋⢩⡟⠛⣿⣿⣾⣦⣤⣀⠀⠀⠀⢀⠾⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢟⣛⣻⣿⣯⡽⠇⠀ ",
    " ⠀⠀⠀⠀⢀⣸⣿⣿⣿⣿⡿⣫⣯⣤⠞⡿⣿⢀⢉⠭⢤⠉⢹⠙⡓⢺⠉⠢⣏⣿⠛⣿⣿⣿⣷⡄⠀⣾⣿⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣷⣿⣿⣿⣿⣿⣿⣿⠀⠀ ",
    " ⠀⢀⣤⣾⣿⣿⣛⠉⣹⣏⣠⢑⣾⣤⢍⣠⢣⣃⠎⡇⣇⣀⡼⢣⣣⣠⡇⠼⡆⢻⢷⣡⡿⠟⠋⠁⢸⣿⣿⣿⣿⡿⣿⢟⣿⣿⣳⠙⣿⡿⣟⣿⡿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠆ ",
    " ⠰⣿⣿⣿⡿⢵⡸⣌⣹⢋⢼⠇⣂⠏⡹⠻⣬⠋⡜⡇⡆⡽⢡⡞⡎⡽⢦⠀⢸⠀⡏⢾⣧⣀⡀⠀⢸⡿⢻⣿⣟⡞⡽⢛⡇⠙⠃⠀⠈⠋⡿⠛⢻⢹⢾⣿⣿⣿⣿⣿⣟⣿⣿⡏⠀ ",
    " ⠀⠀⠀⠹⣼⣯⡷⠚⠘⡍⢸⢸⢙⢼⡹⢫⠏⢿⠀⣿⡞⡠⠊⢹⠟⡷⡖⣧⠘⣼⠁⠘⡆⠀⠁⠀⠀⠁⠘⡟⡷⠿⠋⠉⠁⠀⠀⠀⠀⠀⠉⠙⠛⠻⠎⡟⣿⠫⣿⣿⣿⣿⣿⡇⠀ ",
    " ⠀⠀⠀⠀⠀⢇⣧⠀⠀⢹⡸⣼⠞⣼⠾⠮⠈⠉⠀⠁⠋⠀⠀⠈⢒⢷⡥⣇⣷⡏⢆⢰⠃⠀⠀⠀⠀⠀⢀⣧⡇⠀⠀⠀⠀⢦⡤⠀⠒⡆⠀⠀⠀⠀⠀⣇⣿⢠⣿⣿⣿⣿⣿⡇⠀ ",
    " ⠀⠀⠀⠀⣀⣼⡝⠀⠀⡞⡇⠋⢰⠃⠀⠀⠀⠀⠰⡤⠤⠤⣴⠀⠀⠀⠀⣿⣟⣇⠈⡎⠀⠀⠀⠀⠀⠀⠘⣿⣷⡀⠀⠀⠀⠀⠑⠤⠼⠁⠀⠀⠀⠀⠺⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀ ",
    " ⠀⢀⡔⢋⡴⠋⠀⢀⠜⣼⠀⠀⠸⡣⣀⠀⠀⠀⠀⠈⠢⠴⠃⠀⠀⢀⢾⠿⣌⠯⣗⢄⠀⠀⠀⠀⠀⠀⠀⣿⡟⡿⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡠⢊⣿⣿⣿⡟⡟⡏⣿⠘⠀⠀ ",
    " ⠀⠘⢠⡷⠁⢀⠔⠁⡰⡏⡖⡄⠀⠙⢮⣷⠲⡤⣀⣀⣀⣀⣀⡤⢺⢳⠺⡴⠛⡆⠈⡿⡆⠀⠀⠀⠀⠀⠀⡿⠁⠇⡿⠛⠉⠒⠒⠒⠒⠒⠒⠊⠁⠀⢸⠏⠈⠟⠐⠁⠃⠃⠀⠀⠀ ",
    },
}

local quotes = {
	["Mogu Mogu"] = {
		"chile is so fucking long like wtf",
        "when was the last time you looked at an image of a kangaroo?",
	},

    ["spamtung"] = {
        "Shitting is a necessity",
        "Stop using words",
        "why does zun like trombone so much tho",
        "I GOTTA FINISH POOPSHITTING",
    },

    ["Richard Stallman"] = {
        "Gaanuu plus Linox",
        "What you're referring to as Linux, is in fact, GNU/Linux, or so I've recently taken to calling it, GNU + Linux",
    },

    ["Jordinne"] = {
        "prions are so fucked up man what the hell",
        "Such is the end, bereft of heroics and great deeds, free of pretensions and great meaning",
    },

    ["Gumperto"] = {
        "This is what the Hero Himmel would have wanted",
        "Skibidi Toilet 72 part 1 was an inside job",
        "VSCodo?! How lame! Only kids code on VSCodo!!!",
        "It's me. I'm the guy who really likes to talk about Touhou",
        "Bloomers? Like the Touhou thing?",
        "What's the deal with airplane food?",
    },

    ["Vim"] = {
        "Also try Emacs!",
    },

    ["Emacs"] = {
        "Also try Vim!",
    },
}

math.randomseed(os.time())

local function wrapText(text, maxLength)
	local wrappedLines = {}
	local currentLine = ""

	for word in text:gmatch("%S+") do
		if #currentLine + #word + 1 > maxLength then
			table.insert(wrappedLines, currentLine)
			currentLine = word
		else
			currentLine = currentLine ~= "" and currentLine .. " " .. word or word
		end
	end

	if currentLine ~= "" then
		table.insert(wrappedLines, currentLine)
	end

	return wrappedLines
end

local function getRandomQuote(quotesDict, maxLength)
	local authors = {}
	for author, _ in pairs(quotesDict) do
		table.insert(authors, author)
	end

	local randomAuthor = authors[math.random(#authors)]
	local randomQuote = quotesDict[randomAuthor][math.random(#quotesDict[randomAuthor])]
	local wrappedQuoteLines = wrapText(randomQuote, maxLength)
	table.insert(wrappedQuoteLines, 1, "")

	table.insert(wrappedQuoteLines, "— " .. randomAuthor)

	return wrappedQuoteLines
end


-- Set header
dashboard.section.header.val = banners[math.random(#banners)]

--Set footer
dashboard.section.footer.val = getRandomQuote(quotes, 80)

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "f", "󰍉  > Find file", ":cd $HOME/ | Telescope find_files<CR>"),
    dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "s", "  > Settings" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
    dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
}

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
