defmodule PhxCrudUsersWeb.PageController do
  use PhxCrudUsersWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
