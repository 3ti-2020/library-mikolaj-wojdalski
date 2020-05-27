<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
  
    <div class="main">
    <?php
    $servername = "127.0.0.1";
    $username = "root";
    $password = "";
    $dbname = "library";

    $conn = new mysqli($servername, $username, $password, $dbname);

    $result = $conn->query("SELECT id_x,imię, nazwisko, tytul, ISBN FROM x, autorzy, tytuły WHERE x.id_autor=autorzy.id_autor AND x.id_tytul=tytuły.id_tytul");

    echo("<table>");
	echo("<table border='2'>");
    echo("<tr>
    <th>id_x</th>
    <th>imię</th>
    <th>nazwisko</th>
    <th>tytul</th>
	<th>ISBN</th>
	<th>Usuń</th>
   
    
    </tr>");
    while( $wiersz = $result->fetch_assoc() ) {
        echo("<tr>");
        echo("<td>".$wiersz['id_x']."</td>".
        "<td>".$wiersz['imię']."</td>".
        "<td>".$wiersz['nazwisko']."</td>".
        "<td>".$wiersz['tytul']."</td>". 
        "<td>".$wiersz['ISBN']."</td>".
		 "<td>
        <form action='delete.php' method='POST'>
        <input type='hidden' name='id' value=".$wiersz['id_x'].">
        <input type='submit' value='Usuń'>
        </form> </td>"
    );
        echo("</tr>");
    }
    echo("</table>");
    ?>
    </div>
    </div> 
</body>
</html>