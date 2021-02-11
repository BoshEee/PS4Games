console.clear();

// Selectors
const searchInput = document.querySelector("input");
const dataList = document.getElementById("nameResults");
const searchBtn = document.querySelector(".subBtn");
const homepage = document.querySelector(".homePage");
const screenshotsBox = document.querySelector(".screenshots");
// Info Section
const info = document.querySelector(".info");
const title = document.querySelector("#title");
const genres = document.querySelector("#genres");
const poster = document.querySelector("#poster");
const price = document.querySelector("#price");
const release = document.querySelector("#release");
const summary = document.querySelector("#summary");
const rate = document.querySelector("#rate");

// Event Listener
searchBtn.addEventListener("click", getinfo);

// Autocomplete Feature
searchInput.addEventListener("keyup", (event) => {
  dataList.innerHTML = "";
  fetch(`/ps4/?name=${searchInput.value}`)
    .then((response) => {
      if (!response.ok) throw new Error(response.status);
      return response.json();
    })
    .then((result) => {
      console.log(result);

      if (result.length > 1) {
        for (let i = 0; i <= result.length - 1; i++) {
          const opt = document.createElement("option");
          opt.innerHTML = `<option value="${result[i].title}" />`;
          dataList.appendChild(opt);
        }
      } else {
        const opt = document.createElement("option");
        opt.innerHTML = `<option value="${result[0].title}" />`;
        dataList.appendChild(opt);
      }
    })
    .catch((error) => {
      console.log(error);
      alert("Oops, something went wrong !");
    });
});

// Display More Info about the chosen game
function getinfo(event) {
  event.preventDefault();
  if (searchInput.value == "") {
    alert("You Need To Type A Game Name");
  } else {
    let game = searchInput.value;
    console.log("btn : " + game);

    fetch(`/getgame/?name=${game}`)
      .then((response) => {
        if (!response.ok) throw new Error(response.status);
        return response.json();
      })
      .then((result) => {
        console.log("this : " + result);
        if (result.length == 0) {
          alert("Sorry, Game Not Found");
        } else {
          homepage.style.display = "none";
          screenshotsBox.innerHTML = "";
          info.style.display = "grid";
          title.textContent = result[0].title;
          genres.textContent = "Genres : " + result[0].genres;
          poster.src = result[0].poster;
          price.textContent = "Price : " + result[0].price;
          release.textContent = "Release : " + result[0].release_date;
          rate.textContent = "Rate : " + result[0].rate;
          summary.textContent = "Summary : " + result[0].game_summa;

          for (let i = 0; i < 3; i++) {
            let screenshots = document.createElement("img");
            screenshots.classList.add("screenshots");
            screenshots.src = result[0].screenshots[i];
            screenshotsBox.appendChild(screenshots);
          }
          console.log("name : " + result[0].genres);
        }
      })
      .catch((error) => {
        console.log(error);
        alert("Oops, something went wrong !");
      });
  }
}

function showGames() {
  fetch(`/home`)
    .then((response) => {
      if (!response.ok) throw new Error(response.status);
      return response.json();
    })
    .then((result) => {
      for (let i = 0; i < 10; i++) {
        console.log("this : " + result[i].title);
      }
    })
    .catch((error) => {
      console.log(error);
      alert("Oops, something went wrong !");
    });
}

showGames();
