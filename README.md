# Enumify

A simple enum for Ecto.

## Installation
Add `enumify` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:enumify, "~> 0.1.0", git: "https://github.com/svetliomihailov/enumify.git"}
  ]
end
```

## Usage
Define an enum type for your ecto based schema:
```elixir
defmodule UserRole do
  use Enumify, guest: 0, user: 1, admin: 2
end
```

Use the enum type in your migrations:
```elixir
add(:role, UserRole.type(), null: false, default: 0)
```
