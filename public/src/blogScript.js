fetch(`feed`)
  .then((response) => {
    if (!response.ok) throw new Error(response.status);
    return response.json();
  })
  .then((result) => {
    console.log(result);
  })
  .catch((error) => {
    console.log(error);
    alert("Oops, something went wrong !");
  });
