<?php 
$title = "Toate categoriile";
$sub_title = "";
if(isset($_GET['c']) && isset($_GET['s'])){
    $cat_qry = $conn->query("SELECT * FROM categories where md5(id) = '{$_GET['c']}'");
    if($cat_qry->num_rows > 0){
        $title = $cat_qry->fetch_assoc()['category'];
    }
 $sub_cat_qry = $conn->query("SELECT * FROM sub_categories where md5(id) = '{$_GET['s']}'");
    if($sub_cat_qry->num_rows > 0){
        $sub_title = $sub_cat_qry->fetch_assoc()['sub_category'];
    }
}
elseif(isset($_GET['c'])){
    $cat_qry = $conn->query("SELECT * FROM categories where md5(id) = '{$_GET['c']}'");
    if($cat_qry->num_rows > 0){
        $title = $cat_qry->fetch_assoc()['category'];
    }
}
elseif(isset($_GET['s'])){
    $sub_cat_qry = $conn->query("SELECT * FROM sub_categories where md5(id) = '{$_GET['s']}'");
    if($sub_cat_qry->num_rows > 0){
        $title = $sub_cat_qry->fetch_assoc()['sub_category'];
    }
}
?>
<!-- Header-->
<header class="bg-dark" id="main-header">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white outlined-text" style="text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7); -webkit-text-stroke: 1px black; text-stroke: 1px black;">
            <h1 class="display-4 fw-bolder"><?php echo $title ?></h1>
            <p class="lead fw-normal text-white-50 mb-0"><?php echo $sub_title ?></p>
        </div>
    </div>
</header>
<!-- Section-->
<section class="py-3">
    <div class="container px-4 px-lg-5 mt-5">
        <div class="row gx-2 gx-lg-5 row-cols-1 row-cols-md-2 row-cols-xl-2 justify-content-center">
           
            <?php 
                $whereData = "";
                $categories = $conn->query("SELECT * FROM `categories` where status = 1 order by category asc ");
                while($row = $categories->fetch_assoc()):
                    foreach($row as $k=> $v){
                        $row[$k] = trim(stripslashes($v));
                    }
                    $row['description'] = strip_tags(stripslashes(html_entity_decode($row['description'])));
            ?>
            <div class="col mb-6 mb-2">
                <a href="./?p=products&c=<?php echo md5($row['id']) ?>" class="card category-item text-decoration-none text-reset">
                    <div class="card-body p-4">
                        <div class="">
                            <!-- Product name-->
                            <h5 class="fw-bolder border-bottom border-pink"><?php echo $row['category'] ?></h5>
                        </div>
                        <p class="m-0 truncate"><?php echo $row['description'] ?></p>
                    </div>
                </a>
            </div>
            <?php endwhile; ?>
        </div>
    </div>
</section>