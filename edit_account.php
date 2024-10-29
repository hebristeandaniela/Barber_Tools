<section class="py-5">
    <div class="container">
        <div class="card rounded-0">
            <div class="card-body">
                <div class="w-100 justify-content-between d-flex">
                    <h4><b>Actualizează detaliile contului</b></h4>
                    <a href="./?p=my_account" class="btn btn btn-default btn-flat text-white" style="background-image: linear-gradient(to bottom, #004c99, #001a33);"><div class="fa fa-angle-left"></div> Înapoi la lista de comenzi</a>
                </div>
                    <hr class="border-warning">
                    <div class="col-md-6">
                        <form action="" id="update_account">
                        <input type="hidden" name="id" value="<?php echo $_settings->userdata('id') ?>">
                            <div class="form-group">
                                <label for="firstname" class="control-label">Numele</label>
                                <input type="text" name="firstname" class="form-control form" value="<?php echo $_settings->userdata('firstname') ?>" required>
                            </div>
                            <div class="form-group">
                                <label for="lastname" class="control-label">Prenumele</label>
                                <input type="text" name="lastname" class="form-control form" value="<?php echo $_settings->userdata('lastname') ?>" required>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label">Contact</label>
                                <input type="text" class="form-control form-control-sm form" name="contact" value="<?php echo $_settings->userdata('contact') ?>" required>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label">Gen</label>
                                <select name="gender" id="" class="custom-select select" required>
                                    <option <?php echo $_settings->userdata('gender') == "Male" ? "selected" : '' ?>>Bărbat</option>
                                    <option <?php echo $_settings->userdata('gender') == "Female" ? "selected" : '' ?>>Femeie</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label">Adresă de livrare implicită</label>
                                <textarea class="form-control form" rows='3' name="default_delivery_address"><?php echo $_settings->userdata('default_delivery_address') ?></textarea>
                            </div>
                            <div class="form-group">
                                <label for="email" class="control-label">Email</label>
                                <input type="text" name="email" class="form-control form" value="<?php echo $_settings->userdata('email') ?>" required>
                            </div>
                            <div class="form-group">
                                <label for="password" class="control-label">Parola nouă</label>
                                <input type="password" name="password" class="form-control form" value="" placeholder="(Enter value to change password)">
                                <small class="text-muted"><i>Lasă acest câmp gol dacă nu dorești să-ți actualizezi parola.</i></small>
                            </div>
                            <div class="form-group">
                                <label for="cpassword" class="control-label">Parola curentă</label>
                                <input type="password" name="cpassword" class="form-control form" value="" required>
                                <small class="text-muted"><i>Introdu parola ta actuală pentru a-ți actualiza detaliile.</i></small>
                            </div>
                            <div class="form-group d-flex justify-content-end">
                                <button class="btn btn-dark btn-flat">Actualizează</button>
                            </div>
                        </form>
                    </div>
            </div>
        </div>
    </div>
</section>
<script>
$(function(){
        $('#update_account').submit(function(e){
            e.preventDefault();
            start_loader()
            if($('.err-msg').length > 0)
                $('.err-msg').remove();
            $.ajax({
                url:_base_url_+"classes/Master.php?f=update_account",
                method:"POST",
                data:$(this).serialize(),
                dataType:"json",
                error:err=>{
                    console.log(err)
                    alert_toast("A apărut o eroare!",'error')
                    end_loader()
                },
                success:function(resp){
                    if(typeof resp == 'object' && resp.status == 'success'){
                        location.reload()
                    }else if(resp.status == 'failed' && !!resp.msg){
                        var _err_el = $('<div>')
                            _err_el.addClass("alert alert-danger err-msg").text(resp.msg)
                        $('#update_account').prepend(_err_el)
                        $('body, html').animate({scrollTop:0},'fast')
                        end_loader()
                        
                    }else{
                        console.log(resp)
                        alert_toast("A apărut o eroare!",'error')
                    }
                    end_loader()
                }
            })
        })
    })
</script>