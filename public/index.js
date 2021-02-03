console.clear();

const searchInput = document.querySelector("input");
const dataList = document.getElementById("nameResults");
const output = document.querySelector(".output");

searchInput.addEventListener("keyup", (event) => {
  dataList.innerHTML = "";
  fetch(`/ps4/?name=${searchInput.value}`)
    .then((response) => {
      if (!response.ok) throw new Error(response.status);
      return response.json();
    })
    .then((result) => {
      for (let i = 0; i <= result.length - 1; i++) {
        const opt = document.createElement("option");
        opt.innerHTML = `<option value="${result[i].name}" />`;
        dataList.appendChild(opt);
      }
    })
    .catch((error) => {
      console.log(error);
    });
});

// Getting Games By Genres
function getByGenre() {
  let genreArray = [
    "Action",
    "Horror",
    "Adventure",
    "Shooter",
    "Role Playing Game",
  ];
  let test = genreArray[4];
  console.log("btn : " + test);

  fetch(`/search/?genre=`)
    .then((response) => {
      if (!response.ok) throw new Error(response.status);
      return response.json();
    })
    .then((result) => {
      console.log(result.games.length);
      for (let i = 0; i <= result.games.length - 1; i++) {
        if (result.games[i].genres.includes(test)) {
          const poster = document.createElement("img");
          const title = document.createElement("i");

          poster.src = result.games[i].images;
          poster.classList.add("poster");
          title.innerText = result.games[i].name;

          output.appendChild(poster);
          output.appendChild(title);
          console.log(
            "if : Name = " +
              result.games[i].name +
              " genre = " +
              result.games[i].genres
          );
        }
      }
    })
    .catch((error) => {
      console.log(error);
    });
}

getByGenre();
