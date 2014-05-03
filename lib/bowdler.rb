require 'bundler'
require 'bowdler/version'
require 'bowdler/bundler_installer'

Bundler::Installer.send(:include, Bowdler::BundlerInstaller)
