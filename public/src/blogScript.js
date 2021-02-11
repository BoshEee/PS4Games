const pageBody = document.querySelector(".post");

fetch(`feed`)
  .then((response) => {
    if (!response.ok) throw new Error(response.status);
    return response.json();
  })
  .then((result) => {
    console.log(result);
    for (let i = 0; i <= result.length; i++) {
      let postDiv = document.createElement("div");
      let postTitle = document.createElement("h3");
      let postBody = document.createElement("p");

      postTitle.textContent = result[0].blog_title;
      postBody.textContent = result[0].post_body;

      pageBody.appendChild(postDiv);
      postDiv.appendChild(postTitle);
      postDiv.appendChild(postBody);
    }
  })
  .catch((error) => {
    console.log(error);
    alert("Oops, something went wrong !");
  });
