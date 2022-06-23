#!/usr/bin/env bash

# Here, other devtools are installed

# TODO: More thorough selection of PHP and Python tools (where is psalm?)
# Note: For Godot to work, open a project in the editor. Check for the command $nc localhost 6008 it should wait for input

packages=(
	"php"
	"php-fpm"
	"xdebug"
	"mariadb"
	"nginx"
	"composer"      # To install psalm
	"ruby"          # To install mdl
	"rubygems"      # To install mdl
	"shellcheck"    # Bash lint
	"clang"         # For C/C++ LSP and lint
	"tidy"          # HTML lint (https://www.html-tidy.org/)
	"libxml2"       # XML lint
)
npm_pkgs=(
	"bash-language-server"           # Bash LSP
	"vscode-css-languageserver-bin"  # CSS LSP
	"vscode-html-languageserver-bin" # HTML LSP
	"typescript"                     # JS LSP
	"typescript-language-server"     # JS LSP
	"remark-language-server"         # Markdown LSP
	"vim-language-server"            # Vim LSP
	"intelephense"                   # PHP LSP. Add your license in $HOME/intelephense/license.txt. See https://intelephense.com/faq.html
	"eslint"                         # JS lint
	"csslint"                        # CSS lint
	"jsonlint"                       # JSON lint
)
# TODO: Good practice: install it in a separate venv
pip_pkgs=(
	"flake8"                     # Python lint: pycodestyle, pyflakes, mccabe script
	"pylint"                     # Python lint: Run manually as it's a heavy process
	"mypy"                       # Python lint
	"pydocstyle"                 # Python lint
	"python-lsp-server"          # Python LSP. python-language-server is unmaintained. https://github.com/python-lsp/python-lsp-server for other tools
)
gem_pkgs=(
	"mdl"                             # Markdown lint
)
composer_pkgs=(
	"vimeo/psalm"
)

# Install pacman packages in bulk
sudo pacman -Syu ${packages[*]} --needed

# Install npm packages if needed
for package in "${npm_pkgs[@]}"; do
	echo "Installing $package"
	npm install -g "$package"
done
unset package

for package in "${pip_pkgs[@]}"; do
	echo "Installing $package"
	pip install "$package"
done
unset package

for package in "${gem_pkgs[@]}"; do
	echo "Installing $package"
	gem install "$package"
done
unset package

for package in "${composer_pkgs[@]}"; do
	echo "Installing $package"
	composer global require "$package" --with-all-dependencies
done
unset package
