# dotfiles

## About

My dotfiles! Used and tested on Archlinux and MacOS.


## History and Status

I have kept my dotfiles in a private git repository since around 2011. This is
a newly refactored repository, that aims to make using them across different
machines easy.

Two things prompted me to refactor them. First, the built-in package system
used by NeoVim and Vim 8 means that I can (mostly) retire Pathogen, which I've
made good use of for a number of years. Second, I really need to make sure that
my dotfiles can be easily pulled into different environments, with the right
subset of files used. After having used Dotbot for a while, I recently realised
that with a bit of tweaking, it supports multiple profiles built around modular
configuration files.

These things would have required me to rework them anyway, so why not take the
opportunity to also share them? However, given that I have been hosting this in
a private repository for the last few years, I had no real reason to ensure
that personal information wasn't stored in there. So, this also requires a
fresh start.

I am currently working from a mix of this and my previous repository. As I port
things over to here, this will contain a fuller picture of my configuration.

## Installation

I use some git hooks to prompt me to do things on certain updates. To make sure these work, run this one-time command in the root of the newly cloned repository:

    git config core.hooksPath .githooks

On first run, you need to install a profile using dotbot. E.g.

    ./install-profile full

Available profiles can be found in `meta/profiles`.


## Keeping up to date

To keep up to date...

    $ git pull
    $ ./install-profile <my profile>

Almost everything is automated by the install scripts.

There are three exceptions, where I use local package managers:

### Vim plugins with minpac

For a while I did this through submodules, but this proved to be too much hassle. I now manage these separately, using minpac. To keep them (and minpac itself) updated, run `PacUpdate` inside Vim.

### Zsh packages with antigen

I use antigen as a package manager for zsh. This has its own command-line tool and plugins are stored and versioned separately from this repo. To update your local antigen packages, do:

    antigen update

Antigen itself is stored as a submodule of this repo, and is pegged to a known-working version. It provides a simple self-update mechanism:

    antigen selfupdate

Updating antigen itself triggers an update of the submodule from upstream, so making that permanent requires a commit to this repo.


### Emacs with Doom

I use the rather awesome Doom Emacs. This provides its own command-line tool too, `doom`. This repo stays out of the way of Doom's own package management, and just stores the local doom configuration.

Bear in mind that pulling down the latest version of this repo might require a `doom sync`, or even an update, if we are now relying on new features.


### Dotbot itself

Dotbot is installed as a submodule, pegged to a known-working version. Updating this requires updating the submodule manually and committing that change to this repo.

