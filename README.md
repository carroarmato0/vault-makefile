# vault-makefile
Fetches Vault from Hasicorp and prepares an installation package

## Requirements
[fpm - Effing Package Management](https://github.com/jordansissel/fpm)

## Usage

Edit the makefile to the version you want to package

**make**       - fetches the zip file upstream, prepares directories and scripts, then uses FPM to generate a package

**make clean** - cleans all the generated file 
