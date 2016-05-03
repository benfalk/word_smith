[![Build Status](https://travis-ci.org/benfalk/word_smith.svg?branch=master)](https://travis-ci.org/benfalk/word_smith)

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
    [{:word_smith, "~> 0.1.0"}]
  end
```
