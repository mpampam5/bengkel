
  <!-- /header -->

  <!-- main -->
  <div >

    <section class="hero hero-profile" style="background-image: url('<?=base_url()?>temp/public/header-menu.png');min-height:250px;">
      <img class="img-header" src="<?=base_url()?>temp/public/img-header.png" alt="">
      <h5 class="logo-menu"><?=profile('nama_bengkel')?></h5>
    </section>


    <section class="m-t-20">
      <div class="container">
        <div class="col-lg-8 mx-auto">
          <div class="row">


                <div class="col-6">
                  <div id="box-menu">
                    <a href="<?=site_url('maps')?>">
                    <img src="<?=base_url()?>temp/public/icon/menu-route.png" alt="">
                    <p class="text-menu">Mulai Perjalanan</p>
                    </a>
                  </div>
                </div>

                <div class="col-6">
                  <div id="box-menu">
                    <a href="<?=site_url('service')?>">
                    <img src="<?=base_url()?>temp/public/icon/menu-car-service.png" alt="">
                    <p class="text-menu">Perbaikan & Perawatan</p>
                    </a>
                  </div>
                </div>

                <div class="col-6">
                  <div id="box-menu">
                    <a href="<?=site_url('profile')?>">
                    <img src="<?=base_url()?>temp/public/icon/menu-profile.png" alt="">
                    <p class="text-menu">Profile</p>
                    </a>
                  </div>
                </div>

                <div class="col-6">
                  <div id="box-menu">
                    <a href="<?=site_url('tentang')?>">
                    <img src="<?=base_url()?>temp/public/icon/menu-info2.png" alt="">
                    <p class="text-menu">Informasi Bengkel</p>
                    </a>
                  </div>
                </div>

          </div>
        </div>
      </div>
    </section>
    <!-- /main -->

  </div>
