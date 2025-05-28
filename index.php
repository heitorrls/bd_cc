<?php
    $conexao = new PDO(
        "mysql:dbname=loja;
        host=localhost", "root", "ceub123456");
    $sql = "SELECT * FROM clientes";
    $query = $conexao->query($sql);
    $clientes = $query->fetchAll(PDO::FETCH_ASSOC);
    
    foreach ($clientes as $cliente) {
        echo $cliente["nome"] . "<br>";
    } 
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            padding: 15px;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji"; /* Fonte padrão do Bootstrap 4 para consistência */
            color: #212529; 
            background-color: #f8f9fa;
        }
        table {
            margin-top: 15px;
            border-collapse: collapse; 
            background-color: #fff; 
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
        }
        td {
            padding: 0.75rem;               
            vertical-align: top;            
            
        }
        table[border="1"] {
            border-style: solid;
            border-width: 1px; 
            border-color: #dee2e6; 
        }
        table[border="1"] td {
            border-style: solid;
            border-width: 1px;
            border-color: #dee2e6; 
        }
        tr:hover {
            background-color: #f5f5f5;
            color: #212529;           
        }
    </style>
</head>
</head>
<body>
<table border="1" width="100%">
    <tr>
        <th>ID</th>
        <th>Nome</th>
        <th>Telefone</th>
        <th>Endereço</th>
        <th>Ações</th>
    </tr>
    <?php foreach ($clientes as $cliente) { ?>
        <tr>
            <td><?php echo $cliente["id"] ?></td>
            <td><?php echo $cliente["nome"] ?></td>
            <td><?php echo $cliente["telefone"] ?></td>
            <td><?php echo $cliente["endereco"] ?></td>
            <td>
                <form method="GET" action="excluir.php" onsubmit="return confirm('Tem certeza que deseja excluir este cliente?');" style="display:inline;">
                    <input type="hidden" name="id" value="<?php echo $cliente['id']; ?>">
                    <button type="submit" class="btn btn-danger btn-sm">Excluir</button>
                </form>
            </td>
        </tr>
    <?php } ?>
</table>
</body>
</html>