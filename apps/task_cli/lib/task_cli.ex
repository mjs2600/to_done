defmodule TaskCLI do
  alias TaskKeeper.{Repo, Task}

  def main(args) do
    {switches, _args, _errors} = OptionParser.parse(args)
    run(switches)
  end

  defp run(complete: id) do
    Task
    |> Repo.get(id)
    |> Task.changeset(%{completed: true})
    |> Repo.update

    run(show: id)
  end

  defp run(show: id) do
    Task
    |> Repo.get(id)
    |> format
    |> IO.puts
  end

  defp run(_) do
    Task.active
    |> Repo.all
    |> Enum.map(&format/1)
    |> Enum.join("\n")
    |> IO.puts
  end

  defp format(task) do
    "#{task |> format_completed} | #{task.id} | #{task.name}"
  end

  defp format_completed(%Task{completed: true}) do
    "✓"
  end

  defp format_completed(%Task{}) do
    "✗"
  end

end
