defmodule Skeleton4.LayoutView do
  use Skeleton4.Web, :view

  def get_session( conn, atom ) do
    Plug.Conn.get_session(conn, atom )
  end

end
