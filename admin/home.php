<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Bine ai venit</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <style>
    .info-box-icon {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100px;
      width: 100px;
      font-size: 2rem;
      color: white;
    }

    .bg-blue {
      background-color: #007bff;
    }

    .bg-dark-blue {
      background-color: #214cce;
    }

    .bg-navy {
      background-color: #00008B;
    }

    .bg-light-blue {
      background-color: #839deb;
    }

    .info-box {
      display: flex;
      background: #f8f9fa;
      border-radius: 0.25rem;
      margin-bottom: 1rem;
      box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
    }

    .info-box-content {
      flex: 1;
      padding: 0.5rem 1rem;
    }
  </style>
</head>

<body>
  <div class="container">
    <h1>Bine ai venit la <?php echo $_settings->info('name') ?></h1>
    <hr>
    <div class="row">
      <div class="col-12 col-sm-6 col-md-3">
        <div class="info-box">
          <span class="info-box-icon bg-blue elevation-1"><i class="fas fa-boxes"></i></span>
          <div class="info-box-content">
            <span class="info-box-text">Stocuri</span>
            <span class="info-box-number">
              <?php
              $inv = $conn->query("SELECT sum(quantity) as total FROM inventory ")->fetch_assoc()['total'];
              $sales = $conn->query("SELECT sum(quantity) as total FROM order_list where order_id in (SELECT order_id FROM sales) ")->fetch_assoc()['total'];
              echo number_format($inv - $sales);
              ?>
            </span>
          </div>
        </div>
      </div>
      <div class="col-12 col-sm-6 col-md-3">
        <div class="info-box mb-3">
          <span class="info-box-icon bg-dark-blue elevation-1"><i class="fas fa-clock"></i></span>
          <div class="info-box-content">
             <span class="info-box-text">Comenzi neplătite</span>
            <span class="info-box-number">
              <?php
              $pending = $conn->query("SELECT * FROM `orders` where paid = '1' ")->num_rows;
              echo number_format($pending);
              ?>
            </span>
          </div>
        </div>
      </div>
      <div class="col-12 col-sm-6 col-md-3">
        <div class="info-box mb-3">
          <span class="info-box-icon bg-navy elevation-1"><i class="fas fa-shopping-cart"></i></span>
          <div class="info-box-content">
            <span class="info-box-text">Vânzări totale 2024</span>
            <span class="info-box-number">
              <?php
              $sales = $conn->query("SELECT sum(amount) as total FROM `orders`")->fetch_assoc()['total'];
              echo number_format($sales);
              ?>
            </span>
          </div>
        </div>
      </div>
      <div class="col-12 col-sm-6 col-md-3">
        <div class="info-box mb-3">
          <span class="info-box-icon bg-light-blue elevation-1"><i class="fas fa-user-friends"></i></span>
          <div class="info-box-content">
            <span class="info-box-text">Clienți înregistrați</span>
            <span class="info-box-number">
              <?php
              $sales = $conn->query("SELECT * FROM `clients` where delete_flag = 0 ")->num_rows;
              echo number_format($sales);
              ?>
            </span>
          </div>
        </div>
      </div>
    </div>
    <div id="tourCarousel" class="carousel slide" data-ride="carousel" data-interval="3000">
      <div class="carousel-inner h-100">
        <?php
        $files = array();
        $fopen = scandir(base_app . 'uploads/banner');
        foreach ($fopen as $fname) {
          if (in_array($fname, array('.', '..')))
            continue;
          $files[] = validate_image('uploads/banner/' . $fname);
        }
        foreach ($files as $k => $img):
          ?>
          <div class="carousel-item h-100 <?php echo $k == 0 ? 'active' : '' ?>">
            <img class="d-block w-100 h-100" style="object-fit:contain" src="<?php echo $img ?>" alt="">
          </div>
        <?php endforeach; ?>
      </div>
      <a class="carousel-control-prev text-black" href="#tourCarousel" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Înapoi</span>
      </a>
      <a class="carousel-control-next text-black" href="#tourCarousel" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Înainte</span>
      </a>
    </div>
  </div>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>