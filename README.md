[![Build Status](https://travis-ci.org/benfalk/word_smith.svg?branch=master)](https://travis-ci.org/benfalk/word_smith)
[![Hex Version](https://img.shields.io/hexpm/v/word_smith.svg)](https://hex.pm/packages/word_smith)

# WordSmith

>  General text utility library to help with string manipulation not
>  found in the standard Elixir library.

## Functionality

### Remove Accents / Diacritics From Strings

``` elixir
  WordSmith.remove_accents("Ĥĕľŀö Ŵóŕƚƌ ©") # => "Hello World (C)"
```

### Squish Strings

``` elixir
  WordSmith.squish("\nHello \t  World!\n  ") #=> "Hello World!"
```

## Installation

Add word_smith to your list of dependencies in `mix.exs`:

``` elixir
  def deps do
    [{:word_smith, "~> 0.2.0"}]
  end
```
