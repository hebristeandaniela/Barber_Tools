
<?php 
$total = 0;
    $qry = $conn->query("SELECT c.*,p.name,i.price,p.id as pid from `cart` c inner join `inventory` i on i.id=c.inventory_id inner join products p on p.id = i.product_id where c.client_id = ".$_settings->userdata('id'));
    while($row= $qry->fetch_assoc()):
        $total += $row['price'] * $row['quantity'];
    endwhile;
?>
<section class="py-5">
    <div class="container">
        <div class="card rounded-0">
            <div class="card-body"></div>
            <h3 class="text-center"><b>Finalizare comandă</b></h3>
            <hr class="border-dark">
            <form action="" id="place_order">
                <input type="hidden" name="amount" value="<?php echo $total .' RON'?>">
                <input type="hidden" name="payment_method" value="cash">
                <input type="hidden" name="paid" value="0">
                <div class="row row-col-1 justify-content-center">
                    <div class="col-6">
                        <div class="form-group col address-holder">
                            <label for="" class="control-label">Adresă de livrare</label>
                            <textarea id="" cols="30" rows="3" name="delivery_address" class="form-control" style="resize:none"><?php echo $_settings->userdata('default_delivery_address') ?></textarea>
                        </div>
                        <div class="col">
                            <span><h4><b>Total:</b> <?php echo number_format($total) .' RON'?></h4></span>
                        </div>
                        <hr>
                        <div class="col my-3 mb-10">
                        <h4 class="text-muted">Metoda de plată</h4>
                            <div class="d-flex w-100 justify-content-between">
                                <button type="submit" class="btn btn-flat btn-dark">Plata la livrare</button>
                               
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>
<script>

$(function(){
    $('[name="order_type"]').change(function(){
        if($(this).val() ==2){
            $('.address-holder').hide('slow')
        }else{
            $('.address-holder').show('slow')
        }
    })
    $('#place_order').submit(function(e){
        e.preventDefault()
        start_loader();
        $.ajax({
            url:'classes/Master.php?f=place_order',
            method:'POST',
            data:$(this).serialize(),
            dataType:"json",
            error:err=>{
                console.log(err)
                alert_toast("A apărut o eroare!","error")
                end_loader();
            },
            success:function(resp){
                if(!!resp.status && resp.status == 'success'){
                    location.replace('./')
                }else{
                    console.log(resp)
                    alert_toast("A apărut o eroare!","error")
                    end_loader();
                }
            }
        })
    })
})
</script>