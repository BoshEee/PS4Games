var form = document.querySelector("form");
var username = document.getElementById("username");
var password = document.getElementById("password");
var error = document.getElementById("error");
let valid = true;

function checkPassword() {
  if (password.value === "") {
    error.textContent = "Password cannot be empty";
    valid = false;
  } else {
    error.textContent = "";
  }
}

function checkUsername() {
  if (username.value === "") {
    error.textContent = "Username cannot be empty";
    valid = false;
  } else {
    error.textContent = "";
    checkPassword();
  }
}

form.addEventListener("submit", function (event) {
  event.preventDefault();
  error.textContent = "";
  checkUsername();
  if (valid) {
    console.log(valid);
    let apiurl = `/login?user_name=${username.value}&user_pass=${password.value}`;
    fetch(apiurl)
      .then((response) => {
        if (!response.ok) throw new Error(response.status);
        alert(`Welcome Back ${username.value}`);
        window.location.href = "/";
      })
      .catch((err) => {
        if (err.message === "404") {
          error.textContent = "Username or password are not correct!";
        } else {
          alert("somthing went wrong");
        }
      });
  }
});
