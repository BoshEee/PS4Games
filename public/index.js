const searchInput = document.querySelector("input");
const dataList = document.getElementById("nameResults");

searchInput.addEventListener("keyup", (event) => {
  console.log("Input : " + searchInput.value);

  fetch(`/ps4?name=${searchInput.value}`)
    .then((response) => {
      if (!response.ok) throw new Error(response.status);
      return response.json();
    })
    .then((result) => {
      let res = JSON.parse(result);
      let games = res.games.filter((game) => {
        return game.name
          .toLowerCase()
          .startsWith(searchInput.value.toLowerCase());
      });

      for (let i = 0; i <= games.length - 1; i++) {
        let opt = "";
        opt = '<option value="'+games[i].name+'" />';
        dataList.innerHTML = opt;
      }
    })
    .catch((error) => {
      console.log(error);
    });
});
