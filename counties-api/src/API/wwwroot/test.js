function getCounties(){
      const myHeaders = new Headers();
    myHeaders.set('Content-Type', 'application/json');
    const myList = document.querySelector('ul');
    const myRequest = new Request('https://localhost:5001/api/County/api/GetAllCounties?pageSize=100', {
      method: 'GET',
      headers: myHeaders,
      mode: 'cors',
      cache: 'default',
    });
    fetch(myRequest)
    .then((response) => response.json())
    .then((data) => {
      
    var json = data.result;

    for(let i = 0; i < json.length; i++) {
      let obj = json[i];
      lblMsg.innerHTML += obj.countyName + " <br/>";
      }
    })
    .catch(console.error);
  }
