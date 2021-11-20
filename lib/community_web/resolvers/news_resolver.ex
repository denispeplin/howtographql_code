defmodule CommunityWeb.NewsResolver do
  alias Community.News

  def all_links(_root, _args, _info) do
    {:ok, News.list_links()}
  end

  def create_link(_root, args, _info) do
    # TODO: add detailed error message handling later
    case News.create_link(args) do
      {:ok, link} ->
        {:ok, link}

      _error ->
        {:error, "could not create link"}
    end
  end

  def update_link(_root, args, _info) do
    link = News.get_link!(args.id)

    case News.update_link(link, Map.delete(args, :id)) do
      {:ok, link} ->
        {:ok, link}

      _error ->
        {:error, "could not delete link"}
    end
  end

  def delete_link(_root, args, _info) do
    link = News.get_link!(args.id)

    case News.delete_link(link) do
      {:ok, _link} ->
        {:ok, :deleted}

      _error ->
        {:error, "could not delete link"}
    end
  end
end
