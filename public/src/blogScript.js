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
      let postTags = document.createElement("i");
      let line = document.createElement("hr");

      postTitle.textContent = "Post Title : " + result[i].blog_title;
      postBody.textContent = result[i].post_body;
      postTags.textContent = "Tags : " + result[i].tags;

      pageBody.appendChild(postDiv);
      postDiv.appendChild(postTitle);
      postDiv.appendChild(postBody);
      postDiv.appendChild(postTags);
      postDiv.appendChild(line);
    }
  })
  .catch((error) => {
    console.log(error);
    alert("something went wrong !");
  });
