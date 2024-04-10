# Atlas Auto Update Whitelisted IPs

This tool provides a shell script that you can use to automatically update whitelisted IPs in Atlas.

## Pre-Requisites

### Install the Atlas CLI tool

`brew install mongodb-atlas`

### Login to Atlas
`atlas auth login`

## Usage

The shell script takes two inputs:

`./update_ip.sh <path/to/textfile.txt> <project_id>`

With `<path/to/textfile.txt>` being the text file that contains a list of IPs you want to add
and `<project_id>` being the project id you want to add to in Atlas.

The name of the text file will be added as a comment in the whitelisted entry in Atlas.
