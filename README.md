# dotfiles

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
