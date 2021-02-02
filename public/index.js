const searchInput = document.querySelector("input");
const dataList = document.getElementById("nameResults");

searchInput.addEventListener("keyup", (event) => {
    dataList.innerHTML = ''
    fetch(`/ps4/?name=${searchInput.value}`)
        .then((response) => {
            if (!response.ok) throw new Error(response.status);
            return response.json();
        })
        .then((result) => {

            for (let i = 0; i <= result.length - 1; i++) {
                const opt = document.createElement('option')
                opt.innerHTML = `<option value="${result[i].name}" />`;
                dataList.appendChild(opt)

            }
        })
        .catch((error) => {
            console.log(error);
        });
});