name = "Luiz Zamboni"

# characters count
String.length(name) |> IO.inspect

byte_size("é") |> IO.inspect

# slice
String.slice(name,0..3) |> IO.inspect

# L
String.at(name,0) |> IO.inspect