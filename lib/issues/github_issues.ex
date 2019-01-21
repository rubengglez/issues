defmodule Issues.GithubIssues do
  @moduledoc """
  Used to request data to github API
  """
  @urlGithubApi "https://api.github.com/repos/"
  @urlResource "issues"
  @acceptHeader [Accept: "application/vnd.github.v3.raw+json"]

  # @todo make a mock to test this
  def fetch(user, project) do
    uri = getUri(user, project)
    headers = getHeaders()
    client = getClientHttp(headers)

    client.(uri)
    |> processResponse
  end

  defp getUri(user, project), do: @urlGithubApi <> "#{user}/#{project}/" <> @urlResource
  defp getHeaders(), do: @acceptHeader

  defp getClientHttp(headers \\ [], options \\ []),
    do: &HTTPoison.get(&1, headers, options)

  defp processResponse({:ok, %{status_code: 200, body: body}}), do: {:ok, Poison.decode(body)}
  defp processResponse({:ok, %{status_code: ___, body: body}}), do: {:error, Poison.decode(body)}
end