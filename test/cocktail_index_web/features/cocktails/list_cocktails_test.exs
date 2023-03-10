defmodule CocktailIndexWeb.Cocktails.ListCocktailsTest do
  use CocktailIndexWeb.FeatureCase, async: true

  feature "user visits cocktails page to see a list of cocktails", %{session: session} do
    [cocktail1, cocktail2] = insert_pair(:cocktail)

    session
    |> visit(index_page())
    |> assert_has(cocktail_name(cocktail1))
    |> assert_has(cocktail_name(cocktail2))
  end

  defp cocktail_name(cocktail) do
    Query.data("role", "cocktail-name", text: cocktail.name)
  end
end
