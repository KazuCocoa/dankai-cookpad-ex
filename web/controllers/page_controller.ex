defmodule Dankai.PageController do
  use Dankai.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
