defmodule Procs do

  def greeter(count) do
    receive do
      { :boom, reason } ->
        exit(reason)
      { :reset } ->
        greeter(0)
      { :add, n } ->
        greeter(count+n)
      msg ->
        IO.puts "#{count}: #{inspect msg}"
        greeter(count)
    end
  end

end
