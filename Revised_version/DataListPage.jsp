<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>



.header {
  overflow: hidden;
  /*background-color:#71DF57;*/
  background-image: linear-gradient(#40ED40, #8BF48B);
  padding: 20px 10px;
}

.header a {
  float: left;
  color: grey;
  text-align: center;
  padding: 12px;
  text-decoration: none;
  font-size: 18px;
  line-height: 25px;
  border-radius: 4px;
  font-family: 'Roboto', sans-serif;
}

.header a.logo {
  font-size: 30px;
  font-weight: bold;
  letter-spacing: 2.5px;
  color: white;
  font-family: 'Roboto', sans-serif;
}

.header a:hover {
  background-color: #ddd;
  color: grey;
}

.header a.active {
  /*background-color: dodgerblue;*/
  color: grey;
}

.header-right {
  float: right;
}

@media screen and (max-width: 500px) {
  .header a {
    float: none;
    display: block;
    text-align: left;
  }

  .header-right {
    float: none;
  }
}

li {
  float: left;
}


li a {
  display: block;
  color: white;
  text-align: center;
  width:150px;

  padding: 14px 16px;

  text-decoration: none;
}

li a:hover {
  background-color: #2EE59D;
  transition: 0.5s;


}






.nav  {
  list-style-type: none;
  position:absolute;
left:25%;top:0;

  margin-left: 40;
  margin-top: 120;
  overflow: hidden;
  background-color: #71DF57;
border-radius: 25px;
border-style: none;
letter-spacing: 2.5px;
box-shadow: 0px 8px 15px rgba(0,0,0,0.3);

}

li {
  float: left;
}


li a {
  display: block;
  color: white;
  text-align: center;
  width:150px;

  padding: 14px 16px;

  text-decoration: none;
}

li a:hover {
  background-color: #2EE59D;
  transition: 0.5s;


}
body
{
background-color: #E9F3E7;
}


div.gallery {
  margin: 5px;
  border: 1px solid #ccc;
  float: left;
  width: 180px;
}

div.gallery:hover {
  border: 1px solid #777;


  background-color: rgba(0, 0, 0, 0.3);



}

div.gallery img {
  width: 100%;
  height: 120;
  object-fit: cover;
}



.responsive {
  padding: 0 6px;
  float: left;
  width: 250;
  text-decoration: none;
}



.card {
  background-color:#E9F3E7 ;
  padding: 20px;
  margin-top: 20px;
  margin-left: 240;
}

div.desc {
  padding: 15px;
  text-align: center;
  font-family: verdana;
  text-decoration: none;

}


.footer {
  padding: 3px;
  text-align: center;
  background: #ddd;
  margin-top: 700px;
  text-decoration-color: black;
  font-family: Arial, Helvetica, sans-serif;
}


.footer f1 {
  font-size: 10px;
}

@media screen and (max-width: 400px) {
  .topnav a {
    float: none;
    width: 100%;
  }
}


.form-control
{
  width: 400px;
  font-size: 15px;
  height: 30px;
  border-style: none;
  /* border: none; */
  /* border-bottom: 2px solid green; */
  margin-left: 300px;
  margin-top: 10px;
  /* background-image: linear-gradient(#40ED40, #8BF48B); */
  background-color: white;
  border-radius: 20px;
}

.form-control::-webkit-input-placeholder
{
  margin-left: 10px;
}

.form-control:focus
{
  outline: none;
}


</style>

<script type="text/javascript">
  function myFunction() {
    var input, filter, cards, cardContainer, h5, title, i;
    input = document.getElementById("myFilter");
    filter = input.value.toUpperCase();
    cardContainer = document.getElementById("myItems");
    cards = cardContainer.getElementsByClassName("responsive");
    for (i = 0; i < cards.length; i++) {
        title = cards[i].querySelector(".gallery");
        if (title.innerText.toUpperCase().indexOf(filter) > -1) {
            cards[i].style.display = "";
        } else {
            cards[i].style.display = "none";
        }
    }
}

// function myTraverse()
// {
//   var x = document.getElementById("imageElement").src;
//   sessionStorage.setItem("source", x);
// }
</script>
</head>
<body>



    <div class="header">
      <a href="#default" class="logo">Agro Grocer</a>
      <input type="text" id="myFilter" class="form-control" onkeyup="myFunction()" placeholder="Search for names..">
  <div class="header-right">
    <a class="active" href="DataListPage.jsp">Home</a>
    <a href="UserDataList" method="post">User</a>
    <a href="CartDataList">Cart </a>
    <a href="#about">Contact</a>
    <a href="LoginPage.jsp"> Log out </a>
  </div>
  </div>



<div class="row" id="myItems">
<div class="card">
<div class="responsive">
<div class="gallery">
  
  <form action="ProcessPage" method="get">
  <input type="hidden" value="images/tomato.jpeg" name="imageSrc">
    <input type="hidden" value="Tomato" name="imageName">
    <input type="image" src="images/tomato.jpeg" alt="Mushroom" width="180px" height="100px">
  </form>
  <div class="desc">Tomato</div>
</div></div>

<div class="responsive">
<div class="gallery">

  <form action="ProcessPage" method="get">
  <input type="hidden" value="images/potato.jpeg" name="imageSrc">
    <input type="hidden" value="Potato" name="imageName">
    <input type="image" src="images/potato.jpeg" alt="Mushroom" width="180px" height="100px">
  </form>
  <div class="desc">Potato</div>
</div></div>




<div class="responsive">
<div class="gallery">
 
  <form action="ProcessPage" method="get">
  <input type="hidden" value="images/Mushroom.jpeg" name="imageSrc">
    <input type="hidden" value="Mushroom" name="imageName">
    <input type="image" src="images/Mushroom.jpeg" alt="Mushroom" width="180px" height="100px">
  </form>
  <div class="desc">Mushroom</div>
</div></div>




<div class="responsive">
<div class="gallery">
 
  <form action="ProcessPage" method="get">
  <input type="hidden" value="images/brinjal.jpeg" name="imageSrc">
    <input type="hidden" value="Brinjal" name="imageName">
    <input type="image" src="images/brinjal.jpeg" alt="Mushroom" width="180px" height="100px">
  </form>
  <div class="desc">Brinjal</div>
</div></div>

<div class="responsive">
<div class="gallery">
  
  <form action="ProcessPage" method="get">
  <input type="hidden" value="images/carot.jpeg" name="imageSrc">
    <input type="hidden" value="Carrot" name="imageName">
    <input type="image" src="images/carot.jpeg" alt="Mushroom" width="180px" height="100px">
  </form>
  <div class="desc">Carrot</div>
</div></div>



<div class="responsive">
<div class="gallery">
  <%-- <a target="_blank" href="ProcessPage"  name="imageSrc" value="drumstick.jpeg">
    <img src="drumstick.jpeg" id="imageElement" alt="">
  </a> --%>
  <form action="ProcessPage" method="get">
  <input type="hidden" value="images/drumstick.jpeg" name="imageSrc">
    <input type="hidden" value="Drumstick" name="imageName">
    <input type="image" src="images/drumstick.jpeg" alt="Mushroom" width="180px" height="100px">
  </form>
  <div class="desc">Drumstick</div>
</div></div>



<div class="responsive">
<div class="gallery">
  <%-- <a target="_blank" href="ProcessPage" name="imageSrc" value="chilli.jpeg">
    <img src="chilli.jpeg" id="imageElement" alt="">
  </a> --%>
  <form action="ProcessPage" method="get">
  <input type="hidden" value="images/chilli.jpeg" name="imageSrc">
    <input type="hidden" value="Chilli" name="imageName">
    <input type="image" src="images/chilli.jpeg" alt="Mushroom" width="180px" height="100px">
  </form>
  <div class="desc">Chilli</div>
</div></div>


<div class="responsive">
<div class="gallery">
  <%-- <a target="_blank" href="ProcessPage" name="imageSrc" value ="onion.jpeg">
    <img src="onion.jpeg" id="imageElement" alt="">
  </a> --%>
  <form action="ProcessPage" method="get">
  <input type="hidden" value="images/onion.jpeg" name="imageSrc">
    <input type="hidden" value="Onion" name="imageName">
    <input type="image" src="images/onion.jpeg" alt="Mushroom" width="180px" height="100px">
  </form>
  <div class="desc">Onion</div>
</div></div>


<div class="responsive">
<div class="gallery">
  <%-- <a target="_blank" href="ProcessPage" name="imageSrc" value = radish.jpeg>
    <img src="radish.jpeg" id="imageElement" alt="">
  </a> --%>
  <form action="ProcessPage" method="get">
  <input type="hidden" value="images/radish.jpeg" name="imageSrc">
    <input type="hidden" value="Radish" name="imageName">
    <input type="image" src="images/radish.jpeg" alt="Mushroom" width="180px" height="100px">
  </form>
  <div class="desc">Radish</div>
</div></div>

<div class="responsive">
<div class="gallery">
  <%-- <a target="_blank" href="ProcessPage" name="imageSrc" value="oil.jpeg" >
    <img src="oil.jpeg" id="imageElement" alt="">
  </a> --%>
  <form action="ProcessPage" method="get">
  <input type="hidden" value="images/oil.jpeg" name="imageSrc">
    <input type="hidden" value="Oil" name="imageName">
    <input type="image" src="images/oil.jpeg" alt="Mushroom" width="180px" height="100px">
  </form>
  <div class="desc">Oil</div>
</div></div>


<div class="responsive">
<div class="gallery">
  <%-- <a target="_blank" href="ProcessPage" name="imageSrc" value="lf.jpeg">
    <img src="lf.jpeg" id="imageElement" alt="">
  </a> --%>
  <form action="ProcessPage" method="get">
  <input type="hidden" value="images/lf.jpeg" name="imageSrc">
    <input type="hidden" value="Ladish Finger" name="imageName">
    <input type="image" src="images/lf.jpeg" alt="Mushroom" width="180px" height="100px">
  </form>
  <div class="desc">Ladies Finger</div>
</div></div>

<div class="responsive">
<div class="gallery">
  <%-- <a target="_blank" href="ProcessPage" name="imageSrc" value="pumkin.jpeg">
    <img src="pumkin.jpeg" id="imageElement" alt="">
  </a> --%>
  <form action="ProcessPage" method="get">
  <input type="hidden" value="images/pumkin.jpeg" name="imageSrc">
    <input type="hidden" value="Pumkin" name="imageName">
    <input type="image" src="images/pumkin.jpeg" alt="Mushroom" width="180px" height="100px">
  </form>
  <div class="desc">Pumkin</div>
</div></div>




</div>


<div class="footer">
  <f1>All rights Reserved , Copyrighted to Agro Grocer(2020)</f1>
</div>

</body>
