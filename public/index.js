const searchInput = document.querySelector("input");

searchInput.addEventListener("keyup", (event) => {
  console.log(searchInput.value);

  fetch(`/ps4?name=${searchInput.value}`)
    .then((response) => {
      if (!response.ok) throw new Error(response.status);
      return response.json()
    })
    .then((result) => {
      let res = JSON.parse(result);
      let games = res.games.filter((game) => {

        return game.name.toLowerCase().startsWith(searchInput.value.toLowerCase());
      })
      console.log(games);
    })
    .catch((error) => {
      console.log(error);
    });
});
