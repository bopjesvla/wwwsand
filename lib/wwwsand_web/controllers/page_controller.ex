defmodule WwwsandWeb.PageController do
  use WwwsandWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def run(conn, %{"code" => code}) do
    case ExRated.check_rate("my-rate-limited-api", 2_000, 20) do
      {:ok, _} ->
        case Sand.run(%Sand{max_reductions: 10_000_000}, code) do
          {:ok, res, _box} ->
            json(conn, %{ok: true, result: inspect res})
          {:error, e} ->
            json(conn, %{ok: false, error: inspect e})
        end
      {:error, i} ->
        json(conn, %{ok: false, error: """
        Too many Sand processes have been started. Wait until the server is less busy.
        """})
    end
  end
end
