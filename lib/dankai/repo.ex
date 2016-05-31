defmodule Dankai.Repo do
  use Ecto.Repo, otp_app: :dankai
  use Scrivener, page_size: 10
end
