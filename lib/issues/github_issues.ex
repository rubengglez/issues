defmodule Issues.GithubIssues do
  @moduledoc """
  Used to request data to github API
  """

  @githubApi Application.get_env(:issues, :githubUrl)
  @resourceApi "repos/"
  @featureResource "issues"
  @acceptHeader [Accept: "application/vnd.github.v3.raw+json"]

  # @todo make a mock to test this
  def fetch(user, project) do
    uri = getUri(user, project)
    headers = getHeaders()
    client = getClientHttp(headers)

    client.(uri)
    |> processResponse
  end

  defp getUri(user, project),
    do: @githubApi <> @resourceApi <> "#{user}/#{project}/" <> @featureResource

  defp getHeaders(), do: @acceptHeader

  defp getClientHttp(headers \\ [], options \\ []),
    do: &HTTPoison.get(&1, headers, options)

  defp processResponse({:ok, %{status_code: 200, body: body}}) do
    {_, data} = Poison.decode(body)
    {:ok, data}
  end

  defp processResponse({:ok, %{status_code: ___, body: body}}), do: {:error, Poison.decode(body)}
end
