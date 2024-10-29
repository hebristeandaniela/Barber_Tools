<style>
    .brand-container {
   
    padding-top: 40px; 
}

    .carousel-item>img {
        object-fit: fill !important;
    }

    #carouselExampleControls .carousel-inner {
        height: 280px !important;
    }

    .position-sticky {
        top: 0;
        height: 100vh;
        overflow-y: auto;
    }

    .product-holder {
        height: 200px;
    }

    .product-cover {
        height: 100%;
        object-fit: cover;
    }

    .product-item:hover .product-cover {
        transform: scale(1.1);
        transition: transform 0.5s;
    }

    .card-body {
        text-align: center;
    }

    .section-title {
        text-align: center;
        margin-top: 30px;
        margin-bottom: 30px;
    }

    .ad-video-section {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 50px;
        margin-bottom: 50px;
    }

    .ad-section,
    .video-container {
        width: 48%;
    }

    .video-container {
        position: relative;
        padding-bottom: 65.50%;
        /* 16:9 aspect ratio */
        height: 0;
        background: #000;
    }

    .video-container video {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        object-fit: cover;
        /* This ensures the video covers the container without black bars */
    }

    .gallery-section {
        margin-top: 50px;
        margin-bottom: 50px;
    }

    .gallery-container {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
        justify-content: center;
    }

    .gallery-container img {
        width: calc(25% - 10px);
        height: 200px;
        object-fit: cover;
        transition: transform 0.3s;
    }

    .gallery-container img:hover {
        transform: scale(1.05);
    }

    .brand-list {
        margin-top: 20px;
    }

    .brand-list .list-group-item {
        display: flex;
        align-items: center;
        padding: 10px 20px;
        border: none;
        background: none;
        transition: background-color 0.3s;
    }

    .brand-list .list-group-item:hover {
        background-color: #f0f0f0;
        border-radius: 5px;
    }

    .brand-list .icheck-primary {
        margin-right: 10px;
    }

    .brand-list .icheck-primary input {
        position: absolute;
        opacity: 0;
        cursor: pointer;
    }

    .brand-list .icheck-primary input+label::before {
        content: '';
        display: inline-block;
        width: 20px;
        height: 20px;
        border: 2px solid #ccc;
        border-radius: 3px;
        margin-right: 10px;
        transition: background-color 0.3s, border-color 0.3s;
    }

    .brand-list .icheck-primary input:checked+label::before {
        background-color: #007bff;
        border-color: #007bff;
    }

    .brand-list .icheck-primary input:checked+label::after {
        content: '✔';
        display: inline-block;
        width: 20px;
        height: 20px;
        color: white;
        text-align: center;
        line-height: 20px;
        position: absolute;
        left: 0;
        top: 0;
    }
</style>
<?php
$brands = isset($_GET['b']) ? json_decode(urldecode($_GET['b'])) : array();
?>
<div class="py-0">
    <div class="container">
        <div class="row">
        
            <div class="col-lg-2 px-1 border-right text-sm position-sticky">
                  <div class="brand-container">
                    <h4 class="mt-20"><b>Branduri</b></h4> <!-- Adăugăm clasă pentru marginea de sus goală -->
                    <ul class="list-group brand-list">
                        <a href="" class="list-group-item list-group-item-action">
                            <div class="icheck-primary d-inline">
                                <input type="checkbox" id="brandAll">
                                <label for="brandAll">Toate</label>
                            </div>
                        </a>
                        <?php
                        $qry = $conn->query("SELECT * FROM brands where status =1 order by name asc");
                        while ($row = $qry->fetch_assoc()):
                            ?>
                            <li class="list-group-item list-group-item-action">
                                <div class="icheck-primary d-inline">
                                    <input type="checkbox" id="brand-item-<?php echo $row['id'] ?>" <?php echo in_array($row['id'], $brands) ? "checked" : "" ?> class="brand-item" value="<?php echo $row['id'] ?>">
                                    <label for="brand-item-<?php echo $row['id'] ?>"><?php echo $row['name'] ?></label>
                                </div>
                            </li>
                        <?php endwhile; ?>
                    </ul>
                </div>
            </div>


            <div class="col-lg-10 py-2">
                <div class="row">
                    <div class="col-md-12">
                        <div id="carouselExampleControls" class="carousel slide bg-dark" data-ride="carousel">
                            <div class="carousel-inner">
                                <?php
                                $upload_path = "uploads/banner";
                                if (is_dir(base_app . $upload_path)):
                                    $file = scandir(base_app . $upload_path);
                                    $_i = 0;
                                    foreach ($file as $img):
                                        if (in_array($img, array('.', '..')))
                                            continue;
                                        $_i++;
                                        ?>
                                        <div class="carousel-item h-100 <?php echo $_i == 1 ? "active" : '' ?>">
                                            <img src="<?php echo validate_image($upload_path . '/' . $img) ?>"
                                                class="d-block w-100 h-100" alt="<?php echo $img ?>">
                                        </div>
                                    <?php endforeach; ?>
                                <?php endif; ?>
                            </div>
                            <button class="carousel-control-prev" type="button" data-target="#carouselExampleControls"
                                data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Anterior</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-target="#carouselExampleControls"
                                data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Următorul</span>
                            </button>
                        </div>
                    </div>
                </div>

                <div class="container px-4 px-lg-5 mt-5">
                    <div class="row gx-4 gx-lg-4 row-cols-md-3 row-cols-xl-4">
                        <?php
                        $where = "";
                        if (count($brands) > 0)
                            $where = " and p.brand_id in (" . implode(",", $brands) . ") ";
                        $products = $conn->query("SELECT p.*,b.name as bname,c.category FROM `products` p inner join brands b on p.brand_id = b.id inner join categories c on p.category_id = c.id where p.status = 1 {$where} order by rand() ");
                        while ($row = $products->fetch_assoc()):
                            $upload_path = base_app . '/uploads/product_' . $row['id'];
                            $img = "";
                            if (is_dir($upload_path)) {
                                $fileO = scandir($upload_path);
                                if (isset($fileO[2]))
                                    $img = "uploads/product_" . $row['id'] . "/" . $fileO[2];
                            }
                            foreach ($row as $k => $v) {
                                $row[$k] = trim(stripslashes($v));
                            }
                            $inventory = $conn->query("SELECT distinct(`price`) FROM inventory where product_id = " . $row['id'] . " order by `price` asc");
                            $inv = array();
                            while ($ir = $inventory->fetch_assoc()) {
                                $inv[] = format_num($ir['price']);
                            }
                            $price = '';
                            if (isset($inv[0]))
                                $price .= $inv[0];
                            if (count($inv) > 1) {
                                $price .= " ~ " . $inv[count($inv) - 1];
                            }
                            ?>
                            <div class="col mb-5">
                                <a class="card product-item text-reset text-decoration-none"
                                    href=".?p=view_product&id=<?php echo md5($row['id']) ?>">
                                    <!-- Product image-->
                                    <div class="overflow-hidden shadow product-holder">
                                        <img class="card-img-top w-100 product-cover"
                                            src="<?php echo validate_image($img) ?>" alt="..." />
                                    </div>
                                    <!-- Product details-->
                                    <div class="card-body p-4">
                                        <div class="">
                                            <!-- Product name-->
                                            <h5 class="fw-bolder"><?php echo $row['name'] ?></h5>
                                            <!-- Product price-->
                                            <span><b class="text-muted">Preț: </b><?php echo $price . ' RON' ?></span>
                                        </div>
                                        <p class="m-0"><small><span class="text-muted">Brand:</span>
                                                <?php echo $row['bname'] ?></small></p>
                                        <p class="m-0"><small><span class="text-muted">Categoria:</span>
                                                <?php echo $row['category'] ?></small></p>
                                    </div>
                                </a>
                            </div>
                        <?php endwhile; ?>
                    </div>
                </div>

                <!-- Ad and Video Section -->
                <div class="ad-video-section">
                    <div class="ad-section">
                        <h2 class="section-title">Alte Produse</h2>
                        <div class="row gx-4 gx-lg-4 row-cols-md-2 row-cols-xl-2">
                            <!-- Product ad items -->
                            <?php
                            $ad_products = $conn->query("SELECT p.*, b.name as bname FROM `products` p INNER JOIN `brands` b ON p.brand_id = b.id WHERE p.status = 1 ORDER BY RAND() LIMIT 4");
                            while ($ad_row = $ad_products->fetch_assoc()):
                                $ad_upload_path = base_app . '/uploads/product_' . $ad_row['id'];
                                $ad_img = "";
                                if (is_dir($ad_upload_path)) {
                                    $ad_fileO = scandir($ad_upload_path);
                                    if (isset($ad_fileO[2]))
                                        $ad_img = "uploads/product_" . $ad_row['id'] . "/" . $ad_fileO[2];
                                }
                                foreach ($ad_row as $k => $v) {
                                    $ad_row[$k] = trim(stripslashes($v));
                                }
                                ?>
                                <div class="col mb-5">
                                    <a class="card product-item text-reset text-decoration-none"
                                        href=".?p=view_product&id=<?php echo md5($ad_row['id']) ?>">
                                        <!-- Product image-->
                                        <div class="overflow-hidden shadow product-holder">
                                            <img class="card-img-top w-100 product-cover"
                                                src="<?php echo validate_image($ad_img) ?>" alt="..." />
                                        </div>
                                        <!-- Product details-->
                                        <div class="card-body p-4">
                                            <div class="">
                                                <!-- Product name-->
                                                <h5 class="fw-bolder"><?php echo $ad_row['name'] ?></h5>
                                                <!-- Product price-->
                                                <span><b class="text-muted">Preț: </b><?php echo $price . ' RON' ?></span>
                                            </div>
                                            <p class="m-0"><small><span class="text-muted">Brand:</span>
                                                    <?php echo $ad_row['bname'] ?></small></p>
                                        </div>
                                    </a>
                                </div>
                            <?php endwhile; ?>
                        </div>
                    </div>
                    <div class="video-container">
                        <video autoplay loop muted>
                            <source src="uploads/gallery/video.mp4" type="video/mp4">
                            Browser-ul dumneavoastră nu suportă elementul video.
                        </video>
                    </div>
                </div>

                <!-- Gallery Section -->
                <div class="gallery-section">
                    <h2 class="section-title">Tunsori realizate cu produsele noastre</h2>
                    <div class="gallery-container">
                        <img src="uploads/gallery/ptuns1.jpg" alt="Foto 1">
                        <img src="uploads/gallery/ptuns2.jpg" alt="Foto 2">
                        <img src="uploads/gallery/ptuns3.jpg" alt="Foto 3">
                        <img src="uploads/gallery/ptuns4.jpg" alt="Foto 4">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function _filter() {
        var brands = []
        $('.brand-item:checked').each(function () {
            brands.push($(this).val())
        })
        _b = JSON.stringify(brands)
        var checked = $('.brand-item:checked').length
        var total = $('.brand-item').length
        if (checked == total)
            location.href = "./?";
        else
            location.href = "./?b=" + encodeURI(_b);
    }

    function check_filter() {
        var checked = $('.brand-item:checked').length
        var total = $('.brand-item').length
        if (checked == total) {
            $('#brandAll').attr('checked', true)
        } else {
            $('#brandAll').attr('checked', false)
        }
        if ('<?php echo isset($_GET['b']) ?>' == '')
            $('#brandAll,.brand-item').attr('checked', true)
    }

    $(function () {
        check_filter()
        $('#brandAll').change(function () {
            if ($(this).is(':checked') == true) {
                $('.brand-item').attr('checked', true)
            } else {
                $('.brand-item').attr('checked', false)
            }
            _filter()
        })
        $('.brand-item').change(function () {
            _filter()
        })
    })
</script>


