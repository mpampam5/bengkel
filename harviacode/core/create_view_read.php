<?php

$string = "\n<div class=\"row\">
<div class=\"col-md-12 d-flex align-items-stretch grid-margin\">
  <div class=\"row flex-grow\">
    <div class=\"col-12\">
      <div class=\"card\">
        <div class=\"card-body\">
          <h4>Detail <?=\$layout_title?></h4>
  <table class=\"table table-bordered\">";
foreach ($non_pk as $row) {
  $string .= "\n\t    <tr><th>".label($row["column_name"])."</th><td><?php echo $".$row["column_name"]."; ?></td></tr>";
}

$string .= "\n\t</table>
    <br>
    <!-- MODAL ClOSE -->
    <!-- <button type=\"button\" class=\"btn btn-secondary btn-sm \" data-dismiss=\"modal\" aria-label=\"Close\">tutup</button> -->
    <a href=\"javascript:history.go(-1)\" class=\"btn btn-secondary btn-sm\"> Kembali</a>
    </div>
  </div>
  </div>
  </div>
  </div>
  </div>
";



$hasil_view_read = createFile($string, $target."".$direct_created_view."". $c_url . "/" . $v_read_file);

?>
