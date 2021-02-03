console.clear();
const searchInput = document.querySelector("input");
const dataList = document.getElementById("nameResults");
const searchBtn = document.querySelector("button");
const info = document.querySelector(".info");
const title = document.querySelector("#title");
const genres = document.querySelector("#genres");
const poster = document.querySelector("#poster");
const myForm = document.querySelector("form");



searchInput.addEventListener("keyup", (event) => {
    dataList.innerHTML = '';
    fetch(`/ps4/?name=${searchInput.value}`)
        .then((response) => {
            if (!response.ok) throw new Error(response.status);
            return response.json();
        })
        .then((result) => {
            console.log(result)

            if (result.length > 1) {
                for (let i = 0; i <= result.length - 1; i++) {
                    const opt = document.createElement('option')
                    opt.innerHTML = `<option value="${result[i].name}" />`;
                    dataList.appendChild(opt)

                }
            } else {
                const opt = document.createElement('option')
                opt.innerHTML = `<option value="${result.name}" />`;
                dataList.appendChild(opt)

            }

        })
        .catch((error) => {
            console.log(error);
        });
});
searchBtn.addEventListener("click", getinfo);


function getinfo(event) {
    event.preventDefault();

    if (searchInput.value == "") {
        alert("You Need To Type A Game Name");
    } else {
        let game = searchInput.value;
        console.log("btn : " + game);

        fetch(`/ps4/?name=${game}`)
            .then((response) => {
                if (!response.ok) throw new Error(response.status);
                return response.json();
            })
            .then((result) => {
                console.log(result);
                if (result.length == 0) {
                    alert("No Results");
                } else {
                    myForm.style.display = "none";
                    info.style.display = "block";
                    title.textContent = result[0].name;
                    genres.textContent = "Genres : " + result[0].genres;
                    poster.src = result[0].images;
                    console.log("name : " + result[0].genres);
                }
            })
            .catch((error) => {
                console.log(error);
            });
    }
}