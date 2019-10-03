defmodule Fib do
  def fib(n), do: get_fib(n, start())
  def fib(n, cache), get_fib(n-1, cache) + get_fib(n-2, cache)

  defp get_fib(0, _cache), do: 0
  defp get_fib(1, _cache), do: 1
  defp get_fib(n, cache) do
    get_cached_fib(n-1, cache) + get_cached_fib(n-2, cache)
  end

  defp get_cached_fib(m, cache) do
    case get_value(cache, m) do
      x -> x
      _ -> insert_value(cache, )
    end
  end

  defp start() do
    Agent.start_link(fn -> %{ 0 => 0, 1 => 1} end)
  end

  defp insert_value(cache, value) do
    Agent.update(cache, &(Map.put(&1, value, value)))
  end

  defp get_value(cache, value) do
    Agent.get(cache, &(Map.fetch(&1, value)))
  end
end