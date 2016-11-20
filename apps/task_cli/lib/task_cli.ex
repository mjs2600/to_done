defmodule TaskCLI do
  def main(_args) do
    TaskKeeper.Task.active
    |> TaskKeeper.Repo.all
    |> Enum.map(&format/1)
    |> Enum.join("\n")
    |> IO.puts
  end

  defp format(task) do
    "#{task |> format_completed} | #{task.name}"
  end

  defp format_completed(%TaskKeeper.Task{completed: true}) do
    "✓"
  end

  defp format_completed(%TaskKeeper.Task{}) do
    "✗"
  end

end
